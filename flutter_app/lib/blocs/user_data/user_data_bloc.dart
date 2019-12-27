/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';
import 'package:merge_map/merge_map.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/user_data/user_data.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Aggregates and manages authentication and settings.
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository userRepository;

  final SettingsRepository settingsRepository;

  UserDataLoaded get loadedState => state as UserDataLoaded;

  /// Current user's id.
  String get userId => loadedState.authentication.uid;

  StreamSubscription<UserDataEvent> _userDataEventSubscription;

  UserDataBloc({@required this.userRepository, @required this.settingsRepository})
    : assert(userRepository != null), assert(settingsRepository != null);

  @override
  UserDataState get initialState => UserDataUninitialized();

  @override
  Future<void> close() {
    _userDataEventSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is InitUserData) {
      final auth$ = Observable<Authentication>(userRepository.authStateChanged$());

      final onboard$ = auth$
        .where((auth) => auth == null)
        .mapTo<UserDataEvent>(OnboardUser());

      // TODO: retry x times, with delay between each attempt
      final dataArrival$ = auth$
        .where((auth) => auth != null)
        .switchMap<UserDataEvent>((auth) => CombineLatestStream.combine4(
          userRepository.userDocument$(auth.uid),
          settingsRepository.defaultSettings$(),
          Observable(settingsRepository.userSettings$(auth.uid)).startWith(null),
          Observable<SubscriptionType>.just(SubscriptionType.all_access),
          (UserDocument userDocument, Settings defaultSettings, Settings userSettings, SubscriptionType subscriptionType) => IngressUserDataArrived((b) => b
            ..authentication = auth.toBuilder()
            ..userDocument = userDocument.toBuilder()
            ..settings = _mergeSettings(userSettings, defaultSettings).toBuilder()
            // userSettings may be null due to missing firestore document
            ..userSettings = userSettings?.toBuilder() ?? SettingsBuilder()
            ..subscription = subscriptionType
          ),
        ))
        // Unrecoverable failure
        .onErrorReturnWith((dynamic error) => UserDataError((b) => b..error = error));

      // Maintain single instance of stream subscription
      _userDataEventSubscription?.cancel();
      _userDataEventSubscription = Observable(MergeStream([onboard$, dataArrival$]))
        .distinct()
        .listen(add);
    }

    if (event is IngressUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..authentication = event.authentication.toBuilder()
        ..userDocument = event.userDocument.toBuilder()
        ..settings = event.settings.toBuilder()
        ..userSettings = event.userSettings.toBuilder()
        ..subscription = event.subscription
      );

      BlocLogger().info("User data loaded");
    }

    if (event is OnboardUser) {
      yield UserDataUnauthenticated();

      BlocLogger().info("Onboarded user");
    }

    if (event is UserDataError) {
      yield UserDataFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      BlocLogger().unexpectedError("User data failed", event.error, event.stacktrace);
    }

    ///    ######  ######## ######## ######## #### ##    ##  ######    ######
    ///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
    ///   ##       ##          ##       ##     ##  ####  ## ##        ##
    ///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
    ///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
    ///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
    ///    ######  ########    ##       ##    #### ##    ##  ######    ######

    if (event is UpdateDarkMode) {
      _saveUserSettings(event, (sb) => sb..theme.update((b) => b
        ..darkMode = event.darkMode
      ));
    }

    if (event is UpdatePrimaryColour) {
      _saveUserSettings(event, (sb) => sb..theme.update((b) => b
        ..primaryColour = event.colourValue.asHexNumber
      ));
    }
  }

  /// ...
  Future<void> _saveUserSettings(Completable event, void Function(SettingsBuilder) updates) async {
    assert(event is UserDataEvent);

    if (state is! UserDataLoaded) {
      add(UserDataError((b) => b..error = StateError("User data bloc must be loaded")));
      return;
    }

    try {
      await settingsRepository.saveSettings(userId, loadedState.userSettings.rebuild(updates));

      BlocLogger().info("${event.runtimeType} succeeded");
      event.completer?.complete();
    } catch(error, stacktrace) {
      BlocLogger().unexpectedError("${event.runtimeType} failed", error, stacktrace);
      event.completer?.completeError(error, stacktrace);
    }
  }

  /// Merges user [Settings] with default [Settings] field-by-field.
  /// Default settings are used unless explicitly overwritten by user's custom settings.
  Settings _mergeSettings(Settings userSettings, Settings defaultSettings) {
    ArgumentError.checkNotNull(defaultSettings, "Default settings");

    // userSettings may be null due to missing firestore document
    if (userSettings == null) {
      return defaultSettings;
    }

    // Serialize settings into JSON
    final jsonSettings = jsonSerializers.serialize(userSettings);
    final jsonDefaultSettings = jsonSerializers.serialize(defaultSettings);

    // Deep merge JSON using `merge_map` library
    final mergedJsonSettings = mergeMap<String, dynamic>([jsonDefaultSettings, jsonSettings]);

    // Deserialize settings
    return jsonSerializers.deserialize(mergedJsonSettings);
  }
}


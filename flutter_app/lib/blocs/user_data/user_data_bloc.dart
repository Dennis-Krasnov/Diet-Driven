/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:merge_map/merge_map.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Aggregates and manages authentication and settings.
/// App shows skeleton navigation until [UserDataBloc] is loaded.
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository userRepository;
  final SettingsRepository settingsRepository;

  StreamSubscription<UserDataEvent> _userDataEventSubscription;

  UserDataBloc({@required this.userRepository, @required this.settingsRepository})
    : assert(userRepository != null), assert(settingsRepository != null);

  @override
  UserDataState get initialState => UserDataUninitialized();

  @override
  void dispose() {
    _userDataEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is InitUserData) {
      if (currentState is! UserDataUninitialized) {
        dispatch(UserDataError((b) => b..error = StateError("User data bloc must be uninitialized")));
        return;
      }

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
          Observable<SubscriptionType>.just(SubscriptionType.all_access), // TODO: (List<PurchaseDetails> purchases).map(...) from https://github.com/flutter/plugins/tree/master/packages/in_app_purchase
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
        .onErrorReturnWith((dynamic error) => UserDataError((b) => b..error = error))
        .distinct();

      // Maintain single instance of stream subscription
      _userDataEventSubscription ??= Observable(MergeStream([onboard$, dataArrival$])).listen(dispatch);
    }

    if (event is IngressUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..authentication = event.authentication.toBuilder()
        ..userDocument = event.userDocument.toBuilder()
        ..settings = event.settings.toBuilder()
        ..userSettings = event.userSettings.toBuilder()
        ..subscription = event.subscription
      );

      LoggingBloc().info("User data loaded");
    }

    if (event is OnboardUser) {
      yield UserDataUnauthenticated();

      LoggingBloc().info("Onboarded user");
    }

    if (event is UserDataError) {
      yield UserDataFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      LoggingBloc().unexpectedError("User data failed", event.error, event.stacktrace);
    }

    ///    ######  ######## ######## ######## #### ##    ##  ######    ######
    ///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
    ///   ##       ##          ##       ##     ##  ####  ## ##        ##
    ///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
    ///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
    ///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
    ///    ######  ########    ##       ##    #### ##    ##  ######    ######

    if (event is UpdateDarkMode) {
      if (currentState is! UserDataLoaded) {
        dispatch(UserDataError((b) => b..error = StateError("User data bloc must be loaded")));
        return;
      }

      try {
        final settingsBuilder = _userSettings.toBuilder()
          ..themeSettings.update((b) => b
            ..darkMode = event.darkMode
          );

        await settingsRepository.saveSettings(userId, settingsBuilder.build());

        LoggingBloc().info("Dark mode ${event.darkMode ? "enabled" : "disabled"}");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Dark mode update failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }

    if (event is UpdatePrimaryColour) {
      if (currentState is! UserDataLoaded) {
        dispatch(UserDataError((b) => b..error = StateError("User data bloc must be loaded")));
        return;
      }

      try {
        final settingsBuilder = _userSettings.toBuilder()
          ..themeSettings.update((b) => b
            ..primaryColour = hexNumberCodeToString(event.colourValue)
          );

        await settingsRepository.saveSettings(userId, settingsBuilder.build());

        LoggingBloc().info("Primary colour now ${event.colourValue}");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Primary colour update failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
  }

  /// Current user's id.
  /// Only use when it's certain that [currentState] is [UserDataLoaded].
  String get userId => (currentState as UserDataLoaded).authentication.uid;

  /// Current user's user settings.
  /// Only use when it's certain that [currentState] is [UserDataLoaded].
  Settings get _userSettings => (currentState as UserDataLoaded).userSettings;

  /// Merges user [Settings] with default [Settings] field-by-field.
  /// Default settings are used unless explicitly overwritten by user's custom settings.
  Settings _mergeSettings(Settings userSettings, Settings defaultSettings) {
    ArgumentError.checkNotNull(defaultSettings, "Default settings"); // TOTEST

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


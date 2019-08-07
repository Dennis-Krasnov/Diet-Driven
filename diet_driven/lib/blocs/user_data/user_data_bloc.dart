import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
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
      assert(currentState is UserDataUninitialized);

      final auth$ = Observable<FirebaseUser>(userRepository.authStateChanged$());

      final onboard$ = auth$
        .where((user) => user == null)
        .mapTo<UserDataEvent>(OnboardUser());

      // TODO: retry x times, with delay between each attempt
      final dataArrival$ = auth$
        .where((user) => user != null)
        .switchMap<UserDataEvent>((user) => CombineLatestStream.combine4(
          userRepository.userDocument$(user.uid),
          settingsRepository.defaultSettings$(),
          settingsRepository.userSettings$(user.uid),
          Observable<SubscriptionType>.just(SubscriptionType.all_access), // TODO: (List<PurchaseDetails> purchases) from https://github.com/flutter/plugins/tree/master/packages/in_app_purchase
          (UserDocument userDocument, Settings defaultSettings, Settings userSettings, SubscriptionType subscriptionType) => RemoteUserDataArrived((b) => b
            ..authentication = user
            ..userDocument = userDocument.toBuilder()
            ..settings = _mergeSettings(userSettings, defaultSettings).toBuilder()
            ..userSettings = userSettings.toBuilder()
            ..subscription = subscriptionType
          ),
        ))
        // Unrecoverable failure
        .onErrorReturnWith((dynamic error) => UserDataError((b) => b..error = error))
        .distinct();

      // Maintain single instance of stream subscription
      _userDataEventSubscription ??= Observable(MergeStream([onboard$, dataArrival$])).listen(dispatch);
    }

    if (event is RemoteUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..authentication = event.authentication
        ..userDocument = event.userDocument.toBuilder()
        ..settings = event.settings.toBuilder()
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
    ///

    if (event is UpdateDarkMode) {
      assert(currentState is UserDataLoaded);

      try {
        final settingsBuilder = _userSettings.toBuilder();

        settingsBuilder.themeSettings.update((b) => b
          ..darkMode = event.darkMode
        );

        settingsRepository.replaceSettings(_userId, settingsBuilder.build());
        LoggingBloc().info("Dark mode ${event.darkMode ? "enabled" : "disabled"}");
        event?.completer?.complete();
      } on Exception catch(e) {
        LoggingBloc().info("Dark mode update failed");
        event?.completer?.completeError(e);
      }
    }
  }

  // ONLY IF
//      if (currentState is UserDataLoaded) {
//        final settingsBuilder = _userSettings.toBuilder();
//
//        settingsBuilder.themeSettings.update((b) => b
//          ..darkMode = event.darkMode
//        );
//
//        settingsRepository.replaceSettings(_userId, settingsBuilder.build());
//        event?.completer?.complete();
//        LoggingBloc().info("Dark mode ${event.darkMode ? "enabled" : "disabled"}");
//      }

  /// Current user's id.
  /// Only use when it's certain that [currentState] is [UserDataLoaded].
  String get _userId => (currentState as UserDataLoaded).authentication.uid;

  /// Current user's user settings.
  /// Only use when it's certain that [currentState] is [UserDataLoaded].
  Settings get _userSettings => (currentState as UserDataLoaded).userSettings;

  /// Merges user [Settings] with default [Settings] field-by-field.
  /// Default settings are used unless explicitly overwritten by user's custom settings.
  Settings _mergeSettings(Settings userSettings, Settings defaultSettings) {
    // Serialize settings into JSON
    final jsonSettings = jsonSerializers.serialize(userSettings);
    final jsonDefaultSettings = jsonSerializers.serialize(defaultSettings);

    // Deep merge JSON using `merge_map` library
    final mergedJsonSettings = mergeMap<String, dynamic>([jsonDefaultSettings, jsonSettings]);

    // Deserialize settings
    return jsonSerializers.deserialize(mergedJsonSettings);
  }
}

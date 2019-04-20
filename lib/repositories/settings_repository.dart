import 'package:diet_driven/models/models.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logging/logging.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

/// Data access object for settings and configuration.
class SettingsRepository {
  final Logger log = new Logger("settings repository");

  final RemoteConfigProvider _remoteConfigProvider = RemoteConfigProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();
  // TODO: Connectivity().onConnectivityChanged

  /// Fetches [RemoteConfiguration].
  /// `fetchRemoteConfig()` is called whenever [FetchConfiguration] is dispatched from [ConfigurationBloc].
  ///
  /// Throws [FetchThrottledException] or [Exception] if failed to fetch live Firebase Remote Config data.
  /// Throws [BuiltValueNullFieldError] if remote config is missing parameters.
  Future<RemoteConfiguration> fetchRemoteConfig() async {
    RemoteConfig config = await _remoteConfigProvider.fetchRemoteConfig();

    // Intentionally throws if Firebase Remote Config is invalid
    var configSettings = RemoteConfiguration((b) => b
      ..defaultConfiguration = false
      ..bonus = config.getInt("bonus")
    );

    log.info("successfully loaded config: $configSettings");
    return configSettings;
  }

  /// Fetches [ValueObservable] of [userId]'s [UserDocument].
  /// 'userDocument(userId)` is called for every user from [UserDataBloc].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  ValueObservable<UserDocument> userDocument(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.userDocument(userId).shareValue();
  }

  /// Fetches [ValueObservable] of [userId]'s [Settings].
  /// 'settingsStream(userId)` is called for every user from [UserDataBloc].
  ///
  /// Default user settings are used unless explicitly overwritten the user's settings document.
  /// The latest from both are combined into a single [Settings] stream.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if both Firestore documents doesn't exist.
  ValueObservable<Settings> settingsStream(String userId) {
    Observable<Settings> defaultSettingsStream = _firestoreProvider.defaultSettings();

    return _firestoreProvider.settingsStream(userId)
      // Combine with latest default settings
      .withLatestFrom(defaultSettingsStream, (Settings settings, Settings defaultSettings) =>
        // Use default settings for every respective null field of settings.
        settings.rebuild((b) => b
          ..navigationSettings.update((b) => b
            ..defaultPage ??= defaultSettings.navigationSettings.defaultPage
            ..bottomNavigationPages ??= defaultSettings.navigationSettings.bottomNavigationPages.toBuilder()
          )
        )
      ).shareValue();

    // TODO: fork built value and a create a generated 'mergeInto'/'T replaceNullFieldsWith(T)' method
    // that copies values from src to dest (where null), can also define it as a custom operator.
    // This would remove the need for manual 'merging' repetition.
  }
}

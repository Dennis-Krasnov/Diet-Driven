import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logging/logging.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

class SettingsRepository {
  final Logger log = new Logger("settings repository");

  final RemoteConfigProvider _remoteConfigProvider = RemoteConfigProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  // Throws FetchThrottledException or Exception if failed to fetch remote data
  Future<RemoteConfiguration> fetchRemoteConfig() async {
    RemoteConfig config = await _remoteConfigProvider.fetchRemoteConfig();
    int bonus = config.getInt("bonus"); // TOTEST

    // Set default values ...
    var configSettings = RemoteConfiguration((b) => b
      ..defaultConfiguration = false
      ..bonus = bonus ?? 0
    );

    log.info("successfully loaded config: $configSettings");
    return configSettings;
  }

  ///
  ValueObservable<UserDocument> userDocument(String userId) {
    return _firestoreProvider.userDocument(userId).shareValue();
  }

  ///
  // Throws Exception if improper data arrived
  ValueObservable<Settings> settingsStream(String userId) {
    Observable<Settings> defaultSettingsStream = _firestoreProvider.defaultSettings();

    //
    // TODO: create a generated 'mergeInto' method for built value generator that copies values from src to dest (where null)
    // 'T replaceNullFieldsWith(T)', use a custom operator for this
    return _firestoreProvider.settingsStream(userId)
      .withLatestFrom(defaultSettingsStream, (settings, Settings defaultSettings) => settings.rebuild((b) => b
        ..navigationSettings.update((b) => b
          ..defaultPage ??= defaultSettings.navigationSettings.defaultPage
          ..bottomNavigationPages ??= defaultSettings.navigationSettings.bottomNavigationPages.toBuilder()
        )
      )).shareValue();
  }
}

// Connectivity().onConnectivityChanged

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
    int bonus = config.getInt("bonus");

    print("bonus: $bonus");

    var configSettings = RemoteConfiguration((b) => b
      ..defaultConfiguration = false
      ..bonus = bonus
    );

    log.info("successfully loaded config: $configSettings");
    return configSettings;
  }

  ValueObservable<UserData> userDataDocument(String userId) {
    return _firestoreProvider.userDataDocument(userId).shareValue();
  }

  // Throws Exception if improper data arrived
  ValueObservable<Settings> settingsDocumentsList(String userId) {
    return _firestoreProvider.settingsDocumentList(userId).map((settingsDocuments) =>
      Settings((b) => b
        ..navigationSettings = settingsDocuments.whereType<NavigationSettings>().single.toBuilder()
        // TODO: other settings
      )).shareValue();
  }
}

//subs.connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) => api.actions.connectivityChanged(result));

//return _firestoreProvider.settingsDocumentList(userId).map((settingsDocuments) {
//      try {
//        return Settings((b) => b
//          ..navigationSettings = settingsDocuments.whereType<NavigationSettings>().single.toBuilder()
//          // TODO: other settings
//        );
//      } on StateError catch(e) {
//        log.severe("invalid settings format received: $e");
//        return null;
//      }
//    }).shareValue();

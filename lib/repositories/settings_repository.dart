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

  Future<RemoteConfiguration> fetchRemoteConfig() async {
    try {
      RemoteConfig config = await _remoteConfigProvider.fetchRemoteConfig();
      int bonus = config.getInt("bonus");

      print("bonus: $bonus");

      var configSettings = RemoteConfiguration((b) => b
        ..defaultConfiguration = false
        ..bonus = bonus
      );

      log.info("successfully loaded config: $configSettings");
      return configSettings;
    } on FetchThrottledException catch (exception) {
      log.warning('Fetch throttled!');
      log.fine(exception);
      return null;
    } catch (exception) {
      log.warning('Unable to fetch remote config. Cached or default values will be used');
      log.fine(exception);
      return null;
    }
  }

  ValueObservable<UserData> userDataDocument(String userId) {
    return _firestoreProvider.userDataDocument(userId).shareValue();
  }

  ValueObservable<BuiltList<SettingsDocument>> settingsDocumentsList(String userId) {
    // OPTIMIZE: I'm unsubscribing in bloc, userId may change! (food diary repo)
    return _firestoreProvider.settingsDocumentList(userId).shareValue();
  }


}

//subs.connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) => api.actions.connectivityChanged(result));
//
////
//subs.authSubscription = auth.onAuthStateChanged.listen((FirebaseUser fbUser) => api.actions.user.authStateChanged(fbUser));
//
//// TODO: extract into async function
//// Call remote config when launching app
//RemoteConfig config = await RemoteConfig.instance;
//
//// Default parameters
//config.setDefaults(<String, dynamic>{
//'bonus': 1,
//});
//
//// Enable developer mode to relax fetch throttling
//await config.setConfigSettings(RemoteConfigSettings(debugMode: true));
//
//try {
//await config.fetch(expiration: const Duration(seconds: 0)); // FIXME
//await config.activateFetched();
//api.actions.firestore.remoteConfigReceived(config);
//
//} on FetchThrottledException catch (exception) {
//log.shout('Fetch throttled!');
//log.shout(exception);
//api.actions.firestore.remoteConfigReceived(null);
//} catch (exception) {
//log.shout('Unable to fetch remote config. Cached or default values will be used');
//log.shout(exception);
//api.actions.firestore.remoteConfigReceived(null);
//}

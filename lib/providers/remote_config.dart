import 'package:firebase_remote_config/firebase_remote_config.dart';

///
class RemoteConfigProvider {

  ///
  Future<RemoteConfig> fetchRemoteConfig() async {
    RemoteConfig config = await RemoteConfig.instance;

    // Default parameters
    config.setDefaults(<String, dynamic>{
      'bonus': 1,
    });

    // Developer mode to relax fetch throttling
    await config.setConfigSettings(RemoteConfigSettings(debugMode: true));

    await config.fetch(expiration: const Duration(seconds: 0));
    bool different = await config.activateFetched();

    return config;
  }
}

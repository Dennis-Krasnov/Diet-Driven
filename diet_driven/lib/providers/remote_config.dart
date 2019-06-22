import 'package:firebase_remote_config/firebase_remote_config.dart';

/// Firebase Remote Config provider.
/// https://firebase.google.com/products/remote-config/
class RemoteConfigProvider {

  /// Fetches [RemoteConfiguration] from Firebase Remote Config.
  ///
  /// Throws [FetchThrottledException] or [Exception] if failed to fetch live Firebase Remote Config data.
  Future<RemoteConfig> fetchRemoteConfig() async {
    RemoteConfig config = await RemoteConfig.instance;

    // Developer mode to relax fetch throttling
    await config.setConfigSettings(RemoteConfigSettings(debugMode: true)); // FIXME

    await config.fetch(expiration: const Duration(hours: 6));
    // ignore: unused_local_variable
    bool differentFromCurrentlyActivated = await config.activateFetched();

    return config;
  }
}

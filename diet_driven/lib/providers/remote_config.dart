import 'package:diet_driven/models/models.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

/// Firebase Remote Config provider.
/// https://firebase.google.com/products/remote-config/
class RemoteConfigProvider {

  /// Fetches [RemoteConfiguration] from Firebase Remote Config.
  ///
  /// Throws [FetchThrottledException] or [Exception] if failed to fetch live Firebase Remote Config data.
  Future<RemoteConfiguration> fetchRemoteConfig() async {
    final config = await RemoteConfig.instance;

    // Developer mode to relax fetch throttling (> 5 requests per hour)
    await config.setConfigSettings(RemoteConfigSettings(debugMode: true));

    await config.fetch(expiration: const Duration(hours: 6));

    // ignore: unused_local_variable
    final differentFromCurrentlyActivated = await config.activateFetched();

    final remoteConfiguration = RemoteConfiguration((b) => b
        ..liveConfiguration = true
        ..bonus = config.getInt("bonus")
    );

    return remoteConfiguration;
  }
}

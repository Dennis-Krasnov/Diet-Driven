/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:connectivity/connectivity.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';

import 'package:diet_driven/models/models.dart';

/// Data access object for runtime configuration using `firebase_remote_config` library.
class ConfigurationRepository {
  final Future<RemoteConfig> _remoteConfig;
  final Future<PackageInfo> _packageInfo;
  final Connectivity _connectivity;

  // Dependency injection
  ConfigurationRepository({RemoteConfig remoteConfig, PackageInfo packageInfo, Connectivity connectivity})
    : _remoteConfig = remoteConfig ?? RemoteConfig.instance,
      _packageInfo = packageInfo ?? PackageInfo.fromPlatform(),
      _connectivity = connectivity ?? Connectivity();

  /// Fetches [RemoteConfiguration].
  /// `Future.sync()` runs future immediately to enable proper exception handling.
  ///
  /// Throws [FetchThrottledException] or [Exception] on failure to fetch live Firebase Remote Config data.
  /// Throws [BuiltValueNullFieldError] on failure to create built object due to missing fields.
  Future<RemoteConfiguration> fetchRemoteConfig() => Future.sync(() async {
    final config = await _remoteConfig;

    // Developer mode to relax fetch throttling (> 5 requests per hour)
    await config.setConfigSettings(RemoteConfigSettings(debugMode: true));

    // Defaults to 12h expiration
    await config.fetch();

    // Makes fetched key-values take effect
    await config.activateFetched();

    return RemoteConfiguration((b) => b
      ..liveConfiguration = true
      ..bonus = config.getInt("landing_page_version") // OPTIMIZE
    );
  });

  /// Fetches [PackageInformation] using `package_info` library.
  Future<PackageInformation> fetchPackageInfo() async => PackageInformation.fromPackageInfo(await _packageInfo);

  /// Streams [ConnectivityResult] using `connectivity` library.
  Stream<ConnectivityStatus> connectivity$() => _connectivity.onConnectivityChanged.map(ConnectivityStatus.fromConnectivity);
}
/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:connectivity/connectivity.dart' show ConnectivityResult;
import 'package:package_info/package_info.dart' show PackageInfo;

part 'configuration.g.dart';

/// Remote config.
abstract class RemoteConfiguration implements Built<RemoteConfiguration, RemoteConfigurationBuilder> {
  bool get liveConfiguration;
  int get bonus;

  factory RemoteConfiguration([void Function(RemoteConfigurationBuilder b)]) = _$RemoteConfiguration;
  RemoteConfiguration._();
}

abstract class RemoteConfigurationBuilder implements Builder<RemoteConfiguration, RemoteConfigurationBuilder> {
  bool liveConfiguration = false;
  int bonus = 0;

  factory RemoteConfigurationBuilder() = _$RemoteConfigurationBuilder;
  RemoteConfigurationBuilder._();
}

/// Application metadata provides application bundle information on iOS and
/// application package information on Android.
abstract class PackageInformation implements Built<PackageInformation, PackageInformationBuilder> {
  /// `CFBundleDisplayName` on iOS, `application/label` on Android.
  String get appName;

  /// `bundleIdentifier` on iOS, `getPackageName` on Android.
  String get packageName;

  /// `CFBundleShortVersionString` on iOS, `versionName` on Android.
  String get version;

  /// `CFBundleVersion` on iOS, `versionCode` on Android.
  String get buildNumber;

  factory PackageInformation([void Function(PackageInformationBuilder b)]) = _$PackageInformation;
  PackageInformation._();

  /// [PackageInformation] from `package_info` library.
  factory PackageInformation.fromPackageInfo(PackageInfo packageInfo) => PackageInformation((b) => b
    ..appName = packageInfo.appName
    ..packageName = packageInfo.packageName
    ..version = packageInfo.version
    ..buildNumber = packageInfo.buildNumber
  );
}

/// Connection status check result.
class ConnectivityStatus extends EnumClass {

  /// Device connected via Wi-Fi.
  static const ConnectivityStatus wifi = _$wifi;

  /// Device connected to cellular network.
  static const ConnectivityStatus mobile = _$mobile;

  /// None: Device not connected to any network.
  static const ConnectivityStatus disconnected = _$disconnected;

  /// [ConnectivityStatus] transformation from `connectivity` library.
  static ConnectivityStatus fromConnectivity(ConnectivityResult connectivityResult) {
    switch(connectivityResult) {
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wifi;
        break;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.mobile;
        break;
      case ConnectivityResult.none:
        return ConnectivityStatus.disconnected;
        break;
      default:
        throw UnimplementedError();
    }
  }

  const ConnectivityStatus._(String name) : super(name);

  static BuiltSet<ConnectivityStatus> get values => _$values;
  static ConnectivityStatus valueOf(String name) => _$valueOf(name);
}
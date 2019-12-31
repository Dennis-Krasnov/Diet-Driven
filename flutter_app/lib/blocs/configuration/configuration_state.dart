/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/utils/utils.dart';

part 'configuration_state.g.dart';

abstract class ConfigurationState {}

/// Global splash page.
abstract class ConfigurationUninitialized implements ConfigurationState, Built<ConfigurationUninitialized, ConfigurationUninitializedBuilder> {
  factory ConfigurationUninitialized([void Function(ConfigurationUninitializedBuilder b)]) = _$ConfigurationUninitialized;
  ConfigurationUninitialized._();
}

/// Global error page.
abstract class ConfigurationFailed implements BuiltError, ConfigurationState, Built<ConfigurationFailed, ConfigurationFailedBuilder> {
  factory ConfigurationFailed([void Function(ConfigurationFailedBuilder b)]) = _$ConfigurationFailed;
  ConfigurationFailed._();
}

/// Application.
abstract class ConfigurationLoaded implements ConfigurationState, Built<ConfigurationLoaded, ConfigurationLoadedBuilder> {
  /// Firebase remote config data.
  RemoteConfiguration get remoteConfiguration;

  /// App information.
  PackageInformation get packageInfo;

  /// Internet connection status.
  ConnectivityStatus get connectivity;

  factory ConfigurationLoaded([void Function(ConfigurationLoadedBuilder b)]) = _$ConfigurationLoaded;
  ConfigurationLoaded._();
}

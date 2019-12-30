/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/utils/utils.dart';

part 'configuration_events.g.dart';

abstract class ConfigurationEvent {}

/// Subscribes to data streams.
abstract class InitConfiguration implements ConfigurationEvent, Built<InitConfiguration, InitConfigurationBuilder> {
  factory InitConfiguration([void Function(InitConfigurationBuilder) updates]) = _$InitConfiguration;
  InitConfiguration._();
}

/// Reactively updates current [remoteConfiguration], [packageInfo], [connectivity].
abstract class IngressConfigurationArrived implements ConfigurationEvent, Built<IngressConfigurationArrived, IngressConfigurationArrivedBuilder> {
  RemoteConfiguration get remoteConfiguration;

  PackageInformation get packageInfo;

  ConnectivityStatus get connectivity;

  factory IngressConfigurationArrived([void Function(IngressConfigurationArrivedBuilder) updates]) = _$IngressConfigurationArrived;
  IngressConfigurationArrived._();
}

/// Throws unrecoverable exception.
abstract class ConfigurationError implements BuiltError, ConfigurationEvent, Built<ConfigurationError, ConfigurationErrorBuilder> {
  factory ConfigurationError([void Function(ConfigurationErrorBuilder) updates]) = _$ConfigurationError;
  ConfigurationError._();
}

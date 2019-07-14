import 'package:built_value/built_value.dart';
import 'package:connectivity/connectivity.dart' show ConnectivityResult;
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:package_info/package_info.dart' show PackageInfo;

import 'package:diet_driven/models/models.dart';

part 'configuration_events.g.dart';

abstract class ConfigurationEvent {}

/// Subscribes to data streams.
abstract class InitConfiguration implements ConfigurationEvent, Built<InitConfiguration, InitConfigurationBuilder> {
  factory InitConfiguration([void Function(InitConfigurationBuilder) updates]) = _$InitConfiguration;
  InitConfiguration._();

  @override String toString() => runtimeType.toString();
}

/// Reactively updates current [RemoteConfiguration], [PackageInfo], [ConnectivityResult].
abstract class RemoteConfigurationArrived implements ConfigurationEvent, Built<RemoteConfigurationArrived, RemoteConfigurationArrivedBuilder> {
  RemoteConfiguration get remoteConfiguration;

  PackageInfo get packageInfo;

  ConnectivityResult get connectivity;

  factory RemoteConfigurationArrived([void Function(RemoteConfigurationArrivedBuilder) updates]) = _$RemoteConfigurationArrived;
  RemoteConfigurationArrived._();
}

/// Throws unrecoverable exception.
abstract class ConfigurationError implements BuiltError, ConfigurationEvent, Built<ConfigurationError, ConfigurationErrorBuilder> {
  factory ConfigurationError([void Function(ConfigurationErrorBuilder) updates]) = _$ConfigurationError;
  ConfigurationError._();
}

import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';
import 'package:package_info/package_info.dart' show PackageInfo;

part 'configuration_events.g.dart';

abstract class ConfigurationEvent {}

/// Reactively updates current [RemoteConfiguration], [PackageInfo]; shows application.
abstract class RemoteConfigurationArrived implements ConfigurationEvent, Built<RemoteConfigurationArrived, RemoteConfigurationArrivedBuilder> {
  RemoteConfiguration get remoteConfiguration;

  PackageInfo get packageInfo;

  factory RemoteConfigurationArrived([void Function(RemoteConfigurationArrivedBuilder) updates]) = _$RemoteConfigurationArrived;
  RemoteConfigurationArrived._();
}

/// Shows global error page.
abstract class ConfigurationError implements ConfigurationEvent, Built<ConfigurationError, ConfigurationErrorBuilder> {
  String get error;

  @nullable
  String get trace;

  factory ConfigurationError([void Function(ConfigurationErrorBuilder) updates]) = _$ConfigurationError;
  ConfigurationError._();
}

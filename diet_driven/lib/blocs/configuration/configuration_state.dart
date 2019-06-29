import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';
import 'package:package_info/package_info.dart' show PackageInfo;

part 'configuration_state.g.dart';

abstract class ConfigurationState {}

/// Splash page.
abstract class ConfigurationUninitialized with ConfigurationState implements Built<ConfigurationUninitialized, ConfigurationUninitializedBuilder> {
  factory ConfigurationUninitialized([void Function(ConfigurationUninitializedBuilder b)]) = _$ConfigurationUninitialized;
  ConfigurationUninitialized._();

  @override String toString() => runtimeType.toString();
}

/// Global error page.
abstract class ConfigurationFailed with ConfigurationState implements Built<ConfigurationFailed, ConfigurationFailedBuilder> {
  String get error;

  @nullable
  String get trace;

  factory ConfigurationFailed([void Function(ConfigurationFailedBuilder b)]) = _$ConfigurationFailed;
  ConfigurationFailed._();
}

/// Application, stores current [RemoteConfiguration], [PackageInfo].
abstract class ConfigurationLoaded with ConfigurationState implements Built<ConfigurationLoaded, ConfigurationLoadedBuilder> {
  RemoteConfiguration get remoteConfiguration;

  PackageInfo get packageInfo;

  factory ConfigurationLoaded([void Function(ConfigurationLoadedBuilder b)]) = _$ConfigurationLoaded;
  ConfigurationLoaded._();
}

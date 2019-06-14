import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'configuration_state.g.dart';

abstract class ConfigurationState {}

/// Splash page.
abstract class ConfigurationUninitialized with ConfigurationState implements Built<ConfigurationUninitialized, ConfigurationUninitializedBuilder> {
  ConfigurationUninitialized._();
  factory ConfigurationUninitialized([void Function(ConfigurationUninitializedBuilder b)]) = _$ConfigurationUninitialized;

  @override String toString() => runtimeType.toString();
}

/// Global error page.
abstract class ConfigurationFailed with ConfigurationState implements Built<ConfigurationFailed, ConfigurationFailedBuilder> {
  String get error;

  @nullable
  String get trace;

  ConfigurationFailed._();
  factory ConfigurationFailed([void Function(ConfigurationFailedBuilder b)]) = _$ConfigurationFailed;
}

/// Application, stores current [RemoteConfiguration].
abstract class ConfigurationLoaded with ConfigurationState implements Built<ConfigurationLoaded, ConfigurationLoadedBuilder> {
  RemoteConfiguration get configuration;

  ConfigurationLoaded._();
  factory ConfigurationLoaded([void Function(ConfigurationLoadedBuilder b)]) = _$ConfigurationLoaded;
}

/// Splash page, redundant state.
abstract class ConfigurationLoading with ConfigurationState implements Built<ConfigurationLoading, ConfigurationLoadingBuilder> {
  ConfigurationLoading._();
  factory ConfigurationLoading([void Function(ConfigurationLoadingBuilder b)]) = _$ConfigurationLoading;

  @override String toString() => runtimeType.toString();
}

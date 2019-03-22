import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'configuration_state.g.dart';

abstract class ConfigurationState {}

abstract class ConfigurationUninitialized with ConfigurationState implements Built<ConfigurationUninitialized, ConfigurationUninitializedBuilder> {
  ConfigurationUninitialized._();
  factory ConfigurationUninitialized([updates(ConfigurationUninitializedBuilder b)]) = _$ConfigurationUninitialized;

  @override
  String toString() => runtimeType.toString();
}

abstract class ConfigurationLoaded with ConfigurationState implements Built<ConfigurationLoaded, ConfigurationLoadedBuilder> {
  RemoteConfiguration get configuration;

  ConfigurationLoaded._();
  factory ConfigurationLoaded([updates(ConfigurationLoadedBuilder b)]) = _$ConfigurationLoaded;
}

abstract class ConfigurationLoading with ConfigurationState implements Built<ConfigurationLoading, ConfigurationLoadingBuilder> {
  ConfigurationLoading._();
  factory ConfigurationLoading([updates(ConfigurationLoadingBuilder b)]) = _$ConfigurationLoading;

  @override
  String toString() => runtimeType.toString();
}

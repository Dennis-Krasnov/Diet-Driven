import 'package:built_value/built_value.dart';

part 'configuration.g.dart';

/// Remote config
abstract class RemoteConfiguration implements Built<RemoteConfiguration, RemoteConfigurationBuilder> {
  bool get defaultConfiguration;
  int get bonus;

  RemoteConfiguration._();
  factory RemoteConfiguration([updates(RemoteConfigurationBuilder b)]) = _$RemoteConfiguration;
}

abstract class RemoteConfigurationBuilder implements Builder<RemoteConfiguration, RemoteConfigurationBuilder> {
  bool defaultConfiguration = true;
  int bonus = 0;

  factory RemoteConfigurationBuilder() = _$RemoteConfigurationBuilder;
  RemoteConfigurationBuilder._();
}

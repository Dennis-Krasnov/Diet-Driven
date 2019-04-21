import 'package:built_value/built_value.dart';

part 'configuration_events.g.dart';

abstract class ConfigurationEvent {}

/// Fetches Firebase Remote Config data.
abstract class FetchConfiguration with ConfigurationEvent implements Built<FetchConfiguration, FetchConfigurationBuilder> {

  FetchConfiguration._();
  factory FetchConfiguration([updates(FetchConfigurationBuilder b)]) = _$FetchConfiguration;

  @override String toString() => runtimeType.toString();
}

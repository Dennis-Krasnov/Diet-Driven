import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'settings.g.dart';

abstract class Settings implements Built<Settings, SettingsBuilder> {
  NavigationSettings get navigationSettings;

  Settings._();
  factory Settings([updates(SettingsBuilder b)]) = _$Settings;
}


// TODO: store single settings document, rename repository methods
abstract class SettingsDocument {}

abstract class NavigationSettings with SettingsDocument implements Built<NavigationSettings, NavigationSettingsBuilder> {
  static Serializer<NavigationSettings> get serializer => _$navigationSettingsSerializer;

  String get defaultPage;
  // TODO: default values, default page

  NavigationSettings._();
  factory NavigationSettings([updates(NavigationSettingsBuilder b)]) = _$NavigationSettings;
}

abstract class NavigationSettingsBuilder implements Builder<NavigationSettings, NavigationSettingsBuilder> {
  String defaultPage = "diary";

  factory NavigationSettingsBuilder() = _$NavigationSettingsBuilder;
  NavigationSettingsBuilder._();
}

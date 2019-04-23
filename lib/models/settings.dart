import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'settings.g.dart';

/// Everything must be nullable due implicit settings.
abstract class Settings implements Built<Settings, SettingsBuilder> {
  static Serializer<Settings> get serializer => _$settingsSerializer;

  @nullable
  NavigationSettings get navigationSettings;

  @nullable
  ThemeSettings get themeSettings;

  Settings._();
  factory Settings([updates(SettingsBuilder b)]) = _$Settings;
}

/// Default theme settings.
abstract class SettingsBuilder implements Builder<Settings, SettingsBuilder> {
  NavigationSettings navigationSettings;
  ThemeSettings themeSettings = ThemeSettings();

  factory SettingsBuilder() = _$SettingsBuilder;
  SettingsBuilder._();
}

/// Everything must be nullable due implicit settings.
abstract class NavigationSettings implements Built<NavigationSettings, NavigationSettingsBuilder> {
  static Serializer<NavigationSettings> get serializer => _$navigationSettingsSerializer;

  @nullable
  Page get defaultPage;

  @nullable
  BuiltList<Page> get bottomNavigationPages;

  NavigationSettings._();
  factory NavigationSettings([updates(NavigationSettingsBuilder b)]) = _$NavigationSettings;
}

/// Everything must be nullable due implicit settings.
abstract class ThemeSettings implements Built<ThemeSettings, ThemeSettingsBuilder> {
  @nullable
  bool get light;

  ThemeSettings._();
  factory ThemeSettings([updates(ThemeSettingsBuilder b)]) = _$ThemeSettings;
}

/// Default theme settings.
abstract class ThemeSettingsBuilder implements Builder<ThemeSettings, ThemeSettingsBuilder> {
  bool light = true;

  factory ThemeSettingsBuilder() = _$ThemeSettingsBuilder;
  ThemeSettingsBuilder._();
}

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

  factory Settings([void Function(SettingsBuilder b)]) = _$Settings;
  Settings._();
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

  factory NavigationSettings([void Function(NavigationSettingsBuilder b)]) = _$NavigationSettings;
  NavigationSettings._();
}

/// Everything must be nullable due implicit settings.
abstract class ThemeSettings implements Built<ThemeSettings, ThemeSettingsBuilder> {
  @nullable
  bool get darkMode;

  factory ThemeSettings([void Function(ThemeSettingsBuilder b)]) = _$ThemeSettings;
  ThemeSettings._();
}

// FIXME: upload theme to firestore!
/// Default theme settings.
abstract class ThemeSettingsBuilder implements Builder<ThemeSettings, ThemeSettingsBuilder> {
  bool darkMode = false;

  factory ThemeSettingsBuilder() = _$ThemeSettingsBuilder;
  ThemeSettingsBuilder._();
}

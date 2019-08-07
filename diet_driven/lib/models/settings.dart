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
  static Serializer<ThemeSettings> get serializer => _$themeSettingsSerializer;

  @nullable
  bool get darkMode;

  /// Hexadecimal string starting with '0x'.
  @nullable
  String get primaryColour;

  factory ThemeSettings([void Function(ThemeSettingsBuilder b)]) = _$ThemeSettings;
  ThemeSettings._();
}

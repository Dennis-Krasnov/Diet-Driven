import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'settings.g.dart';

abstract class Settings implements Built<Settings, SettingsBuilder> {
  ConfigSettings get configSettings;
  UserData get userData;
  NavigationSettings get navigationSettings;

  Settings._();
  factory Settings([updates(SettingsBuilder b)]) = _$Settings;
}

/// Read only
abstract class UserData implements Built<UserData, UserDataBuilder> {
  static Serializer<UserData> get serializer => _$userDataSerializer;

  bool get staleRemoteConfig;
  String get currentSubscription; // TODO: subscription enum

  UserData._();
  factory UserData([updates(UserDataBuilder b)]) = _$UserData;
}

/// Remote config
abstract class ConfigSettings implements Built<ConfigSettings, ConfigSettingsBuilder> {
  int get bonus;

  ConfigSettings._();
  factory ConfigSettings([updates(ConfigSettingsBuilder b)]) = _$ConfigSettings;
}

abstract class SettingsDocument {}

abstract class NavigationSettings with SettingsDocument implements Built<NavigationSettings, NavigationSettingsBuilder> {
  static Serializer<NavigationSettings> get serializer => _$navigationSettingsSerializer;

  String get temp;

  NavigationSettings._();
  factory NavigationSettings([updates(NavigationSettingsBuilder b)]) = _$NavigationSettings;
}

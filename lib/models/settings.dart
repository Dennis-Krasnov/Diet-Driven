import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'settings.g.dart';

abstract class Settings implements Built<Settings, SettingsBuilder> {
  NavigationSettings get navigationSettings;

  Settings._();
  factory Settings([updates(SettingsBuilder b)]) = _$Settings;
}

/// Read only document
abstract class UserData implements Built<UserData, UserDataBuilder> {
  static Serializer<UserData> get serializer => _$userDataSerializer;

  @nullable
  String get userId;
  @nullable
  String get name;

  String get currentSubscription; // TODO: subscription enum

  UserData._();
  factory UserData([updates(UserDataBuilder b)]) = _$UserData;
}

abstract class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  String userId;
  @nullable
  String name = "Mr. Goose";
  String currentSubscription = "none";

  factory UserDataBuilder() = _$UserDataBuilder;
  UserDataBuilder._();
}

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

abstract class SettingsDocument {}

abstract class NavigationSettings with SettingsDocument implements Built<NavigationSettings, NavigationSettingsBuilder> {
  static Serializer<NavigationSettings> get serializer => _$navigationSettingsSerializer;

  String get temp;
  // TODO: default values, default page

  NavigationSettings._();
  factory NavigationSettings([updates(NavigationSettingsBuilder b)]) = _$NavigationSettings;
}

abstract class NavigationSettingsBuilder implements Builder<NavigationSettings, NavigationSettingsBuilder> {
  String temp = "default";

  factory NavigationSettingsBuilder() = _$NavigationSettingsBuilder;
  NavigationSettingsBuilder._();
}

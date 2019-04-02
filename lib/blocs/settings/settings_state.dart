import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'settings_state.g.dart';

abstract class SettingsState {}

///
abstract class SettingsUninitialized with SettingsState implements Built<SettingsUninitialized, SettingsUninitializedBuilder> {
  SettingsUninitialized._();
  factory SettingsUninitialized([updates(SettingsUninitializedBuilder b)]) = _$SettingsUninitialized;

  @override
  String toString() => runtimeType.toString();
}

///
abstract class SettingsLoaded with SettingsState implements Built<SettingsLoaded, SettingsLoadedBuilder> {
  Settings get settings;

  SettingsLoaded._();
  factory SettingsLoaded([updates(SettingsLoadedBuilder b)]) = _$SettingsLoaded;
}

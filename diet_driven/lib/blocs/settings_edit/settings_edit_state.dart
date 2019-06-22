//abstract class SettingsEditState {}

import 'package:built_value/built_value.dart';

part 'settings_edit_state.g.dart';

abstract class SettingsEditState implements Built<SettingsEditState, SettingsEditStateBuilder> {
  factory SettingsEditState([void Function(SettingsEditStateBuilder) updates]) = _$SettingsEditState;
  SettingsEditState._();
}

//import 'package:built_value/built_value.dart';
//import 'package:diet_driven/models/models.dart';
//
//part 'settings_edit_state.g.dart';
//
//abstract class SettingsEditState implements Built<SettingsEditState, SettingsEditStateBuilder> {
//  String get userId;
//  Settings get settings;
//
//  factory SettingsEditState([void Function(SettingsEditStateBuilder) updates]) = _$SettingsEditState;
//  SettingsEditState._();
//}

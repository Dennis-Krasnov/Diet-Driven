import 'package:built_value/built_value.dart';

part 'settings_edit_state.g.dart';

//abstract class SettingsEditState {}

abstract class SettingsEditState implements Built<SettingsEditState, SettingsEditStateBuilder> {
//  String get updateDarkModeState;

  factory SettingsEditState([void Function(SettingsEditStateBuilder) updates]) = _$SettingsEditState;
  SettingsEditState._();
}

abstract class SettingsEditStateBuilder implements Builder<SettingsEditState, SettingsEditStateBuilder> {
//  String updateDarkModeState = "loaded";

  factory SettingsEditStateBuilder() = _$SettingsEditStateBuilder;
  SettingsEditStateBuilder._();
}

//abstract class SettingsEditLoading implements SettingsEditState, Built<SettingsEditLoading, SettingsEditLoadingBuilder> {
//  factory SettingsEditLoading([void Function(SettingsEditLoadingBuilder) updates]) = _$SettingsEditLoading;
//  SettingsEditLoading._();
//}
//
//abstract class SettingsEditLoaded implements SettingsEditState, Built<SettingsEditLoaded, SettingsEditLoadedBuilder> {
//  // TODO: decide between completers and...
//  // TODO: single SettingsEditState, darkModeUpdate as enum: ready, loading, failed; each function rebuilds it's own enum
//  factory SettingsEditLoaded([void Function(SettingsEditLoadedBuilder) updates]) = _$SettingsEditLoaded;
//  SettingsEditLoaded._();
//}

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

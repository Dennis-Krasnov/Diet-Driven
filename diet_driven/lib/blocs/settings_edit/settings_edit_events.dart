import 'dart:async';

import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'settings_edit_events.g.dart';

abstract class SettingsEditEvent {}

/// Updates dark mode setting
abstract class UpdateDarkMode with Completable implements SettingsEditEvent, Built<UpdateDarkMode, UpdateDarkModeBuilder> {
  bool get darkMode;

  factory UpdateDarkMode([void Function(UpdateDarkModeBuilder) updates]) = _$UpdateDarkMode;
  UpdateDarkMode._();
}

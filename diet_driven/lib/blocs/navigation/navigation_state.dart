/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

part 'navigation_state.g.dart';

@BuiltValue(instantiable: false)
abstract class NavigationState {
  /// Optional deep link within page.
  @nullable
  BuiltList<String> get deepLink;

  NavigationState rebuild(void Function(NavigationStateBuilder) updates);
  NavigationStateBuilder toBuilder();
}

/// White screen with skeleton menu and app bar.
/// Doesn't use [deepLink] field.
abstract class NavigationUninitialized implements NavigationState, Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  factory NavigationUninitialized([void Function(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;
  NavigationUninitialized._();
}

abstract class DiaryTab implements NavigationState, Built<DiaryTab, DiaryTabBuilder> {
  factory DiaryTab([void Function(DiaryTabBuilder) updates]) = _$DiaryTab;
  DiaryTab._();
}

abstract class TrackTab implements NavigationState, Built<TrackTab, TrackTabBuilder> {
  factory TrackTab([void Function(TrackTabBuilder) updates]) = _$TrackTab;
  TrackTab._();
}

abstract class ReportsTab implements NavigationState, Built<ReportsTab, ReportsTabBuilder> {
  factory ReportsTab([void Function(ReportsTabBuilder) updates]) = _$ReportsTab;
  ReportsTab._();
}

abstract class SettingsTab implements NavigationState, Built<SettingsTab, SettingsTabBuilder> {
  factory SettingsTab([void Function(SettingsTabBuilder) updates]) = _$SettingsTab;
  SettingsTab._();
}

abstract class LoggingTab implements NavigationState, Built<LoggingTab, LoggingTabBuilder> {
  factory LoggingTab([void Function(LoggingTabBuilder) updates]) = _$LoggingTab;
  LoggingTab._();
}
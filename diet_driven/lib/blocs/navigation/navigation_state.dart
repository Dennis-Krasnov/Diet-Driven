/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/blocs.dart';

part 'navigation_state.g.dart';

// Providing concrete implementation in each class is cumbersome.
// However, it's accessible under NavigationState class, and still fully works.

bool _wasPopped(BuiltList<DeepLink> deepLink, BuiltList<DeepLink> previousDeepLink) =>
    (deepLink?.length ?? 0) - (previousDeepLink?.length ?? 0) < 0;

bool _wasSinglePush(BuiltList<DeepLink> deepLink, BuiltList<DeepLink> previousDeepLink) =>
    (deepLink?.length ?? 0) - (previousDeepLink?.length ?? 0) == 1;

String _path(BuiltList<DeepLink> deepLink, BuiltList<DeepLink> previousDeepLink, String root, {int until}) =>
    "$root/${deepLink.sublist(0, until ?? deepLink.length).join("/")}";

@BuiltValue(instantiable: false)
abstract class NavigationState {
  /// Current location within app.
  @nullable
  BuiltList<DeepLink> get deepLink;

  /// Previous location within app.
  @nullable
  BuiltList<DeepLink> get previousDeepLink;

  /// Whether navigation was a result of a pop.
  /// Avoid firing deep link logic on pops to avoid unnecessary animations.
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  /// Whether navigation was a result of one push.
  /// Avoid using route transitions with animations when pushing more than one route.
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  /// Construct deep link path using [root] path and optionally truncated deep link.
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  NavigationState rebuild(void Function(NavigationStateBuilder) updates);
  NavigationStateBuilder toBuilder();
}

/// White screen with skeleton menu and app bar.
/// Doesn't use [deepLink] and [fullPage] fields.
abstract class NavigationUninitialized implements NavigationState, Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  @override
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  @override
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  @override
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  factory NavigationUninitialized([void Function(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;
  NavigationUninitialized._();
}

abstract class DiaryTab implements NavigationState, Built<DiaryTab, DiaryTabBuilder> {
  @override
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  @override
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  @override
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  factory DiaryTab([void Function(DiaryTabBuilder) updates]) = _$DiaryTab;
  DiaryTab._();
}

abstract class TrackTab implements NavigationState, Built<TrackTab, TrackTabBuilder> {
  @override
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  @override
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  @override
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  factory TrackTab([void Function(TrackTabBuilder) updates]) = _$TrackTab;
  TrackTab._();
}

abstract class ReportsTab implements NavigationState, Built<ReportsTab, ReportsTabBuilder> {
  @override
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  @override
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  @override
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  factory ReportsTab([void Function(ReportsTabBuilder) updates]) = _$ReportsTab;
  ReportsTab._();
}

abstract class SettingsTab implements NavigationState, Built<SettingsTab, SettingsTabBuilder> {
  @override
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  @override
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  @override
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  factory SettingsTab([void Function(SettingsTabBuilder) updates]) = _$SettingsTab;
  SettingsTab._();
}

abstract class LoggingTab implements NavigationState, Built<LoggingTab, LoggingTabBuilder> {
  @override
  bool get wasPopped => _wasPopped(deepLink, previousDeepLink);

  @override
  bool get wasSinglePush => _wasSinglePush(deepLink, previousDeepLink);

  @override
  String path(String root, {int until}) => _path(deepLink, previousDeepLink, root, until: until);

  factory LoggingTab([void Function(LoggingTabBuilder) updates]) = _$LoggingTab;
  LoggingTab._();
}
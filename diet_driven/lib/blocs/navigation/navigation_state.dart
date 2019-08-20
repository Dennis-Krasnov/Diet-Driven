/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/navigation/navigation_events.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_state.g.dart';


@BuiltValue(instantiable: false)
abstract class NavigationState {
  /// Associated page enum.
  @nullable
  Page get page;

  /// Optional deep link within page.
  @nullable
  DeepLink get deepLink;

  NavigationState rebuild(void Function(NavigationStateBuilder) updates);
  NavigationStateBuilder toBuilder();
}


/// White screen with skeleton menu and app bar.
abstract class NavigationUninitialized implements NavigationState, Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  factory NavigationUninitialized([void Function(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;
  NavigationUninitialized._();
}

///   ########  ####    ###    ########  ##    ##
///   ##     ##  ##    ## ##   ##     ##  ##  ##
///   ##     ##  ##   ##   ##  ##     ##   ####
///   ##     ##  ##  ##     ## ########     ##
///   ##     ##  ##  ######### ##   ##      ##
///   ##     ##  ##  ##     ## ##    ##     ##
///   ########  #### ##     ## ##     ##    ##

abstract class DiaryTab implements NavigationState, Built<DiaryTab, DiaryTabBuilder> {
  factory DiaryTab([void Function(DiaryTabBuilder) updates]) = _$DiaryTab;
  DiaryTab._();
}

abstract class DiaryTabBuilder implements NavigationStateBuilder, Builder<DiaryTab, DiaryTabBuilder> {
  @override
  Page page = Page.diary;

  @override
  @nullable
  DeepLink deepLink;

  factory DiaryTabBuilder() = _$DiaryTabBuilder;
  DiaryTabBuilder._();
}

///   ######## ########     ###     ######  ##    ## #### ##    ##  ######
///      ##    ##     ##   ## ##   ##    ## ##   ##   ##  ###   ## ##    ##
///      ##    ##     ##  ##   ##  ##       ##  ##    ##  ####  ## ##
///      ##    ########  ##     ## ##       #####     ##  ## ## ## ##   ####
///      ##    ##   ##   ######### ##       ##  ##    ##  ##  #### ##    ##
///      ##    ##    ##  ##     ## ##    ## ##   ##   ##  ##   ### ##    ##
///      ##    ##     ## ##     ##  ######  ##    ## #### ##    ##  ######

abstract class TrackTab implements NavigationState, Built<TrackTab, TrackTabBuilder> {
  factory TrackTab([void Function(TrackTabBuilder) updates]) = _$TrackTab;
  TrackTab._();
}

abstract class TrackTabBuilder implements NavigationStateBuilder, Builder<TrackTab, TrackTabBuilder> {
  @override
  Page page = Page.track;

  @override
  @nullable
  DeepLink deepLink;

  factory TrackTabBuilder() = _$TrackTabBuilder;
  TrackTabBuilder._();
}

///   ########  ######## ########   #######  ########  ########  ######
///   ##     ## ##       ##     ## ##     ## ##     ##    ##    ##    ##
///   ##     ## ##       ##     ## ##     ## ##     ##    ##    ##
///   ########  ######   ########  ##     ## ########     ##     ######
///   ##   ##   ##       ##        ##     ## ##   ##      ##          ##
///   ##    ##  ##       ##        ##     ## ##    ##     ##    ##    ##
///   ##     ## ######## ##         #######  ##     ##    ##     ######

abstract class ReportsTab implements NavigationState, Built<ReportsTab, ReportsTabBuilder> {
  factory ReportsTab([void Function(ReportsTabBuilder) updates]) = _$ReportsTab;
  ReportsTab._();
}

abstract class ReportsTabBuilder implements NavigationStateBuilder, Builder<ReportsTab, ReportsTabBuilder> {
  @override
  Page page = Page.reports;

  @override
  @nullable
  DeepLink deepLink;

  factory ReportsTabBuilder() = _$ReportsTabBuilder;
  ReportsTabBuilder._();
}

///    ######  ######## ######## ######## #### ##    ##  ######    ######
///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
///   ##       ##          ##       ##     ##  ####  ## ##        ##
///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
///    ######  ########    ##       ##    #### ##    ##  ######    ######

abstract class SettingsTab implements NavigationState, Built<SettingsTab, SettingsTabBuilder> {
  factory SettingsTab([void Function(SettingsTabBuilder) updates]) = _$SettingsTab;
  SettingsTab._();
}

abstract class SettingsTabBuilder implements NavigationStateBuilder, Builder<SettingsTab, SettingsTabBuilder> {
  @override
  Page page = Page.settings;

  @override
  @nullable
  DeepLink deepLink;

  factory SettingsTabBuilder() = _$SettingsTabBuilder;
  SettingsTabBuilder._();
}

///   ##        #######   ######    ######   #### ##    ##  ######
///   ##       ##     ## ##    ##  ##    ##   ##  ###   ## ##    ##
///   ##       ##     ## ##        ##         ##  ####  ## ##
///   ##       ##     ## ##   #### ##   ####  ##  ## ## ## ##   ####
///   ##       ##     ## ##    ##  ##    ##   ##  ##  #### ##    ##
///   ##       ##     ## ##    ##  ##    ##   ##  ##   ### ##    ##
///   ########  #######   ######    ######   #### ##    ##  ######

abstract class LoggingTab implements NavigationState, Built<LoggingTab, LoggingTabBuilder> {
  factory LoggingTab([void Function(LoggingTabBuilder) updates]) = _$LoggingTab;
  LoggingTab._();
}


abstract class LoggingTabBuilder implements NavigationStateBuilder, Builder<LoggingTab, LoggingTabBuilder> {
  @override
  Page page = Page.logging;

  @override
  @nullable
  DeepLink deepLink;

  factory LoggingTabBuilder() = _$LoggingTabBuilder;
  LoggingTabBuilder._();
}

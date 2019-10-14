/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/navigation/navigation.dart';
import 'package:diet_driven/models/models.dart';

part 'navigation_events.g.dart';

abstract class NavigationEvent {}

/// Subscribes to bloc state stream, navigates to default page.
abstract class InitNavigation implements NavigationEvent, Built<InitNavigation, InitNavigationBuilder> {
  factory InitNavigation([void Function(InitNavigationBuilder) updates]) = _$InitNavigation;
  InitNavigation._();
}

///
abstract class ResetNavigation implements NavigationEvent, Built<ResetNavigation, ResetNavigationBuilder> {
  Page get defaultPage;

  factory ResetNavigation([void Function(ResetNavigationBuilder) updates]) = _$ResetNavigation;
  ResetNavigation._();
}

/// Navigate to corresponding [page].
abstract class Navigate implements NavigationEvent, Built<Navigate, NavigateBuilder> {
  Page get page;

  BuiltList<DeepLink> get deepLinks;

  factory Navigate([void Function(NavigateBuilder) updates]) = _$Navigate;
  Navigate._();
}

///
abstract class SwitchTab implements NavigationEvent, Built<SwitchTab, SwitchTabBuilder> {
  Page get to;

  factory SwitchTab([void Function(SwitchTabBuilder) updates]) = _$SwitchTab;
  SwitchTab._();
}

///
abstract class Push implements NavigationEvent, Built<Push, PushBuilder> {
  DeepLink get deepLink;

  // TODO, shove into state/deep link
  @nullable
  Completer get completer;

  factory Push([void Function(PushBuilder) updates]) = _$Push;
  Push._();
}

///
abstract class Pop implements NavigationEvent, Built<Pop, PopBuilder> {
  // TODO, shove into state/deep link
//  Completer get completer;

  factory Pop([void Function(PopBuilder) updates]) = _$Pop;
  Pop._();
}
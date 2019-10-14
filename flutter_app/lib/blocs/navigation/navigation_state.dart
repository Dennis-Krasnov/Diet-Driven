/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';

part 'navigation_state.g.dart';

abstract class NavigationState {}

/// White screen with skeleton menu and app bar.
abstract class NavigationUninitialized implements NavigationState, Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  factory NavigationUninitialized([void Function(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;
  NavigationUninitialized._();
}

/// ...
abstract class NavigationRoute implements NavigationState, Built<NavigationRoute, NavigationRouteBuilder> {
  ///
  Page get page;

  /// Current deep links for each page.
  BuiltMap<Page, BuiltList<DeepLink>> get pageDeepLinks;

  /// Current deep links for [page].
  BuiltList<DeepLink> currentDeepLinks() => pageDeepLinks[page] ?? BuiltList();

  ///
//  bool isFullScreen() => currentDeepLinks().any((link) => link.isFullScreen); TODO

  /// Current path for [page].
  String currentPath() => currentDeepLinks().map((link) => "$link").join("/");

  ///
  bool get shouldAnimatePush;

  ///
  Navigate toEvent() => Navigate((b) => b
    ..page = page
    ..deepLinks = currentDeepLinks().toBuilder()
  );

  factory NavigationRoute([void Function(NavigationRouteBuilder) updates]) = _$NavigationRoute;
  NavigationRoute._();
}
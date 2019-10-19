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

  /// Only pushes should animate transition.
  bool get shouldAnimate;

  ///
  Navigate toEvent() => Navigate((b) => b
    ..page = page
    ..deepLinks = currentDeepLinks().toBuilder()
  );

  factory NavigationRoute([void Function(NavigationRouteBuilder) updates]) = _$NavigationRoute;
  NavigationRoute._();
}

// Can't use builder since it removes []= operator!
//abstract class NavigationRouteBuilder implements Builder<NavigationRoute, NavigationRouteBuilder> {
//  Page page;
//
//  BuiltMap<Page, BuiltList<DeepLink>> pageDeepLinks;
////  = BuiltMap(<Page, BuiltList<DeepLink>>{
////    Page.diary: BuiltList(<DeepLink>[DiaryDeepLink()]),
////    Page.track: BuiltList(<DeepLink>[]),
////    Page.reports: BuiltList(<DeepLink>[]),
////    Page.settings: BuiltList(<DeepLink>[SettingsDeepLink()]),
////  });
//
//  bool shouldAnimatePush;
//
//  factory NavigationRouteBuilder() = _$NavigationRouteBuilder;
//  NavigationRouteBuilder._();
//}

//class NavigationRouteBuilder
//    implements Builder<NavigationRoute, NavigationRouteBuilder> {
//  _$NavigationRoute _$v;
//
//  Page _page;
//  Page get page => _$this._page;
//  set page(Page page) => _$this._page = page;
//
//  MapBuilder<Page, BuiltList<DeepLink>> _pageDeepLinks;
//  MapBuilder<Page, BuiltList<DeepLink>> get pageDeepLinks =>
//      _$this._pageDeepLinks ??= new MapBuilder<Page, BuiltList<DeepLink>>();
//  set pageDeepLinks(MapBuilder<Page, BuiltList<DeepLink>> pageDeepLinks) =>
//      _$this._pageDeepLinks = pageDeepLinks;
//
//  bool _shouldAnimatePush;
//  bool get shouldAnimatePush => _$this._shouldAnimatePush;
//  set shouldAnimatePush(bool shouldAnimatePush) =>
//      _$this._shouldAnimatePush = shouldAnimatePush;
//
//  NavigationRouteBuilder();
//
//  NavigationRouteBuilder get _$this {
//    if (_$v != null) {
//      _page = _$v.page;
//      _pageDeepLinks = _$v.pageDeepLinks?.toBuilder();
//      _shouldAnimatePush = _$v.shouldAnimatePush;
//      _$v = null;
//    }
//    return this;
//  }
//
//  @override
//  void replace(NavigationRoute other) {
//    if (other == null) {
//      throw new ArgumentError.notNull('other');
//    }
//    _$v = other as _$NavigationRoute;
//  }
//
//  @override
//  void update(void Function(NavigationRouteBuilder) updates) {
//    if (updates != null) updates(this);
//  }
//
//  @override
//  _$NavigationRoute build() {
//    _$NavigationRoute _$result;
//    try {
//      _$result = _$v ??
//          new _$NavigationRoute._(
//              page: page,
//              pageDeepLinks: pageDeepLinks.build(),
//              shouldAnimatePush: shouldAnimatePush);
//    } catch (_) {
//      String _$failedField;
//      try {
//        _$failedField = 'pageDeepLinks';
//        pageDeepLinks.build();
//      } catch (e) {
//        throw new BuiltValueNestedFieldError(
//            'NavigationRoute', _$failedField, e.toString());
//      }
//      rethrow;
//    }
//    replace(_$result);
//    return _$result;
//  }
//}
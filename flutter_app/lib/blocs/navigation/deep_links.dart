/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';

import 'package:diet_driven/models/serializers.dart';

part 'deep_links.g.dart';

/// Base class for all deep links.
@BuiltValue(instantiable: false)
abstract class DeepLink {
  /// Whether to hide bottom navigation for this page and all sub-pages.
  /// Null is equivalent to false.
  @nullable
  bool get fullScreen;

  DeepLink rebuild(void Function(DeepLinkBuilder) updates);
  DeepLinkBuilder toBuilder();
}

// TODO: create a method that strips second param if it exists for analytics - way simpler

///
abstract class DiaryDeepLink implements DeepLink, Built<DiaryDeepLink, DiaryDeepLinkBuilder> {
  ///
  int get date;

  factory DiaryDeepLink([void Function(DiaryDeepLinkBuilder) updates]) = _$DiaryDeepLink;
  DiaryDeepLink._();

  factory DiaryDeepLink.today() => DiaryDeepLink((b) => b
    ..date = currentDaysSinceEpoch()
  );

  @override
  String toString() => "diary/$date";
}

///
abstract class DiaryFoodRecordDeepLink implements DeepLink, Built<DiaryFoodRecordDeepLink, DiaryFoodRecordDeepLinkBuilder> {
  ///
  String get uid;

  factory DiaryFoodRecordDeepLink([void Function(DiaryFoodRecordDeepLinkBuilder) updates]) = _$DiaryFoodRecordDeepLink;
  DiaryFoodRecordDeepLink._();

  @override
  String toString() => "food-record/$uid";
}

///
abstract class DiaryLoggingDeepLink implements DeepLink, Built<DiaryLoggingDeepLink, DiaryLoggingDeepLinkBuilder> {
  ///
  String get type; // TODO: recent/frequent/etc

  factory DiaryLoggingDeepLink([void Function(DiaryLoggingDeepLinkBuilder) updates]) = _$DiaryLoggingDeepLink;
  DiaryLoggingDeepLink._();

  @override
  String toString() => "logging/$type";
}

///
abstract class DiaryLoggingSearchDeepLink implements DeepLink, Built<DiaryLoggingSearchDeepLink, DiaryLoggingSearchDeepLinkBuilder> {
  ///
  String get query;

  factory DiaryLoggingSearchDeepLink([void Function(DiaryLoggingSearchDeepLinkBuilder) updates]) = _$DiaryLoggingSearchDeepLink;
  DiaryLoggingSearchDeepLink._();

  @override
  String toString() => "search/$query";
}

// TODO: large comments

///
abstract class SettingsDeepLink implements DeepLink, Built<SettingsDeepLink, SettingsDeepLinkBuilder> {
  factory SettingsDeepLink([void Function(SettingsDeepLinkBuilder) updates]) = _$SettingsDeepLink;
  SettingsDeepLink._();

  @override
  String toString() => "settings";
}

///
abstract class ThemeSettingsDeepLink implements DeepLink, Built<ThemeSettingsDeepLink, ThemeSettingsDeepLinkBuilder> {
  factory ThemeSettingsDeepLink([void Function(ThemeSettingsDeepLinkBuilder) updates]) = _$ThemeSettingsDeepLink;
  ThemeSettingsDeepLink._();

  @override
  String toString() => "theme";
}

///
abstract class DiarySettingsDeepLink implements DeepLink, Built<DiarySettingsDeepLink, DiarySettingsDeepLinkBuilder> {
  factory DiarySettingsDeepLink([void Function(DiarySettingsDeepLinkBuilder) updates]) = _$DiarySettingsDeepLink;
  DiarySettingsDeepLink._();

  @override
  String toString() => "diary";
}
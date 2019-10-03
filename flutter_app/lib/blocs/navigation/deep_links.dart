/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:convert';

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/serializers.dart';

part 'deep_links.g.dart';

/// Base class for all deep links.
//abstract class DeepLink {}

@BuiltValue(instantiable: false)
abstract class DeepLink {
  ///
  String get path;

  /// Whether to hide bottom navigation for this page and all sub-pages.
  bool get fullPage;
  // TODO: default to false

  DeepLink rebuild(void Function(DeepLinkBuilder) updates);
  DeepLinkBuilder toBuilder();
}


///
abstract class PathDeepLink implements DeepLink, Built<PathDeepLink, PathDeepLinkBuilder> {
  factory PathDeepLink([void Function(PathDeepLinkBuilder) updates]) = _$PathDeepLink;
  PathDeepLink._();

  @override
  String toString() => path;
}

abstract class PathDeepLinkBuilder implements DeepLinkBuilder, Builder<PathDeepLink, PathDeepLinkBuilder> {
  @override
  String path;

  @override
  bool fullPage = false;

  factory PathDeepLinkBuilder() = _$PathDeepLinkBuilder;
  PathDeepLinkBuilder._();
}


///
abstract class ValueDeepLink<T> implements DeepLink, Built<ValueDeepLink<T>, ValueDeepLinkBuilder<T>> {
  ///
  T get data;

  factory ValueDeepLink([void Function(ValueDeepLinkBuilder<T>) updates]) = _$ValueDeepLink<T>;
  ValueDeepLink._();

  @override
  String toString() => "$path/$data";
}

abstract class ValueDeepLinkBuilder<T> implements DeepLinkBuilder, Builder<ValueDeepLink<T>, ValueDeepLinkBuilder<T>> {
  @override
  String path;

  @override
  bool fullPage = false;

  T data;

  factory ValueDeepLinkBuilder() = _$ValueDeepLinkBuilder<T>;
  ValueDeepLinkBuilder._();
}


///
abstract class SerializedDeepLink<T> implements DeepLink, Built<SerializedDeepLink<T>, SerializedDeepLinkBuilder<T>> {
  ///
  T get data;

  factory SerializedDeepLink([void Function(SerializedDeepLinkBuilder<T>) updates]) = _$SerializedDeepLink<T>;
  SerializedDeepLink._();

  @override
  String toString() => "$path/${base64.encode(utf8.encode(serializers.serialize(data)))}";
}


abstract class SerializedDeepLinkBuilder<T> implements DeepLinkBuilder, Builder<SerializedDeepLink<T>, SerializedDeepLinkBuilder<T>> {
  @override
  String path;

  @override
  bool fullPage = false;

  T data;

  factory SerializedDeepLinkBuilder() = _$SerializedDeepLinkBuilder<T>;
  SerializedDeepLinkBuilder._();
}


/// Flattened navigation route endpoints.
class Routes {
  static const String root = "";

  static const String diary = "diary";

  static const String settings = "settings";
  static const String generalSettings = "general";
  static const String themeSettings = "theme";
  static const String diarySettings = "diary";
}
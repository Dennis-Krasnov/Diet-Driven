/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'food_logging_tab.g.dart';

/// Food logging tab pages.
class FoodLoggingTab extends EnumClass {
//  static Serializer<LoggingTab> get serializer => _$pageSerializer;

  /// ...
  static const FoodLoggingTab recent = _$recent;

  /// ...
  static const FoodLoggingTab frequent = _$frequent;

  /// ...
  static const FoodLoggingTab popular = _$popular;

  /// ...
  static const FoodLoggingTab favorite = _$favorite;

  /// ...
  static const FoodLoggingTab recipes = _$recipes;

  const FoodLoggingTab._(String name) : super(name);

  static BuiltSet<FoodLoggingTab> get values => _$values;
  static FoodLoggingTab valueOf(String name) => _$valueOf(name);
}

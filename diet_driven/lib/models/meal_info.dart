/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'meal_info.g.dart';

/// Meal metadata specified in a [Diet].
abstract class MealInfo implements Built<MealInfo, MealInfoBuilder> {
  static Serializer<MealInfo> get serializer => _$mealInfoSerializer;

  /// TODOCUMENT
  String get mealName;

  /// Time in minutes from midnight.
  /// Used to guess which meal to add to if none specified.
  int get startTime;

  factory MealInfo([void Function(MealInfoBuilder) updates]) = _$MealInfo;

  /// Data validation.
  MealInfo._() {
    if (startTime != null && startTime < 0)
      throw StateError("Start time must be non-negative");
  }
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart' show MealInfo, NutrientMap;

part 'diet.g.dart';

/// ...
abstract class Diet implements Built<Diet, DietBuilder> {
  /// ...
  NutrientMap get idealNutrients;

  ///
  /// ... default ...
  BuiltList<MealInfo> get meals;

  ///
  int get startDate;
  // TODO: meal objects with start time,
  //  bool whether they count in 'mealindexRightNow', at least one must have this.

  // TODO: always assert 0 <= mealIndex < meals.length

  // TODO: 'mealIndexRightNow()` method

  factory Diet([void Function(DietBuilder b)]) = _$Diet;
  Diet._();
}

abstract class DietBuilder implements Builder<Diet, DietBuilder> {
  NutrientMap idealNutrients;
  BuiltList<MealInfo> meals = BuiltList(<MealInfo>[
    MealInfo((b) => b
      ..mealName = "Breakfast"
      ..startTime = 0 // ?? AM
    ),
    MealInfo((b) => b
      ..mealName = "Lunch"
      ..startTime = 0 // ?? AM
    ),
    MealInfo((b) => b
      ..mealName = "Dinner"
      ..startTime = 0 // ?? AM
    ),
    MealInfo((b) => b
      ..mealName = "Snacks"
      ..startTime = 0 // ?? AM
    ),
  ]);

  int startDate;

  factory DietBuilder() = _$DietBuilder;
  DietBuilder._();
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'diet.g.dart';

abstract class Diet implements Built<Diet, DietBuilder> {
  num get calories;

  BuiltList<String> get mealNames;

  int get startDate;
  // TODO: meal objects with start time,
  //  bool whether they count in 'mealindexRightNow', at least one must have this.

  // TODO: always assert 0 <= mealIndex < meals.length

  // TODO: 'mealIndexRightNow()` method

  factory Diet([void Function(DietBuilder b)]) = _$Diet;
  Diet._();
}

abstract class DietBuilder implements Builder<Diet, DietBuilder> {
  num calories;

  BuiltList<String> mealNames = BuiltList(<String>["Breakfast", "Lunch", "Dinner", "Snacks"]);

  int startDate;

  factory DietBuilder() = _$DietBuilder;
  DietBuilder._();
}

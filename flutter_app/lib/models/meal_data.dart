/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'meal_data.g.dart';

/// Meal's [FoodRecord]s stored in a [FoodDiaryDay].
/// Firestore can't a 2D array hence object composition is used.
abstract class MealData implements Built<MealData, MealDataBuilder> {
  static Serializer<MealData> get serializer => _$mealDataSerializer;

  /// TODOCUMENT
  BuiltList<FoodRecord> get foodRecords;

  factory MealData([void Function(MealDataBuilder) updates]) = _$MealData;
  MealData._();
}

// TODO: combined meal that simply contains both data and info ??

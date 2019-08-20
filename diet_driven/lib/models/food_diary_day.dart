/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_day.g.dart';

abstract class FoodDiaryDay implements Built<FoodDiaryDay, FoodDiaryDayBuilder> {
  static Serializer<FoodDiaryDay> get serializer => _$foodDiaryDaySerializer;

  /// Days since epoch.
  int get date;

  /// Food records stored under meal at keyed index.
  BuiltListMultimap<int, FoodRecord> get mealRecords;

  factory FoodDiaryDay([void Function(FoodDiaryDayBuilder b)]) = _$FoodDiaryDay;
  FoodDiaryDay._();
}

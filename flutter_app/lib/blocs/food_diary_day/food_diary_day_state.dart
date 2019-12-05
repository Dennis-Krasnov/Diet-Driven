/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_day_state.g.dart';

abstract class FoodDiaryDayState {}

/// Skeleton food records.
abstract class FoodDiaryDayUninitialized implements FoodDiaryDayState, Built<FoodDiaryDayUninitialized, FoodDiaryDayUninitializedBuilder> {
  factory FoodDiaryDayUninitialized([void Function(FoodDiaryDayUninitializedBuilder) updates]) = _$FoodDiaryDayUninitialized;
  FoodDiaryDayUninitialized._();
}

/// Single-day food diary view.
abstract class FoodDiaryDayLoaded implements FoodDiaryDayState, Built<FoodDiaryDayLoaded, FoodDiaryDayLoadedBuilder> {
  /// Day's food records and metadata.
  /// [null] if there's no food diary day associated to that day.
  /// [foodDiaryDay] may contain 0 food records.
  @nullable
  FoodDiaryDay get foodDiaryDay;

  /// Most up-to-date diet for the day's date.
  Diet get diet;

  factory FoodDiaryDayLoaded([void Function(FoodDiaryDayLoadedBuilder) updates]) = _$FoodDiaryDayLoaded;
  FoodDiaryDayLoaded._();
}

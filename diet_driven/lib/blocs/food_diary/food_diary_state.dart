/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

/// Skeleton diary app bar and food records.
abstract class FoodDiaryUninitialized implements FoodDiaryState, Built<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  factory FoodDiaryUninitialized([void Function(FoodDiaryUninitializedBuilder b)]) = _$FoodDiaryUninitialized;
  FoodDiaryUninitialized._();
}

/// Error page.
abstract class FoodDiaryFailed implements BuiltError, FoodDiaryState, Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  factory FoodDiaryFailed([void Function(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
  FoodDiaryFailed._();
}

/// Food diary day switcher.
abstract class FoodDiaryLoaded implements FoodDiaryState, Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  /// Actual date.
  int get currentDate;

  /// Map from [int] daysFromEpoch to [FoodDiaryDay]s.
  BuiltMap<int, FoodDiaryDay> get diaryDays;

  /// List of all user's [Diet]s.
  BuiltList<Diet> get diets;

  /// Most recent [Diet] for a given [date].
  /// Assumes [diets] are arranged in ascending startingDate order.
  Diet dietForDate(int date) => diets.lastWhere((diet) => diet.startDate <= date);

  factory FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
  FoodDiaryLoaded._();
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/utils/utils.dart';

part 'food_diary_state.g.dart';

/// Historical food diary blocs don't affect UI. // FIXME: what if it errors, app bar still shows as success...
abstract class FoodDiaryState {}

/// Skeleton diary app bar.
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
  /// Map from [int] daysFromEpoch to [FoodDiaryDay]s.
  BuiltMap<int, FoodDiaryDay> get diaryDays;

  /// List of all user's [Diet]s.
  BuiltList<Diet> get diets;

  /// Most recent [Diet] for a given [date].
  /// Assumes [diets] are arranged in ascending startingDate order.
  Diet dietForDate(int date) => diets.lastWhere((diet) => diet.startDate <= date);

  factory FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;

  /// Data validation
  FoodDiaryLoaded._() {
    if (diets.isEmpty) {
      throw StateError("Diets list can't be empty");
    }
  }
}

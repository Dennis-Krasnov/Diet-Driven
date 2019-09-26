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

  /// List of meals storing food records.
  BuiltList<MealData> get meals;

  factory FoodDiaryDay([void Function(FoodDiaryDayBuilder b)]) = _$FoodDiaryDay;

  /// Data validation.
  FoodDiaryDay._() {
    if (date < 0)
      throw StateError("Date must be non-negative");
  }
}

abstract class FoodDiaryDayBuilder implements Builder<FoodDiaryDay, FoodDiaryDayBuilder> {
  int date;
  BuiltList<MealData> meals;


  /// Adds [foodRecords] to specified [mealIndex].
  /// Throws [ArgumentError] on invalid input.
  void addFoodRecords(int mealIndex, BuiltList<FoodRecord> foodRecords) {
    if (mealIndex == null || mealIndex < 0 || mealIndex >= meals.length) {
      throw ArgumentError("Meal index must be within meals' size");
    }

    if (foodRecords == null || foodRecords.isEmpty) {
      throw ArgumentError("Food records must be non-empty");
    }

    final mealRecordsBuilder = meals.toBuilder();
    mealRecordsBuilder[mealIndex] = mealRecordsBuilder[mealIndex].rebuild((b) => b
      ..foodRecords.update((b) => b
        ..addAll(foodRecords)
      )
    );
    meals = mealRecordsBuilder.build();
  }

  /// Replaces [oldRecord] with [newRecord].
  /// Throws [ArgumentError] on invalid input.
  void replaceFoodRecord(FoodRecord oldRecord, FoodRecord newRecord) {
    if (oldRecord == null || !meals.expand((m) => m.foodRecords).contains(oldRecord)) {
      throw ArgumentError("mealRecords must contain oldValue");
    }

    if (newRecord == null || meals.expand((m) => m.foodRecords).contains(newRecord)) {
      throw ArgumentError("mealRecords must not contain newValue");
    }

    // Idempotent if they're the same value-wise.
    if (oldRecord == newRecord) { // TOTEST: ensure comparison is by value, not by uid!
      return;
    }

    meals = BuiltList(meals.map<MealData>((meal) =>
      meal.rebuild((b) => b
        ..foodRecords.map((foodRecord) =>
          (foodRecord.uid == oldRecord.uid) ? newRecord : foodRecord
        )
      )
    ));
  }

  /// Deletes [foodRecords] from this day.
  /// Throws [ArgumentError] on invalid input.
  void deleteFoodRecords(BuiltList<FoodRecord> foodRecords) {
    if (foodRecords == null || foodRecords.isEmpty) {
      throw ArgumentError("Food records must be non-empty");
    }

    if (foodRecords.any((fr) => !meals.expand((m) => m.foodRecords).contains(fr))) {
      throw ArgumentError("Existing food records must contain food records to delete");
    }

    meals = BuiltList(meals.map<MealData>((meal) =>
      meal.rebuild((b) => b
        ..foodRecords.removeWhere((foodRecord) => foodRecords.any((toRemove) => toRemove.uid == foodRecord.uid))
      )
    ));
  }

  /// Moves [foodRecords] from this day to specified [mealIndex].
  /// Throws [ArgumentError] on invalid input.
  void moveFoodRecords(int mealIndex, BuiltList<FoodRecord> foodRecords) {
    deleteFoodRecords(foodRecords);
    addFoodRecords(mealIndex, foodRecords);
  }

  factory FoodDiaryDayBuilder() = _$FoodDiaryDayBuilder;
  FoodDiaryDayBuilder._();
}

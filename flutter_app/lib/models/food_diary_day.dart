/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
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

  /// List of meals that contain food records.
  BuiltList<MealData> get meals;

  /// Flattened list of all food records.
  BuiltList<FoodRecord> get allFoodRecords => toBuilder().allFoodRecords;

  /// Nutrients for each flattened food record.
  BuiltList<NutrientMap> get allNutrients => BuiltList(allFoodRecords.map<NutrientMap>((foodRecord) => foodRecord.totalNutrients));

  /// Nutrients for entire day.
  NutrientMap get combinedNutrients => allNutrients?.isEmpty ?? true ? null :
    allNutrients.reduce((curr, next) => curr + next);

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

  BuiltList<FoodRecord> get allFoodRecords => BuiltList(meals.expand((m) => m.foodRecords));

  /// Adds [foodRecords] to specified [mealIndex].
  /// Throws [ArgumentError] on invalid input.
  void addFoodRecords(int mealIndex, BuiltList<FoodRecord> foodRecords) {
    if (mealIndex == null || mealIndex < 0 || mealIndex >= meals.length) {
      throw ArgumentError("Meal index must be within meals' size");
    }

    if (foodRecords == null || foodRecords.isEmpty) {
      throw ArgumentError("Food records must be non-empty");
    }

    if (foodRecords.any((toAdd) => meals[mealIndex].foodRecords.any((existing) => existing.uid == toAdd.uid))) {
      throw ArgumentError("Can't add food records that already exist in meal");
    }

    final mealRecordsBuilder = meals.toBuilder();
    mealRecordsBuilder[mealIndex] = mealRecordsBuilder[mealIndex].rebuild((b) => b
      ..foodRecords.update((b) => b
        ..addAll(foodRecords)
      )
    );
    meals = mealRecordsBuilder.build();
  }

  /// Replaces food record with same uid with [foodRecord].
  /// Throws [ArgumentError] on invalid input.
  void replaceFoodRecord(FoodRecord foodRecord) {
    if (foodRecord == null || !allFoodRecords.any((existing) => existing.uid == foodRecord.uid)) {
      throw ArgumentError("mealRecords must contain food record");
    }

    // Idempotent if they're the same value-wise.
    meals = BuiltList(meals.map((meal) =>
      meal.rebuild((b) => b
        ..foodRecords.map((oldFoodRecord) =>
          (oldFoodRecord.uid == foodRecord.uid) ? foodRecord : oldFoodRecord
        )
      )
    ));
  }

  /// Deletes food records with [foodRecordUids] from this day.
  /// Throws [ArgumentError] on invalid input.
  void deleteFoodRecords(BuiltList<String> foodRecordUids) {
    if (foodRecordUids == null || foodRecordUids.isEmpty) {
      throw ArgumentError("Food records uids must be non-empty");
    }

    if (!foodRecordUids.every((toDeleteUid) => allFoodRecords.any((existing) => existing.uid == toDeleteUid))) {
      throw ArgumentError("Food record uids must be a subset of existing food records");
    }

    meals = BuiltList(meals.map((meal) =>
      meal.rebuild((b) => b
        ..foodRecords.removeWhere((foodRecord) => foodRecordUids.any((toRemoveUid) => toRemoveUid == foodRecord.uid))
      )
    ));
  }

  /// Moves this day's food records with [foodRecordUids] to specified [mealIndex].
  /// Throws [ArgumentError] on invalid input.
  /// Throws [StateError] if food record isn't found.
  void moveFoodRecords(int mealIndex, BuiltList<String> foodRecordUids) {
    final toAdd = BuiltList<FoodRecord>(foodRecordUids.map((toAddUid) => allFoodRecords.singleWhere((foodRecord) => foodRecord.uid == toAddUid)));
    deleteFoodRecords(foodRecordUids);
    addFoodRecords(mealIndex, toAdd);
  }

  factory FoodDiaryDayBuilder() = _$FoodDiaryDayBuilder;
  FoodDiaryDayBuilder._();
}

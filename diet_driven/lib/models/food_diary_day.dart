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

  /// Food records stored under keyed meal index.
  BuiltListMultimap<int, FoodRecord> get mealRecords;

  factory FoodDiaryDay([void Function(FoodDiaryDayBuilder b)]) = _$FoodDiaryDay;

  /// Data validation.
  FoodDiaryDay._() {
    if (date < 0)
      throw StateError("Date must be non-negative");
  }
}

abstract class FoodDiaryDayBuilder implements Builder<FoodDiaryDay, FoodDiaryDayBuilder> {
  int date;
  BuiltListMultimap<int, FoodRecord> mealRecords;

  /// Adds [foodRecords] to specified [mealIndex].
  void addFoodRecords(int mealIndex, BuiltList<FoodRecord> foodRecords) {
    if (mealIndex == null || mealIndex < 0) {
      throw ArgumentError("Meal index must be non-negative");
    }

    if (foodRecords == null || foodRecords.isEmpty) {
      throw ArgumentError("Food records must be non-empty");
    }

    final mealRecordsBuilder = mealRecords.toBuilder();
    mealRecordsBuilder[mealIndex].addAll(foodRecords);
    mealRecords = mealRecordsBuilder.build();
  }

  /// Replaces [oldRecord] with [newRecord].
  /// Idempotent if they're the same.
  void replaceFoodRecord(FoodRecord oldRecord, FoodRecord newRecord) {
    if (oldRecord.uuid == newRecord.uuid) {
      return;
    }

    if (oldRecord == null || !mealRecords.values.contains(oldRecord)) {
      throw ArgumentError("mealRecords must contain oldValue");
    }

    if (newRecord == null || mealRecords.values.contains(newRecord)) {
      throw ArgumentError("mealRecords must not contain newValue");
    }

    mealRecords = BuiltListMultimap<int, FoodRecord>(Map<int, Iterable<FoodRecord>>.fromIterable(
      mealRecords.keys,
      key: (dynamic key) => key,
      value: (dynamic key) => mealRecords[key].map((fr) => fr.uuid == oldRecord.uuid ? newRecord : fr)
    ));
  }

  /// Deletes [foodRecords] from this day.
  void deleteFoodRecords(BuiltList<FoodRecord> foodRecords) {
    if (foodRecords == null || foodRecords.isEmpty) {
      throw ArgumentError("Food records must be non-empty");
    }

    mealRecords = BuiltListMultimap<int, FoodRecord>(Map<int, Iterable<FoodRecord>>.fromIterable(
      mealRecords.keys,
      key: (dynamic key) => key,
      value: (dynamic key) => mealRecords[key].where((fr) => !foodRecords.any((toDelete) => fr.uuid == toDelete.uuid))
    ));
  }

  /// Moves [foodRecords] from this day to specified [mealIndex].
  void moveFoodRecords(int mealIndex, BuiltList<FoodRecord> foodRecords) {
    deleteFoodRecords(foodRecords);
    addFoodRecords(mealIndex, foodRecords);
  }

  factory FoodDiaryDayBuilder() = _$FoodDiaryDayBuilder;
  FoodDiaryDayBuilder._();
}

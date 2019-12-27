/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'food_diary_day_events.g.dart';

abstract class FoodDiaryDayEvent {}

/// Subscribes to food diary bloc state stream.
abstract class InitFoodDiaryDay implements FoodDiaryDayEvent, Built<InitFoodDiaryDay, InitFoodDiaryDayBuilder> {
  factory InitFoodDiaryDay([void Function(InitFoodDiaryDayBuilder) updates]) = _$InitFoodDiaryDay;
  InitFoodDiaryDay._();
}

/// Reactively updates current [foodDiaryDay], [diet].
abstract class IngressFoodDiaryDayArrived implements FoodDiaryDayEvent, Built<IngressFoodDiaryDayArrived, IngressFoodDiaryDayArrivedBuilder> {
  @nullable
  FoodDiaryDay get foodDiaryDay;

  Diet get diet;

  factory IngressFoodDiaryDayArrived([void Function(IngressFoodDiaryDayArrivedBuilder) updates]) = _$IngressFoodDiaryDayArrived;
  IngressFoodDiaryDayArrived._();
}

/// Adds [foodRecords] to specified [mealIndex].
/// Assumes [mealIndex] is within range of corresponding diet's meals.
abstract class AddFoodRecords implements Completable, FoodDiaryDayEvent, Built<AddFoodRecords, AddFoodRecordsBuilder> {
  int get mealIndex;

  BuiltList<FoodRecord> get foodRecords;

  factory AddFoodRecords([void Function(AddFoodRecordsBuilder) updates]) = _$AddFoodRecords;
  AddFoodRecords._();
}

/// Replaces food record with uid of with current value of [foodRecord].
abstract class ReplaceFoodRecord implements Completable, FoodDiaryDayEvent, Built<ReplaceFoodRecord, ReplaceFoodRecordBuilder> {
  FoodRecord get foodRecord;

  factory ReplaceFoodRecord([void Function(ReplaceFoodRecordBuilder) updates]) = _$ReplaceFoodRecord;
  ReplaceFoodRecord._();
}

/// Deletes food records with [foodRecordUids] from this day.
abstract class DeleteFoodRecords implements Completable, FoodDiaryDayEvent, Built<DeleteFoodRecords, DeleteFoodRecordsBuilder> {
  BuiltList<String> get foodRecordUids;

  factory DeleteFoodRecords([void Function(DeleteFoodRecordsBuilder) updates]) = _$DeleteFoodRecords;
  DeleteFoodRecords._();
}

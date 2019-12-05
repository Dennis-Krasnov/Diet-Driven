/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

/// Subscribes to data streams.
abstract class InitFoodDiary implements FoodDiaryEvent, Built<InitFoodDiary, InitFoodDiaryBuilder> {
  String get userId;

  factory InitFoodDiary([void Function(InitFoodDiaryBuilder) updates]) = _$InitFoodDiary;
  InitFoodDiary._();
}

/// Reactively updates current [diaryDays], [diets].
abstract class IngressFoodDiaryArrived implements FoodDiaryEvent, Built<IngressFoodDiaryArrived, IngressFoodDiaryArrivedBuilder> {
  BuiltList<FoodDiaryDay> get diaryDays;

  BuiltList<Diet> get diets;

  factory IngressFoodDiaryArrived([void Function(IngressFoodDiaryArrivedBuilder) updates]) = _$IngressFoodDiaryArrived;
  IngressFoodDiaryArrived._();
}

/// Throws unrecoverable exception.
abstract class FoodDiaryError implements BuiltError, FoodDiaryEvent, Built<FoodDiaryError, FoodDiaryErrorBuilder> {
  factory FoodDiaryError([void Function(FoodDiaryErrorBuilder b)]) = _$FoodDiaryError;
  FoodDiaryError._();
}

/// Adds [foodRecords] to specified [mealIndex] on [date].
/// Assumes [mealIndex] is within range of corresponding diet's meals.
abstract class GlobalAddFoodRecords implements Completable, FoodDiaryEvent, Built<GlobalAddFoodRecords, GlobalAddFoodRecordsBuilder> {
  int get date;

  int get mealIndex;

  BuiltList<FoodRecord> get foodRecords;

  factory GlobalAddFoodRecords([void Function(GlobalAddFoodRecordsBuilder) updates]) = _$GlobalAddFoodRecords;
  GlobalAddFoodRecords._();
}

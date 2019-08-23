/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

/// Subscribes to data streams.
abstract class InitFoodDiary implements FoodDiaryEvent, Built<InitFoodDiary, InitFoodDiaryBuilder> {
  factory InitFoodDiary([void Function(InitFoodDiaryBuilder) updates]) = _$InitFoodDiary;
  InitFoodDiary._();
}

/// Reactively updates current [diaryDays], [diets].
abstract class RemoteFoodDiaryArrived implements FoodDiaryEvent, Built<RemoteFoodDiaryArrived, RemoteFoodDiaryArrivedBuilder> {
  BuiltList<FoodDiaryDay> get diaryDays;

  BuiltList<Diet> get diets;

  factory RemoteFoodDiaryArrived([void Function(RemoteFoodDiaryArrivedBuilder) updates]) = _$RemoteFoodDiaryArrived;
  RemoteFoodDiaryArrived._();
}

/// Throws unrecoverable exception.
abstract class FoodDiaryError implements BuiltError, FoodDiaryEvent, Built<FoodDiaryError, FoodDiaryErrorBuilder> {
  factory FoodDiaryError([void Function(FoodDiaryErrorBuilder b)]) = _$FoodDiaryError;
  FoodDiaryError._();
}

/// TODOCUMENT
abstract class UpdateCurrentDate implements FoodDiaryEvent, Built<UpdateCurrentDate, UpdateCurrentDateBuilder> {
  int get currentDate;

  factory UpdateCurrentDate([void Function(UpdateCurrentDateBuilder) updates]) = _$UpdateCurrentDate;
  UpdateCurrentDate._();
}

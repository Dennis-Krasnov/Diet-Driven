import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

/// Reactively updates current [FoodDiaryDay], shows food diary day.
abstract class RemoteDiaryDayArrived with FoodDiaryEvent implements Built<RemoteDiaryDayArrived, RemoteDiaryDayArrivedBuilder> {
  FoodDiaryDay get foodDiaryDay;

  Diet get diet;

  RemoteDiaryDayArrived._();
  factory RemoteDiaryDayArrived([updates(RemoteDiaryDayArrivedBuilder b)]) = _$RemoteDiaryDayArrived;
}

/// Shows error page.
abstract class FoodDiaryError with FoodDiaryEvent implements Built<FoodDiaryError, FoodDiaryErrorBuilder> {
  String get error;
  String get trace;

  FoodDiaryError._();
  factory FoodDiaryError([updates(FoodDiaryErrorBuilder b)]) = _$FoodDiaryError;
}

/// Adds [BuiltList] of [FoodRecord]s to [FoodDiaryDay].
abstract class AddFoodRecords with Completable, FoodDiaryEvent implements Built<AddFoodRecords, AddFoodRecordsBuilder> {
  BuiltList<FoodRecord> get foodRecords;

  AddFoodRecords._();
  factory AddFoodRecords([updates(AddFoodRecordsBuilder b)]) = _$AddFoodRecords;
}

/// Deletes [BuiltList] of [FoodRecord]s from [FoodDiaryDay].
abstract class DeleteFoodRecords with Completable, FoodDiaryEvent implements Built<DeleteFoodRecords, DeleteFoodRecordsBuilder> {
  BuiltList<FoodRecord> get foodRecords;

  DeleteFoodRecords._();
  factory DeleteFoodRecords([updates(DeleteFoodRecordsBuilder b)]) = _$DeleteFoodRecords;
}

/// Updates [oldRecord] to [newRecord] in [FoodDiaryDay].
abstract class UpdateFoodRecord with Completable, FoodDiaryEvent implements Built<UpdateFoodRecord, UpdateFoodRecordBuilder> {
  FoodRecord get oldRecord;
  FoodRecord get newRecord;

  UpdateFoodRecord._();
  factory UpdateFoodRecord([updates(UpdateFoodRecordBuilder b)]) = _$UpdateFoodRecord;
}

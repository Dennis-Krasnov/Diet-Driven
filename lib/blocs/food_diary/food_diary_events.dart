import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

/// Reactively updates current [FoodDiaryDay], shows food diary day.
abstract class RemoteDiaryDayArrived with FoodDiaryEvent implements Built<RemoteDiaryDayArrived, RemoteDiaryDayArrivedBuilder> {
  FoodDiaryDay get foodDiaryDay;

  RemoteDiaryDayArrived._();
  factory RemoteDiaryDayArrived([updates(RemoteDiaryDayArrivedBuilder b)]) = _$RemoteDiaryDayArrived;
}

/// Adds [FoodRecord] to [FoodDiaryDay].
abstract class AddFoodRecord with Completable, FoodDiaryEvent implements Built<AddFoodRecord, AddFoodRecordBuilder> {
  FoodRecord get foodRecord;

  AddFoodRecord._();
  factory AddFoodRecord([updates(AddFoodRecordBuilder b)]) = _$AddFoodRecord;
}

/// Deletes [FoodRecord] from [FoodDiaryDay].
abstract class DeleteFoodRecord with Completable, FoodDiaryEvent implements Built<DeleteFoodRecord, DeleteFoodRecordBuilder> {
  FoodRecord get foodRecord;

  DeleteFoodRecord._();
  factory DeleteFoodRecord([updates(DeleteFoodRecordBuilder b)]) = _$DeleteFoodRecord;
}

/// Edits [FoodRecord] in [FoodDiaryDay].
abstract class EditFoodRecord with Completable, FoodDiaryEvent implements Built<EditFoodRecord, EditFoodRecordBuilder> {
  FoodRecord get oldRecord;
  FoodRecord get newRecord;

  EditFoodRecord._();
  factory EditFoodRecord([updates(EditFoodRecordBuilder b)]) = _$EditFoodRecord;
}

/// Shows error page.
abstract class FoodDiaryError with FoodDiaryEvent implements Built<FoodDiaryError, FoodDiaryErrorBuilder> {
  String get error;

  FoodDiaryError._();
  factory FoodDiaryError([updates(FoodDiaryErrorBuilder b)]) = _$FoodDiaryError;
}

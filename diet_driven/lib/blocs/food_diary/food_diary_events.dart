import 'dart:async';

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

/// ... to specific [mealIndex].
/// Assumes [mealIndex] is within range of corresponding diet's meals.
abstract class AddFoodRecords implements Completable, FoodDiaryEvent, Built<AddFoodRecords, AddFoodRecordsBuilder> {
  int get date;

  int get mealIndex;

  BuiltList<FoodRecord> get foodRecords;

  factory AddFoodRecords([void Function(AddFoodRecordsBuilder) updates]) = _$AddFoodRecords;
  AddFoodRecords._();
}

//  ongoingDaysSubscription, historicalDaysSubscription
// TODO: update currentDate event!
///// Adds [BuiltList] of [FoodRecord]s to [FoodDiaryDay].
//abstract class AddFoodRecords with Completable, FoodDiaryEvent implements Built<AddFoodRecords, AddFoodRecordsBuilder> {
//  BuiltList<FoodRecord> get foodRecords;
//
//  factory AddFoodRecords([void Function(AddFoodRecordsBuilder b)]) = _$AddFoodRecords;
//  AddFoodRecords._();
//}
//
///// Deletes [BuiltList] of [FoodRecord]s from [FoodDiaryDay].
//abstract class DeleteFoodRecords with Completable, FoodDiaryEvent implements Built<DeleteFoodRecords, DeleteFoodRecordsBuilder> {
//  BuiltList<FoodRecord> get foodRecords;
//
//  factory DeleteFoodRecords([void Function(DeleteFoodRecordsBuilder b)]) = _$DeleteFoodRecords;
//  DeleteFoodRecords._();
//}
//
///// Updates [oldRecord] to [newRecord] in [FoodDiaryDay].
///// Replacing a non-existent [oldRecord] has no effect.
///// Adding a duplicate [newRecord] has no effect.
///// Only available when in [FoodDiaryLoaded]. // TODOCUMENT other events in all blocs
//abstract class ReplaceFoodRecord with Completable, FoodDiaryEvent implements Built<ReplaceFoodRecord, ReplaceFoodRecordBuilder> {
//  FoodRecord get oldRecord;
//  FoodRecord get newRecord;
//
//  factory ReplaceFoodRecord([void Function(ReplaceFoodRecordBuilder b)]) = _$ReplaceFoodRecord;
//  ReplaceFoodRecord._();
//}
/// TODO: rename all `edit` to `update` and `add` to `insert`
//    Observable<FoodDiaryDay> _foodDiaryDayStream = diaryRepository.streamDiaryDay(userId, daysSinceEpoch);//.doOnData((data) => print(" DATA: $data"));
//
//    // TODO: diet! -> merge together into event stream -> listen(dispatch)
//
//    _foodDiaryDaySubscription = _foodDiaryDayStream.listen((foodDiaryDay) =>
//      // TODO: call repository for this day's diet (returns as Observable.just() if historical or live stream if today)
//      // hardcode it for now! // TOTEST see user data tests
//      dispatch(RemoteDiaryDayArrived((b) => b..foodDiaryDay = foodDiaryDay.toBuilder())),
//      onError: (Error error, StackTrace trace) => dispatch(FoodDiaryError((b) => b..error = error.toString())),
//        // TODO .switchIfEmpty(fallbackStream) for caching and loading historical configs
//    );
//  }

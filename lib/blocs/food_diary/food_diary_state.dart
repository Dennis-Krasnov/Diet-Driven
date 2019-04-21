import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

///
abstract class FoodDiaryUninitialized with FoodDiaryState implements Built<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  FoodDiaryUninitialized._();
  factory FoodDiaryUninitialized([updates(FoodDiaryUninitializedBuilder b)]) = _$FoodDiaryUninitialized;

  @override String toString() => runtimeType.toString();
}

/// Shows food diary, temporary skeleton widgets until stream data arrives, stores current [FoodDiaryDay] stream.
abstract class FoodDiaryReady with FoodDiaryState implements Built<FoodDiaryReady, FoodDiaryReadyBuilder> {
//  ValueObservable<FoodDiaryDay> get diaryDay;
  ValueObservable<FoodDiaryDay> get diaryDayStream;

  // TODO: create generic diary wrapper! (for pageview)
//  ValueObservable<BuiltList<FoodDiaryDay>> get diaryDays;
//  int get currentDate;
//  String get timeFrame; // daily vs. weekly

  FoodDiaryReady._();
  factory FoodDiaryReady([updates(FoodDiaryReadyBuilder b)]) = _$FoodDiaryReady;
}

//abstract class FoodDiaryReadyBuilder implements Builder<FoodDiaryReady, FoodDiaryReadyBuilder> {
////  ValueObservable<BuiltList<FoodDiaryDay>> diaryDays;
////  int currentDate = 0; // TODO: today
//
//  factory FoodDiaryReadyBuilder() = _$FoodDiaryReadyBuilder;
//  FoodDiaryReadyBuilder._();
//}

///
abstract class FoodDiaryFailed with FoodDiaryState implements Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  String get error;

  FoodDiaryFailed._();
  factory FoodDiaryFailed([updates(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
}

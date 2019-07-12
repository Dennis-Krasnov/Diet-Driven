import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

/// Skeleton page.
abstract class FoodDiaryUninitialized implements FoodDiaryState, Built<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  factory FoodDiaryUninitialized([void Function(FoodDiaryUninitializedBuilder b)]) = _$FoodDiaryUninitialized;
  FoodDiaryUninitialized._();

  @override String toString() => runtimeType.toString();
}

/// Error page.
abstract class FoodDiaryFailed implements FoodDiaryState, Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  Object get error;

  StackTrace get trace;

  factory FoodDiaryFailed([void Function(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
  FoodDiaryFailed._();
}

/// Food diary day, stores current [FoodDiaryDay].
abstract class FoodDiaryLoaded implements FoodDiaryState, Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  ///
  int get currentDate;

  ///
  BuiltMap<int, FoodDiaryDay> get diaryDays;

  ///
  BuiltList<Diet> get diets;

//  ongoingDaysSubscription, historicalDaysSubscription

  factory FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
  FoodDiaryLoaded._();
}

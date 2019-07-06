import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

/// Skeleton meals and food records.
abstract class FoodDiaryUninitialized with FoodDiaryState implements Built<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  factory FoodDiaryUninitialized([void Function(FoodDiaryUninitializedBuilder b)]) = _$FoodDiaryUninitialized;
  FoodDiaryUninitialized._();

  @override String toString() => runtimeType.toString();
}

/// Error page.
abstract class FoodDiaryFailed with FoodDiaryState implements Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  String get error;

  String get trace;

  factory FoodDiaryFailed([void Function(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
  FoodDiaryFailed._();
}

/// Food diary day, stores current [FoodDiaryDay].
abstract class FoodDiaryLoaded with FoodDiaryState implements Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  ///
  FoodDiaryDay get foodDiaryDay;

  ///
  Diet get diet;

  factory FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
  FoodDiaryLoaded._();
}



// TODO: create generic diary wrapper! (for pageview)
//  ValueObservable<BuiltList<FoodDiaryDay>> get diaryDays;
//  int get currentDate;
//  String get timeFrame; // daily vs. weekly

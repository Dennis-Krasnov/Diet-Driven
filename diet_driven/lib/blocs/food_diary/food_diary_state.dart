import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

/// Skeleton meals and food records.
abstract class FoodDiaryUninitialized with FoodDiaryState implements Built<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  FoodDiaryUninitialized._();
  factory FoodDiaryUninitialized([void Function(FoodDiaryUninitializedBuilder b)]) = _$FoodDiaryUninitialized;

  @override String toString() => runtimeType.toString();
}

/// Error page.
abstract class FoodDiaryFailed with FoodDiaryState implements Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  String get error;

  String get trace;

  FoodDiaryFailed._();
  factory FoodDiaryFailed([void Function(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
}

/// Food diary day, stores current [FoodDiaryDay].
abstract class FoodDiaryLoaded with FoodDiaryState implements Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  ///
  FoodDiaryDay get foodDiaryDay;

  ///
  Diet get diet;

  ///
  int get skipNextNArrivals;

  FoodDiaryLoaded._();
  factory FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
}

abstract class FoodDiaryLoadedBuilder implements Builder<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  FoodDiaryDay foodDiaryDay;

  Diet diet;

  int skipNextNArrivals = 0;

  factory FoodDiaryLoadedBuilder() = _$FoodDiaryLoadedBuilder;
  FoodDiaryLoadedBuilder._();
}

// TODO: create generic diary wrapper! (for pageview)
//  ValueObservable<BuiltList<FoodDiaryDay>> get diaryDays;
//  int get currentDate;
//  String get timeFrame; // daily vs. weekly

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

/// Skeleton app bar and food records.
abstract class FoodDiaryUninitialized implements FoodDiaryState, Built<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  factory FoodDiaryUninitialized([void Function(FoodDiaryUninitializedBuilder b)]) = _$FoodDiaryUninitialized;
  FoodDiaryUninitialized._();

  @override String toString() => runtimeType.toString();
}

/// Error page.
abstract class FoodDiaryFailed implements BuiltError, FoodDiaryState, Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  factory FoodDiaryFailed([void Function(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
  FoodDiaryFailed._();
}

/// Food diary day switcher.
abstract class FoodDiaryLoaded implements FoodDiaryState, Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  ///
  int get currentDate;

  ///
  BuiltMap<int, FoodDiaryDay> get diaryDays;

  ///
  BuiltList<Diet> get diets;

  factory FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
  FoodDiaryLoaded._();
}

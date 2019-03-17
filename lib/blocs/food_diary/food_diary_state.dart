import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

// Instead of adding a loading flag, I'm creating a separate state, as foodDiaryDays shouldn't be accessible from loading state.

///
abstract class FoodDiaryLoading with FoodDiaryState implements Built<FoodDiaryLoading, FoodDiaryLoadingBuilder> {
  FoodDiaryLoading._();
  factory FoodDiaryLoading([updates(FoodDiaryLoadingBuilder b)]) = _$FoodDiaryLoading;
}

///
abstract class FoodDiaryLoaded with FoodDiaryState implements Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  List<FoodDiaryDay> get foodDiaryDays;

  FoodDiaryLoaded._();
  factory FoodDiaryLoaded([updates(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
}

///
abstract class FoodDiaryFailed with FoodDiaryState implements Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  String get errorMessage;

  FoodDiaryFailed._();
  factory FoodDiaryFailed([updates(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
}
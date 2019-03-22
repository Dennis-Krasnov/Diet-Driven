import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/blocs.dart';

import 'package:diet_driven/models/models.dart';
import 'package:rxdart/rxdart.dart';

part 'food_diary_state.g.dart';

abstract class FoodDiaryState {}

///
abstract class FoodDiaryLoading with FoodDiaryState implements Built<FoodDiaryLoading, FoodDiaryLoadingBuilder> {
  FoodDiaryLoading._();
  factory FoodDiaryLoading([updates(FoodDiaryLoadingBuilder b)]) = _$FoodDiaryLoading;

  @override
  String toString() => runtimeType.toString();
}

///
abstract class FoodDiaryLoaded with FoodDiaryState implements Built<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  ValueObservable<BuiltList<FoodDiaryDay>> get foodDiaryDayStream;

  FoodDiaryLoaded._();
  factory FoodDiaryLoaded([updates(FoodDiaryLoadedBuilder b)]) = _$FoodDiaryLoaded;
}

///
abstract class FoodDiaryFailed with FoodDiaryState implements Built<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  String get errorMessage;

  FoodDiaryFailed._();
  factory FoodDiaryFailed([updates(FoodDiaryFailedBuilder b)]) = _$FoodDiaryFailed;
}

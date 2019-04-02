import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

///
abstract class RemoteDiaryArrived with FoodDiaryEvent implements Built<RemoteDiaryArrived, RemoteDiaryArrivedBuilder> {
//  BuiltList<FoodDiaryDay> get diaryDays;
  ValueObservable<BuiltList<FoodDiaryDay>> get diaryDays;

  RemoteDiaryArrived._();
  factory RemoteDiaryArrived([updates(RemoteDiaryArrivedBuilder b)]) = _$RemoteDiaryArrived;
}

///
abstract class SaveFoodDiaryDay with FoodDiaryEvent implements Built<SaveFoodDiaryDay, SaveFoodDiaryDayBuilder> {
  String get userId;
  FoodDiaryDay get day;

  SaveFoodDiaryDay._();
  factory SaveFoodDiaryDay([updates(SaveFoodDiaryDayBuilder b)]) = _$SaveFoodDiaryDay;
}

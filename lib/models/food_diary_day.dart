import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_day.g.dart';

abstract class FoodDiaryDay implements Built<FoodDiaryDay, FoodDiaryDayBuilder> {
//  static Serializer<FoodDiaryDay> get serializer => _$foodDiaryDaySerializer;

//  BuiltList<FoodRecord> get foodRecords;
  List<FoodRecord> get foodRecords;

  FoodDiaryDay._();
  factory FoodDiaryDay([updates(FoodDiaryDayBuilder b)]) = _$FoodDiaryDay;
}
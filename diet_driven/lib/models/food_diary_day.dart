import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_day.g.dart';

abstract class FoodDiaryDay implements Built<FoodDiaryDay, FoodDiaryDayBuilder> {
  static Serializer<FoodDiaryDay> get serializer => _$foodDiaryDaySerializer;

  int get date;
  BuiltList<FoodRecord> get foodRecords;

  factory FoodDiaryDay([void Function(FoodDiaryDayBuilder b)]) = _$FoodDiaryDay;
  FoodDiaryDay._();
}

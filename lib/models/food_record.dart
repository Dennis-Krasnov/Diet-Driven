library food_record;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'food_record.g.dart';

abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  String get foodName;

  FoodRecord._();
  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord;
}
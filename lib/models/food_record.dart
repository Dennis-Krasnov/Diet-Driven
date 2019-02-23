library food_record;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:diet_driven/models/uncertainty.dart';

part 'food_record.g.dart';

///
abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  @BuiltValueField(serialize: true, compare: false, wireName: "_id")
  @nullable
  String get id;

  DateTime get timestamp;

  String get foodName;
  Uncertainty get uncertainty;
  double get grams;

//  @BuiltValueField(wireName: 'NaCl')
  @nullable
  double get sodium;

  // TODO: portion size, portion quantity
  // TODO: nutrition (/100grams) object

  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord;

  FoodRecord._();
}

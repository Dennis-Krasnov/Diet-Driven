library food_record;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:diet_driven/models/uncertainty.dart';

part 'food_record.g.dart';

///
abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

//  factory FoodRecord() => new _$FoodRecord._(
//    foodName: "",
//    uncertainty: Uncertainty.accurate,
//    grams: 0,
//    sodium: 5
//  );

  String get foodName;
  Uncertainty get uncertainty;
  double get grams;

//  @BuiltValueField(wireName: 'NaCl')
  @nullable
  double get sodium;

  // TODO: portion size, portion quantity
  // TODO: nutrition (/100grams) object

  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord; //  new FoodRecord((b) => b..foodName = command ..update(updates))

  FoodRecord._();
}

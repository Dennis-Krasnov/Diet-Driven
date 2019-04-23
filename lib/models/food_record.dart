import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:diet_driven/models/models.dart';

part 'food_record.g.dart';

abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  String get foodName;

  @nullable
  num get quantity;

//  @nullable
//  Calories get calories;

  /// Macronutrients
//  @nullable
//  Protein get protein;

//  @nullable
//  Fat get fat;

//  @nullable
//  Carbs get carbs;

  /// Minerals
//  @nullable
//  Calcium get calcium;

  // etc

  /// Vitamins
//  @nullable
//  VitaminB1 get B1;

  // etc

  FoodRecord._();
  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord;
}

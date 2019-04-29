import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

part 'food_record.g.dart';

abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  // Must compare by uuid explicitly
  @BuiltValueField(compare: false)
  String get uuid;

  ///
  String get foodName;

  ///
  @nullable
  num get quantity;

  ///
  @nullable
  int get mealIndex;

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

abstract class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  String uuid = Uuid().v4();
  String foodName;
  num quantity;
  int mealIndex;


  // Parses e.g. John "Joe" Smith into username+nickname.
//  void parseUser(String user) {
//    ...
//  }

//  var user = new User((b) => b..parseUser('John "Joe" Smith'));
//https://medium.com/dartlang/darts-built-value-for-immutable-object-models-83e2497922d4
  // TODO: use this to manually parse from edamam without making a custom serializer!!!

  factory FoodRecordBuilder() = _$FoodRecordBuilder;
  FoodRecordBuilder._();
}

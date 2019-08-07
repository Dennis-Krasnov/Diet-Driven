import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

part 'food_record.g.dart';

abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  /// Must compare by uuid explicitly
  @BuiltValueField(compare: false)
  String get uuid;

  // TODO: edamam ID

  ///
  String get foodName;

  ///
//  @nullable
//  int get mealIndex;

  ///
  @nullable
  num get grams;

  /// NUTRIENTS

  ///
  @nullable
  num get calories;

  ///
  @nullable
  num get protein;

  ///
  @nullable
  num get fat;

  ///
  @nullable
  num get carbs;

  /// Minerals
//  @nullable
//  Calcium get calcium;

  // etc

  /// Vitamins
//  @nullable
//  VitaminB1 get B1;

  // etc

  FoodRecord._();
  factory FoodRecord([void Function(FoodRecordBuilder b)]) = _$FoodRecord;
}

abstract class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  String uuid = Uuid().v4();
  String foodName;
//  int mealIndex;

  num grams;
  num calories;
  num protein;
  num fat;
  num carbs;


  // Parses e.g. John "Joe" Smith into username+nickname.
//  void parseUser(String user) {
//    ...
//  }

//  var user = new User((b) => b..parseUser('John "Joe" Smith'));
//https://medium.com/dartlang/darts-built-value-for-immutable-object-models-83e2497922d4


  // TODO: make builder update to:
  // to normalize to 1 gram (private)
  // to scale by n (private)

  // to update to different quantity (public)


  factory FoodRecordBuilder() = _$FoodRecordBuilder;
  FoodRecordBuilder._();
}

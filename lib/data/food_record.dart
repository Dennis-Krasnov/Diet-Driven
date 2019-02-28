library food_record;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/data/uncertainty.dart';
import 'package:diet_driven/util/built_firestore.dart';

part 'food_record.g.dart';

///
abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  // Firestore ID (redundant)
  @BuiltValueField(serialize: true, compare: false, wireName: "_id")
  @nullable
  String get id;

  // Edamam foodId // TODO: abstract nutrition API to agnostic api
  @nullable
  String get edamamId;

  // Day to which food record belongs to
  @nullable
  int get daysSinceEpoch;

  // Explicit reference to corresponding meal snapshot (redundant)
  @nullable
  String get mealSnapshotId;

  // Index of meal in a day
  @nullable
  int get mealIndex;

  // Orders foods within a meal
  @nullable
  DateTime get timestamp;

  //
  String get foodName;

  //
  @nullable
  String get manufacturer;

  //
  Uncertainty get uncertainty;

  //
  double get grams;

  @nullable
  double get sodium;

  // TODO: portion size, portion quantity
  // TODO: nutrition (/100grams) object

  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord;

  FoodRecord._();
}

library food_record;

//import 'dart:collection';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/uncertainty.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'food_record.g.dart';

abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  FoodRecord._();

  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord; //  new FoodRecord((b) => b..foodName = command)

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
}

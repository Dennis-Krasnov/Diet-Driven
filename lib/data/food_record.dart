library food_record;

import 'dart:async';

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

  // TODO: abstract nutrition API to agnostic api
  // Edamam foodId
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

  // TODO: portion size, portion quantity, nutrition (/100grams) object

  factory FoodRecord([updates(FoodRecordBuilder b)]) = _$FoodRecord;

  FoodRecord._();
}

///
abstract class FoodRecordDocument with FSDocument<FoodRecord> implements Built<FoodRecordDocument, FoodRecordDocumentBuilder> {
  @nullable
  String get userId;

  String get foodRecordId;

  @override
  DocumentReference get docRef => Firestore.instance.document("users/$userId/food_diary/$foodRecordId");

  //
  FoodDiaryCollection get toFoodDiaryCollection => FoodDiaryCollection((b) => b..userId = userId);

  // TODO: custom serialization if needed (subcollections)

  FoodRecordDocument._();
  factory FoodRecordDocument([updates(FoodRecordDocumentBuilder b)]) = _$FoodRecordDocument;
}

///
abstract class FoodDiaryCollection with FSCollection<FoodRecord> implements Built<FoodDiaryCollection, FoodDiaryCollectionBuilder> {
  @nullable
  String get userId;

  @override
  CollectionReference get colRef => Firestore.instance.collection("users/$userId/food_diary");

  FoodDiaryCollection._();
  factory FoodDiaryCollection([updates(FoodDiaryCollectionBuilder b)]) = _$FoodDiaryCollection;
}
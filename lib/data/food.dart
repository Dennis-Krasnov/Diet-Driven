library food;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/data/uncertainty.dart';
import 'package:diet_driven/util/built_firestore.dart';

part 'food.g.dart';

abstract class FoodDiaryDay implements Built<FoodDiaryDay, FoodDiaryDayBuilder> {
  static Serializer<FoodDiaryDay> get serializer => _$foodDiaryDaySerializer;

  // Firestore ID
  @BuiltValueField(serialize: true, compare: false, wireName: "_id")
  String get id;

  // Derived from Firestore ID
  int get daysSinceEpoch => int.parse(id);

  // TODO
  // Explicit reference to corresponding meal snapshot
  // Cloud functions fills in most recent mealsSnapshot on /users/food_diary/{day} create (defaults to 0)
  // Clod functions updates /users/food_diary/{today} on users/meals_snapshot/{effective_as_of} create
  String get appertainingMealsSnapshotId;

  BuiltList<FoodRecord> get foodRecords;

  factory FoodDiaryDay([updates(FoodDiaryDayBuilder b)]) = _$FoodDiaryDay;

  FoodDiaryDay._();
}

abstract class FoodDiaryDayBuilder implements Builder<FoodDiaryDay, FoodDiaryDayBuilder> {
  String id = "0";

  String appertainingMealsSnapshotId = "0";

  BuiltList<FoodRecord> foodRecords = BuiltList<FoodRecord>.from([]);

  factory FoodDiaryDayBuilder() = _$FoodDiaryDayBuilder;
  FoodDiaryDayBuilder._();
}

///
abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  // Self-generated ID for explicit comparisons
  @BuiltValueField(serialize: false, compare: false)//, wireName: "_id")
  @nullable
  String get id;

  // TODO: abstract nutrition API to agnostic api
  // Edamam foodId
  @nullable
  String get edamamId;

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

abstract class FoodDiaryDayDocument with FSDocument<FoodDiaryDay> implements Built<FoodDiaryDayDocument, FoodDiaryDayDocumentBuilder> {
  @nullable
  String get userId;

  String get daysSinceEpoch;

  @override
  DocumentReference get docRef => Firestore.instance.document("users/$userId/food_diary/$daysSinceEpoch");

  FoodDiaryDayDocument._();
  factory FoodDiaryDayDocument([updates(FoodDiaryDayDocumentBuilder b)]) = _$FoodDiaryDayDocument;
}

abstract class FoodDiaryCollection with FSCollection<FoodDiaryDay> implements Built<FoodDiaryCollection, FoodDiaryCollectionBuilder> {
  @nullable
  String get userId;

  @override
  CollectionReference get colRef => Firestore.instance.collection("users/$userId/food_diary");

  FoodDiaryCollection._();
  factory FoodDiaryCollection([updates(FoodDiaryCollectionBuilder b)]) = _$FoodDiaryCollection;
}
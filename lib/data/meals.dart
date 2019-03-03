library meals;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/util/built_firestore.dart';

part 'meals.g.dart';

///
abstract class MealInfo implements Built<MealInfo, MealInfoBuilder> {
  static Serializer<MealInfo> get serializer => _$mealInfoSerializer;

  //
  String get name;

  // In duration after midnight (0 <= startAt < 24h)
  Duration get startsAt;

  // in the day (redundant)
  int get mealIndex;

  factory MealInfo([updates(MealInfoBuilder b)]) = _$MealInfo;

  MealInfo._();
}

///
abstract class MealsSnapshot implements Built<MealsSnapshot, MealsSnapshotBuilder> {
  static Serializer<MealsSnapshot> get serializer => _$mealsSnapshotSerializer;

  @BuiltValueField(serialize: true, compare: false, wireName: "_id")
  String get id;

  // Derived from Firestore ID, in days since epoch
  int get effectiveAsOf => int.parse(id);

  // Iin UTC
  DateTime get modifiedAt;

  //
  BuiltList<MealInfo> get meals;

  factory MealsSnapshot([updates(MealsSnapshotBuilder b)]) = _$MealsSnapshot;

  MealsSnapshot._();
}

// TODO: upload default values upon account creation (also with all settings, navigation)
abstract class MealsSnapshotBuilder implements Builder<MealsSnapshot, MealsSnapshotBuilder> {
  // Default mealsSnapshot
  String id = "0";

  // Default modified date
  DateTime modifiedAt = DateTime.utc(0);

  // Default meals
  BuiltList<MealInfo> meals = BuiltList.from([
    MealInfo((b) => b
      ..mealIndex = 0
      ..name = "Breakfast"
      ..startsAt = Duration(hours: 6)
    ),
    MealInfo((b) => b
      ..mealIndex = 1
      ..name = "Lunch"
      ..startsAt = Duration(hours: 9)
    ),
    MealInfo((b) => b
      ..mealIndex = 2
      ..name = "Dinner"
      ..startsAt = Duration(hours: 15)
    ),
    MealInfo((b) => b
      ..mealIndex = 3
      ..name = "Snacks"
      ..startsAt = Duration(hours: 18)
    ),
  ]);

  factory MealsSnapshotBuilder() = _$MealsSnapshotBuilder;
  MealsSnapshotBuilder._();
}

// idea: different meal schedules on different days (like calorie cycling) - use for this? - keep it simple

///
abstract class MealSnapshotCollection with FSCollection<MealsSnapshot> implements Built<MealSnapshotCollection, MealSnapshotCollectionBuilder> {
  @nullable
  String get userId;

  @override
  CollectionReference get colRef => Firestore.instance.collection("users/$userId/meal_snapshots");

  MealSnapshotCollection._();
  factory MealSnapshotCollection([updates(MealSnapshotCollectionBuilder b)]) = _$MealSnapshotCollection;
}
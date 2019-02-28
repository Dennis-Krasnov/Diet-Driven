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
  @nullable
  String get id;

  // Days since epoch, maximum one per day
  int get effectiveAsOf;

  // Sort by this, in UTC
  DateTime get modifiedAt;

  //
  BuiltList<MealInfo> get meals;

  factory MealsSnapshot([updates(MealsSnapshotBuilder b)]) = _$MealsSnapshot;

  MealsSnapshot._();
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
library meals;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'meals.g.dart';

///
abstract class MealsSnapshot implements Built<MealsSnapshot, MealsSnapshotBuilder> {
  static Serializer<MealsSnapshot> get serializer => _$mealsSnapshotSerializer;

  @BuiltValueField(serialize: true, compare: false, wireName: "_id")
  @nullable
  String get id;

  // Days since epoch, maximum one per day
  int get effectiveAsOf;

  //
  BuiltList<MealInfo> get meals;

  factory MealsSnapshot([updates(MealsSnapshotBuilder b)]) = _$MealsSnapshot;

  MealsSnapshot._();
}

// idea: different meal schedules on different days (like calorie cycling) - use for this? - keep it simple

///
abstract class MealInfo implements Built<MealInfo, MealInfoBuilder> {
  static Serializer<MealInfo> get serializer => _$mealInfoSerializer;

  //
  String get name;

  // (in the day) - rename (effectiveAsOf) (time from midnight) - must be positive?
  // calculate by doing difference with dummy date
  Duration get startsAt;

  // in the day (redundant)
  int get mealIndex;

  factory MealInfo([updates(MealInfoBuilder b)]) = _$MealInfo;

  MealInfo._();
}
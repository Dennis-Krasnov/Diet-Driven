import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'diet.g.dart';

abstract class Diet implements Built<Diet, DietBuilder> {
  num get calories;

  BuiltList<String> get meals;
  // TODO: meal objects with start time,
  //  bool whether they count in 'mealindexRightNow', at least one must have this.

  // TODO: always assert 0 <= mealIndex < meals.length

  // TODO: 'mealIndexRightNow()` method

  Diet._();
  factory Diet([updates(DietBuilder b)]) = _$Diet;
}

abstract class DietBuilder implements Builder<Diet, DietBuilder> {
  num calories;

  BuiltList<String> meals = BuiltList(["Breakfast", "Lunch", "Dinner", "Snacks"]);

  factory DietBuilder() = _$DietBuilder;
  DietBuilder._();
}

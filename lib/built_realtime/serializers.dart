library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/meals.dart';
import 'package:diet_driven/models/uncertainty.dart';

part 'serializers.g.dart';

/// Defines each serializable type.
@SerializersFor(const [
  FoodRecord,
  Uncertainty,
//  MealInfo,
//  MealsSnapshot
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer
final Serializers standardSerializers = (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
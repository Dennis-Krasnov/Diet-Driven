library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/models/settings_state.dart';
import 'package:diet_driven/data/uncertainty.dart';

part 'serializers.g.dart';

/// Defines each serializable type.
@SerializersFor(const [
  FoodRecord,
  Uncertainty,
//  MealInfo,
//  MealsSnapshot,
  SettingsState
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer
final Serializers standardSerializers = (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
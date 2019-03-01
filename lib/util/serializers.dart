library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/models/settings_state.dart';
import 'package:diet_driven/data/uncertainty.dart';

part 'serializers.g.dart';

/// Defines each serializable type.
@SerializersFor(const [
  FoodRecord,
  Uncertainty,
  NavigationState,
  Page,
//  MealInfo,
//  MealsSnapshot,
  SettingsState
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer (can't simply do serializers.rebuild((b) => b) for some reason)
final Serializers standardSerializers = (serializers.toBuilder()
  ..addBuilderFactory(
    const FullType(BuiltList, const [const FullType(Page)]),
    () => new ListBuilder<Page>()
  )
  ..addPlugin(new StandardJsonPlugin())
).build();
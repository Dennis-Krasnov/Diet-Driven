/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/nutrient_type.dart';

part 'serializers.g.dart';

@SerializersFor([
  FoodRecord,
  FoodDiaryDay,
  MealData,
  MealInfo,

  Page,

  Nutrient,
  NutrientMap,
  NutrientType,

//  UserData,
  Authentication,
  UserDocument,
  Settings,
  SubscriptionType,
  ThemeSettings,
  NavigationSettings,

//  Uncertainty,
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer
final Serializers jsonSerializers = (serializers.toBuilder()
  // Supporting built collections with custom classes
  ..addBuilderFactory(const FullType(BuiltList, [FullType(FoodRecord)]), () => ListBuilder<FoodRecord>())
  ..addBuilderFactory(const FullType(BuiltList, [FullType(FoodDiaryDay)]), () => ListBuilder<FoodDiaryDay>())
   ..addBuilderFactory(const FullType(BuiltListMultimap, [FullType(String), FullType(FoodRecord)]), () => ListMultimapBuilder<String, FoodRecord>())
//   Converting to JSON
  ..addPlugin(StandardJsonPlugin())
).build();


// TEMPLATE
// ..addBuilderFactory(const FullType(BuiltListMultimap, [FullType.object, FullType.object]), () => ListMultimapBuilder<Object, Object>())
// ..addBuilderFactory(const FullType(BuiltList, [FullType.object]), () => ListBuilder<Object>())

//I/flutter ( 9584):   error=Deserializing '[FoodDiaryDay, date, 124, mealRecords, {0: []}, foodRecords, [{foodName: Some...' to 'unspecified' failed due to: Deserializing '[0, []]' to 'BuiltListMultimap<String, FoodRecord>' failed due to: Bad state: No builder factory for BuiltListMultimap<String, FoodRecord>. Fix by adding one, see SerializersBuilder.addBuilderFactory.,
//I/flutter ( 9584):   error=Deserializing '[FoodDiaryDay, date, 124, mealRecords, {0: []}, foodRecords, [{foodName: Some...' to 'unspecified' failed due to: type '_BuiltListMultimap<String, FoodRecord>' is not a subtype of type 'BuiltListMultimap<int, FoodRecord>',

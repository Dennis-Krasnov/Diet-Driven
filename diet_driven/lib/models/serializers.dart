/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/iso_8601_duration_serializer.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/nutrient_type.dart';

part 'serializers.g.dart';

@SerializersFor([
  // Diary
  FoodDiaryDay,
  MealData,
  MealInfo,

  // Food records
  FoodRecord,
  NutrientMap,
  Nutrient,
  NutrientType,
  SearchResult,

  // User data
  Authentication,
  UserDocument,
  Settings,
  SubscriptionType,
  ThemeSettings,
  NavigationSettings,

  // Other
  Page,
])

// Built value default serializer
final Serializers serializers = _$serializers;

// JSON serializer
final Serializers jsonSerializers = (serializers.toBuilder()
  // Supporting built collections with custom built value elements
  ..addBuilderFactory(const FullType(BuiltList, [FullType(FoodRecord)]), () => ListBuilder<FoodRecord>())
  ..addBuilderFactory(const FullType(BuiltList, [FullType(FoodDiaryDay)]), () => ListBuilder<FoodDiaryDay>())
  // ISO8601 DateTime and Duration format
  ..add(Iso8601DateTimeSerializer())
  ..add(Iso8601DurationSerializer())
  // Converting to JSON
  ..addPlugin(StandardJsonPlugin())
).build();

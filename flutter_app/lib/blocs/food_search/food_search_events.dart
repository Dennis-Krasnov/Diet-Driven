/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

import 'package:diet_driven/utils/utils.dart';

part 'food_search_events.g.dart';

abstract class FoodSearchEvent {}

/// Shows potentially relevant results based on previous searches and data.
/// Subscribes to data streams.
abstract class SuggestFoodRecords implements FoodSearchEvent, Built<SuggestFoodRecords, SuggestFoodRecordsBuilder> {
  factory SuggestFoodRecords([void Function(SuggestFoodRecordsBuilder) updates]) = _$SuggestFoodRecords;
  SuggestFoodRecords._();
}

/// Updates search's [query].
abstract class UpdateQuery implements FoodSearchEvent, Built<UpdateQuery, UpdateQueryBuilder> {
  String get query;

  factory UpdateQuery([void Function(UpdateQueryBuilder b)]) = _$UpdateQuery;
  UpdateQuery._();
}

// TODO: update filters...

/// Searches nutrition database for foods using current [query].
abstract class SearchFoods implements FoodSearchEvent, Built<SearchFoods, SearchFoodsBuilder> {
  factory SearchFoods([void Function(SearchFoodsBuilder b)]) = _$SearchFoods;
  SearchFoods._();
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'search_events.g.dart';

abstract class FoodSearchEvent {}

/// Loads suggestions based on [query], enters query mode.
abstract class UpdateQuery with FoodSearchEvent implements Built<UpdateQuery, UpdateQueryBuilder> {
  String get query;

  factory UpdateQuery([void Function(UpdateQueryBuilder b)]) = _$UpdateQuery;
  UpdateQuery._();
}

///// Shows error page. // OPTIMIZE: no need when no reactive flow (logic in simple catch statement)
//abstract class FoodSearchError with FoodSearchEvent implements Built<FoodSearchError, FoodSearchErrorBuilder> {
//  String get error;
//  String get trace;
//
//  FoodSearchError._();
//  factory FoodSearchError([void Function(FoodSearchErrorBuilder b)]) = _$FoodSearchError;
//}
// OPTIMIZE: also no need for Completable,

/// Searches for food records by [query], enters results mode.
abstract class SearchFoods with FoodSearchEvent implements Built<SearchFoods, SearchFoodsBuilder> {
  String get query;

  factory SearchFoods([void Function(SearchFoodsBuilder b)]) = _$SearchFoods;
  SearchFoods._();
}

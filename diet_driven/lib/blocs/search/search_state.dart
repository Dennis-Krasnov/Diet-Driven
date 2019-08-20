/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'search_state.g.dart';

abstract class FoodSearchState {}

///
abstract class FoodSearchQuery with FoodSearchState implements Built<FoodSearchQuery, FoodSearchQueryBuilder> {
  ///
  String get query;

  ///
  BuiltList<String> get suggestions;

  factory FoodSearchQuery([void Function(FoodSearchQueryBuilder b)]) = _$FoodSearchQuery;
  FoodSearchQuery._();
}

///
abstract class FoodSearchLoading with FoodSearchState implements Built<FoodSearchLoading, FoodSearchLoadingBuilder> {
  factory FoodSearchLoading([void Function(FoodSearchLoadingBuilder b)]) = _$FoodSearchLoading;
  FoodSearchLoading._();
}

///
abstract class FoodSearchFailed with FoodSearchState implements Built<FoodSearchFailed, FoodSearchFailedBuilder> { // FailState,
  String get error;
  String get trace;

  factory FoodSearchFailed([void Function(FoodSearchFailedBuilder b)]) = _$FoodSearchFailed;
  FoodSearchFailed._();
}

///
abstract class FoodSearchLoaded with FoodSearchState implements Built<FoodSearchLoaded, FoodSearchLoadedBuilder> {
  ///
  BuiltList<FoodRecordResult> get results;

  factory FoodSearchLoaded([void Function(FoodSearchLoadedBuilder b)]) = _$FoodSearchLoaded;
  FoodSearchLoaded._();
}

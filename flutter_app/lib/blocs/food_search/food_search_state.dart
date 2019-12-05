/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_search_state.g.dart';

@BuiltValue(instantiable: false)
abstract class FoodSearchState {
  /// Current search query.
  String get query;

  /// Whether query has changed since last search.
  /// Search FAB is shown when [queryChanged] is true.
  bool get queryChanged;

  FoodSearchState rebuild(void Function(FoodSearchStateBuilder) updates);
  FoodSearchStateBuilder toBuilder();
}

/// Skeleton food suggestions and working search bar.
abstract class FoodSearchUninitialized implements FoodSearchState, Built<FoodSearchUninitialized, FoodSearchUninitializedBuilder> {
  factory FoodSearchUninitialized([void Function(FoodSearchUninitializedBuilder) updates]) = _$FoodSearchUninitialized;
  FoodSearchUninitialized._();
}

abstract class FoodSearchUninitializedBuilder implements FoodSearchStateBuilder, Builder<FoodSearchUninitialized, FoodSearchUninitializedBuilder> {
  // Only FoodSearchUninitialized's query is empty by default
  @override
  String query = "";

  // Only FoodSearchUninitialized's queryChanged is false by default
  @override
  bool queryChanged = false;

  factory FoodSearchUninitializedBuilder() = _$FoodSearchUninitializedBuilder;
  FoodSearchUninitializedBuilder._();
}

/// ...
/// describe what happens...
/// See FoodSearchBloc state diagram in documentation.
abstract class FoodSearchLoaded implements FoodSearchState, Built<FoodSearchLoaded, FoodSearchLoadedBuilder> {
  /// Suggestions for [query] or results of [query].
  BuiltList<FoodRecord> get results;

  /// Whether awaiting search results from server.
  bool get loading;

  factory FoodSearchLoaded([void Function(FoodSearchLoadedBuilder) updates]) = _$FoodSearchLoaded;
  FoodSearchLoaded._();
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc_logging/bloc_logging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/food_repository.dart';

/// Manages process of searching for food.
class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  final FoodRepository foodRepository;

  /// Authenticated user's id.
  final String userId;

  /// Pre-fill search box with initial text.
  /// Empty string by default.
  final String initialQuery;

  FoodSearchLoaded get loadedState => state as FoodSearchLoaded;

  FoodSearchBloc({@required this.foodRepository, @required this.userId, this.initialQuery = ""})
    : assert(userId != null), assert(foodRepository != null);

  @override
  FoodSearchState get initialState => FoodSearchUninitialized((b) => b
    ..query = initialQuery
  );

  // TODO: empty results suggestions shows error suggestions screen!
  // TODO: exception handling exclusively through snackbars, or TODO: create an unrecoverable error screen

  @override
  Stream<FoodSearchState> mapEventToState(FoodSearchEvent event) async* {
    if (event is SuggestFoodRecords) {
      // May only suggest foods from uninitialized or unchanged loaded state
      assert(state is FoodSearchUninitialized || (!loadedState.queryChanged && !loadedState.loading));

      // Nullable
      BuiltList<FoodRecord> suggestions;

      try {
        suggestions = await foodRepository.recentFoods(userId);
        BlocLogger().info("Suggested ${suggestions.length} food records");
      } catch(error, stacktrace) {
        BlocLogger().unexpectedError("Food suggestion failed", error, stacktrace);
      }

      yield FoodSearchLoaded((b) => b
        // Carry over only if started from uninitialized state
        // Suggesting foods from loaded state clears the query
        ..query = state is FoodSearchUninitialized ? state.query : ""
        // Load suggested results based on recently logged foods
        // Null suggestions is error state
        ..results = suggestions?.toBuilder()
        // Carry over only if started from uninitialized state and started typing before suggestions were loaded (typing state)
        // Suggesting foods from loaded state clears queryChanged
        ..queryChanged = state is FoodSearchUninitialized && state.queryChanged
        ..loading = false
      );
    }

    if (event is UpdateQuery) {
      // Query updates are agnostic to [currentState]
      yield state.rebuild((b) => b
        ..query = event.query
        ..queryChanged = true
      );
    }

    if (event is SearchFoods) {
      // Food search has no error state
      assert(state is FoodSearchLoaded, "Food search bloc must be loaded");

      // May only search from typing state
      assert(loadedState.queryChanged && !loadedState.loading);

      // Loading
      yield loadedState.rebuild((b) => b
        ..queryChanged = false
        ..loading = true
      );

      // TODO: do similar nullable thing here!
      // ..results = searchResult?.foods?.toBuilder()
      try {
        final searchResult = await foodRepository.searchFoodsByQuery(loadedState.query);
        // TODO: also keep track of last loaded page for infinite scroll

        // Results arrived
        yield loadedState.rebuild((b) => b
          // TODO: only add to list if arrived page is one page higher than current max (if request came very slowly, another page already loaded)
          ..results = searchResult.foods.toBuilder()
          ..queryChanged = false
          ..loading = false
        );

        BlocLogger().info("Found ${searchResult.foods.length} results for query ${loadedState.query}");
      } catch(error, stacktrace) {
        yield loadedState.rebuild((b) => b
          ..results = null
          ..queryChanged = false
          ..loading = false
        );

        BlocLogger().unexpectedError("${loadedState.query} search failed", error, stacktrace);
      }
    }
  }
}

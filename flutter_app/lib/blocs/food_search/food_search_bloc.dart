/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/food_repository.dart';

///
class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  final FoodRepository foodRepository;

  /// Pre-fill search box with initial text.
  /// Empty string by default.
  final String initialQuery;

  FoodSearchBloc({@required this.foodRepository, this.initialQuery = ""})
    : assert(foodRepository != null);

  @override
  FoodSearchState get initialState => FoodSearchUninitialized((b) => b
    ..query = initialQuery
  );

  // TODO: empty results suggestions shows an error/sorry no suggestions screen!

  @override
  Stream<FoodSearchState> mapEventToState(FoodSearchEvent event) async* {
    if (event is SuggestFoodRecords) {
      final suggestions = await foodRepository.recentFoods("123"); // TODO: take userId as constructor parameter

      yield FoodSearchLoaded((b) => b
        // Carry over only if started from uninitialized state
        // Suggesting foods from loaded state clears the query
        ..query = currentState is FoodSearchUninitialized ? currentState.query : ""
        // Load suggested results based on recently logged foods
        ..results = suggestions.toBuilder()
        // Carry over only if started from uninitialized state and started typing before suggestions were loaded
        // Suggesting foods from loaded state clears queryChanged
        ..queryChanged = currentState is FoodSearchUninitialized && currentState.queryChanged
        ..loading = false
      );
    }

    if (event is UpdateQuery) {
      // Query updates are agnostic to [currentState]
      yield currentState.rebuild((b) => b
        ..query = event.query
        ..queryChanged = true
        // TODO: loading = false (only if loaded state) ???
      );
    }

    if (event is SearchFoods) {
      // Food search has no error state
      assert(currentState is FoodSearchLoaded);

      final loadedState = currentState as FoodSearchLoaded;

      // May only search from typing state
      assert(loadedState.queryChanged && !loadedState.loading);

      // Loading
      yield loadedState.rebuild((b) => b
        ..queryChanged = false
        ..loading = true
      );

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
        event?.completer?.complete();
      } catch(error, stacktrace) {
        // Don't change results on failure
        yield loadedState.rebuild((b) => b
          ..queryChanged = false
          ..loading = false
        );

        BlocLogger().unexpectedError("${loadedState.query} search failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
  }


}

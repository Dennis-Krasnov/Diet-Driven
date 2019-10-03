/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/food_repository.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/blocs.dart';

///
class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  /// All food diary days and diets.
  final FoodDiaryBloc foodDiaryBloc;

  ///
  final FoodRepository foodRepository;

  /// Pre-fill search box with initial text.
  final String initialQuery;

  FoodSearchBloc({@required this.foodDiaryBloc, @required this.foodRepository, this.initialQuery = ""})
    : assert(foodDiaryBloc != null), assert(foodRepository != null);

  @override
  FoodSearchState get initialState => FoodSearchUninitialized((b) => b
    ..query = initialQuery
  );

  // TODO: empty results suggestions shows an error/sorry no suggestions screen!

  @override
  Stream<FoodSearchState> mapEventToState(FoodSearchEvent event) async* {
    if (event is SuggestFoodRecords) {
      yield FoodSearchLoaded((b) => b
        // Carry over query only if started from uninitialized state
        // Suggesting foods from loaded state clears the query
        ..query = currentState is FoodSearchUninitialized ? currentState.query : ""
        // Load suggested results based on recently logged foods
//        ..results = foodDiaryBloc.recentFoods.toBuilder() FIXME: no longer valid!
        ..results = null
        // Carry over query only if started from uninitialized state (started searching before suggestions were loaded)
        // Suggesting foods from loaded state also clears queryChanged
        ..queryChanged = currentState is FoodSearchUninitialized && currentState.queryChanged
        ..loading = false
      );
    }

    if (event is UpdateQuery) {
      // Query updates are agnostic to [currentState]
      yield currentState.rebuild((b) => b
        ..query = event.query
        ..queryChanged = true
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
        // TODO: also keep track of last loaded page

        // Results arrived
        yield loadedState.rebuild((b) => b
          ..results = searchResult.foods.toBuilder() // TODO: only add to list if arrived page is one page higher than current max
          ..queryChanged = false
          ..loading = false
        );

        LoggingBloc().info("Found ${searchResult.foods.length} results for query ${loadedState.query}");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        // Don't change results on failure
        yield loadedState.rebuild((b) => b
          ..queryChanged = false
          ..loading = false
        );

        LoggingBloc().unexpectedError("${loadedState.query} search failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
  }


}

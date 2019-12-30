/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../utils/utils.dart';

void main() {
  FoodSearchBloc sut;

  /// Mocks
  FoodRepository foodRepository;

  /// Configuration
  setUp(() {
    // TODO: don't log anything for every test!
//    BlocSupervisor.delegate = LoggingBlocDelegate();

    foodRepository = MockFoodRepository();

    sut = FoodSearchBloc(
      foodRepository: foodRepository,
      userId: userA.uid,
    );
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialQuery, "");
    expect(sut.initialState, FoodSearchUninitialized());
  });

  test("Start initial state with initial query", () {
    sut = FoodSearchBloc(
      foodRepository: foodRepository,
      userId: userA.uid,
      initialQuery: "Apple",
    );

    expect(sut.initialQuery, "Apple");
    expect(sut.initialState, FoodSearchUninitialized((b) => b..query = "Apple"));
  });

  group("Food suggestions", () {
    test("Load suggestions from uninitialized", () {
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);

      sut.add(SuggestFoodRecords());

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
      ]);
    });

    test("Load suggestions from uninitialized with query", () {
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);

      sut.add(UpdateQuery((b) => b
        ..query = "P"
      ));

      sut.add(SuggestFoodRecords());

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        FoodSearchUninitialized((b) => b
          ..query = "P"
          ..queryChanged = true
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "P"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
      ]);
    });

    test("Load suggestions from results", () async {
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);
      when(foodRepository.searchFoodsByQuery("Taters")).future(searchResults);

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
        // Loading
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = true
        ),
        // Results
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchResults.foods.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
      ]);

      sut.add(SuggestFoodRecords());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters"
      ));

      sut.add(SearchFoods());

      sut.add(SuggestFoodRecords());
    });

    test("Yield suggestions error state on errorous recentFoods future", () async {
      when(foodRepository.recentFoods(userA.uid)).thenAnswer((_) async => throw eventFailedException);

      sut.add(SuggestFoodRecords());

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Failed Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = null
          ..queryChanged = false
          ..loading = false
        ),
      ]);
    });
  });

  group("Query updates", () {
    test("Update query from uninitialized", () {
      sut.add(UpdateQuery((b) => b..query = "P"));
      sut.add(UpdateQuery((b) => b..query = "Po"));

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        FoodSearchUninitialized((b) => b
          ..query = "P"
          ..queryChanged = true
        ),
        FoodSearchUninitialized((b) => b
          ..query = "Po"
          ..queryChanged = true
        ),
      ]);
    });

    test("Update query from typing", () {
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters <3"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
      ]);

      sut.add(SuggestFoodRecords());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters"
      ));

      sut.add(UpdateQuery((b) => b
        ..query = "Taters <3"
      ));
    });

    test("Update query from results", () {
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);
      when(foodRepository.searchFoodsByQuery("Taters")).future(searchResults);

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
        // Loading
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = true
        ),
        // Results
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchResults.foods.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters <3"
          ..results = searchResults.foods.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
      ]);

      sut.add(SuggestFoodRecords());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters"
      ));

      sut.add(SearchFoods());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters <3"
      ));
    });
  });

//  group("Filter updates", () {
//    TODO
//  });

  group("Food search", () {
    test("Directly search", () async {
      // FIXME: massive duplication of code (already test this in load suggestions from results)
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);
      when(foodRepository.searchFoodsByQuery("Taters")).future(searchResults);

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
        // Loading
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = true
        ),
        // Results
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchResults.foods.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters <3"
          ..results = searchResults.foods.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
      ]);

      sut.add(SuggestFoodRecords());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters"
      ));

      sut.add(SearchFoods());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters <3"
      ));
    });

//    test("Search due to debouce", () {
//      // TODO
//    });

    test("Yield search error state on errorous search foods future", () async {
      when(foodRepository.recentFoods(userA.uid)).future(searchSuggestions);
      when(foodRepository.searchFoodsByQuery("Taters")).thenAnswer((_) async => throw eventFailedException);

      sut.expectEmits(<FoodSearchState>[
        FoodSearchUninitialized(),
        // Suggestions
        FoodSearchLoaded((b) => b
          ..query = ""
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
        // Typing
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = true
          ..loading = false
        ),
        // Loading
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = true
        ),
        // Failed Results
        FoodSearchLoaded((b) => b
          ..query = "Taters"
          ..results = null
          ..queryChanged = false
          ..loading = false
        ),
      ]);

      sut.add(SuggestFoodRecords());

      sut.add(UpdateQuery((b) => b
        ..query = "Taters"
      ));

      sut.add(SearchFoods());
    });
  });
}

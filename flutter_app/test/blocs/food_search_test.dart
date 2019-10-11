/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  FoodSearchBloc sut;

  /// Mocks
  FoodRepository foodRepository;
  Completer<void> completer;

  /// Data
  const userId = "123";

  final foodResults = BuiltList<FoodRecord>(<FoodRecord>[
    FoodRecord.random(),
    FoodRecord.random(),
    FoodRecord.random(),
  ]);

  final searchSuggestions = BuiltList<FoodRecord>(foodResults.reversed.expand<FoodRecord>((e) => [e, e]));

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    foodRepository = MockFoodRepository();
    completer = Completer();

    sut = FoodSearchBloc(foodRepository: foodRepository);
  });

  tearDown(() {
    sut?.dispose();
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialQuery, "");
    expect(sut.initialState, FoodSearchUninitialized());
  });

  test("Start with initial query initial state", () {
    sut = FoodSearchBloc(foodRepository: foodRepository, initialQuery: "Apple");

    expect(sut.initialQuery, "Apple");
    expect(sut.initialState, FoodSearchUninitialized((b) => b..query = "Apple"));
  });

  group("Food suggestions", () {
    test("Load suggestions from uninitialized", () {
      when(foodRepository.recentFoods(userId)).thenAnswer((_) async => searchSuggestions);

      expectLater(
        sut.state,
        emitsInOrder(<FoodSearchState>[
          FoodSearchUninitialized(),
          FoodSearchLoaded((b) => b
            ..query = ""
            ..results = searchSuggestions.toBuilder()
            ..queryChanged = false
            ..loading = false
          ),
        ])
      );

      sut.dispatch(SuggestFoodRecords());
    });

    test("Load suggestions from uninitialized with initial query", () {
      when(foodRepository.recentFoods(userId)).thenAnswer((_) async => searchSuggestions);

      expectLater(
        sut.state,
        emitsInOrder(<FoodSearchState>[
          FoodSearchUninitialized(),
          FoodSearchUninitialized((b) => b
            ..query = "P"
            ..queryChanged = true
          ),
          FoodSearchLoaded((b) => b
            ..query = "P"
            ..results = searchSuggestions.toBuilder()
            ..queryChanged = true
            ..loading = false
          ),
        ])
      );

      sut.dispatch(UpdateQuery((b) => b
        ..query = "P"
      ));
      sut.dispatch(SuggestFoodRecords());
    });

    test("Load suggestions from loaded", () {
      // todo with previous query, should clear query!
      // what to do with loaded??!
    });
  });

  group("Query updates", () {
    test("Update query from uninitialized", () {
      expectLater(
        sut.state,
        emitsInOrder(<FoodSearchState>[
          FoodSearchUninitialized(),
          FoodSearchUninitialized((b) => b
            ..query = "P"
            ..queryChanged = true
          ),
          FoodSearchUninitialized((b) => b
            ..query = "Po"
            ..queryChanged = true
          ),
        ])
      );

      sut.dispatch(UpdateQuery((b) => b..query = "P"));
      sut.dispatch(UpdateQuery((b) => b..query = "Po"));
    });

    test("Update query from loaded", () {
      when(foodRepository.recentFoods(userId)).thenAnswer((_) async => searchSuggestions);

      final loadedState = FoodSearchLoaded((b) => b
        ..query = ""
        ..results = searchSuggestions.toBuilder()
        ..queryChanged = false
        ..loading = false
      );

      expectLater(
        sut.state,
        emitsInOrder(<FoodSearchState>[
          FoodSearchUninitialized(),
          loadedState,
          loadedState.rebuild((b) => b
            ..query = "P"
            ..queryChanged = true
          ),
          loadedState.rebuild((b) => b
            ..query = "Po"
            ..queryChanged = true
          ),
        ])
      );

      sut.dispatch(SuggestFoodRecords());
      sut.dispatch(UpdateQuery((b) => b..query = "P"));
      sut.dispatch(UpdateQuery((b) => b..query = "Po"));
    });
  });

  group("Filter updates", () {
    // TODO
  });

  group("Food search", () {
    test("Directly search", () async {
      when(foodRepository.recentFoods(userId)).thenAnswer((_) async => searchSuggestions);
      when(foodRepository.searchFoodsByQuery(any)).thenAnswer((_) => Future.value(SearchResult((b) => b
        ..pagination = 1
        ..foods = foodResults.toBuilder()
      )));

      sut.dispatch(SuggestFoodRecords());
      sut.dispatch(UpdateQuery((b) => b..query = "Potato"));
      sut.dispatch(SearchFoods((b) => b
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(foodRepository.searchFoodsByQuery("Potato")).called(1);
      expect(
        sut.currentState,
        FoodSearchLoaded((b) => b
          ..query = "Potato"
          ..results = foodResults.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
      );
    });

    test("Search due to debouce", () {
      // TODO
    });

    test("Yield recovered state on errorous search foods future", () async {
      when(foodRepository.recentFoods(userId)).thenAnswer((_) async => searchSuggestions);
      when(foodRepository.searchFoodsByQuery(any)).thenThrow(eventFailedException);

      sut.dispatch(SuggestFoodRecords());
      sut.dispatch(UpdateQuery((b) => b..query = "Potato"));
      sut.dispatch(SearchFoods((b) => b
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(foodRepository.searchFoodsByQuery("Potato")).called(1);
      expect(
        sut.currentState,
        FoodSearchLoaded((b) => b
          ..query = "Potato"
          ..results = searchSuggestions.toBuilder()
          ..queryChanged = false
          ..loading = false
        ),
      );
    });
  });
}

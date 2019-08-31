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
  FoodSearchBloc foodSearchBloc;

  /// Mocks
  FoodDiaryBloc foodDiaryBloc;
  FoodRepository foodRepository;
  Completer<void> completer;

  /// Data
  final foodResults = BuiltList<FoodRecord>(<FoodRecord>[
    FoodRecord.random(),
    FoodRecord.random(),
    FoodRecord.random(),
  ]);

  final searchSuggestions = BuiltList<FoodRecord>(foodResults.reversed.expand<FoodRecord>((e) => [e, e]));

  final expectedState = <FoodSearchState>[
    FoodSearchUninitialized(),
    FoodSearchLoaded((b) => b
      ..query = ""
      ..results = searchSuggestions.toBuilder()
      ..queryChanged = false
      ..loading = false
    ),
    // Typing
    FoodSearchLoaded((b) => b
      ..query = "Potato"
      ..results = searchSuggestions.toBuilder()
      ..queryChanged = true
      ..loading = false
    ),
    // Loading
    FoodSearchLoaded((b) => b
      ..query = "Potato"
      ..results = searchSuggestions.toBuilder()
      ..queryChanged = false
      ..loading = true
    ),
  ];

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    foodDiaryBloc = MockFoodDiaryBloc();
    foodRepository = MockFoodRepository();
    completer = Completer();

    foodSearchBloc = FoodSearchBloc(
      foodDiaryBloc: foodDiaryBloc,
      foodRepository: foodRepository,
    );
  });

  tearDown(() {
    foodSearchBloc?.dispose();
  });

  /// Tests
  test("Initialize properly", () {
    expect(foodSearchBloc.initialState, FoodSearchUninitialized());

    // Initial query
    final blocWithInitialQuery = FoodSearchBloc(foodDiaryBloc: foodDiaryBloc, foodRepository: foodRepository, initialQuery: "Apple");
    expect(blocWithInitialQuery.initialState, FoodSearchUninitialized((b) => b..query = "Apple"));
    blocWithInitialQuery.dispose();
  });

  group("Suggest foods", () {
    test("Load from uninitialized", () {
      when(foodDiaryBloc.recentFoods).thenReturn(searchSuggestions);

      expectLater(
        foodSearchBloc.state,
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

      foodSearchBloc.dispatch(SuggestFoodRecords());
    });

    test("Load from uninitialized with query", () {
      when(foodDiaryBloc.recentFoods).thenAnswer((_) => searchSuggestions);

      expectLater(
        foodSearchBloc.state,
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

      foodSearchBloc.dispatch(UpdateQuery((b) => b
        ..query = "P"
      ));
      foodSearchBloc.dispatch(SuggestFoodRecords());
    });

    test("Load from loaded", () {
      // todo with previous query, should clear query!
    });
  });

  group("Update query", () {
    test("From uninitialized", () {
      expectLater(
        foodSearchBloc.state,
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

      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "P"));
      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "Po"));
    });

    test("From loaded", () {
      when(foodDiaryBloc.recentFoods).thenAnswer((_) => searchSuggestions);

      final loadedState = FoodSearchLoaded((b) => b
        ..query = ""
        ..results = searchSuggestions.toBuilder()
        ..queryChanged = false
        ..loading = false
      );

      expectLater(
        foodSearchBloc.state,
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

      foodSearchBloc.dispatch(SuggestFoodRecords());
      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "P"));
      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "Po"));
    });
  });

  group("Update filters", () {
    // TODO
  });

  group("Search foods", () {
    test("Sucessfully explicit search", () async {
      when(foodRepository.searchFoodsByQuery(any)).thenAnswer((_) => Future.value(SearchResult((b) => b
        ..pagination = 1
        ..foods = foodResults.toBuilder()
      )));

      when(foodDiaryBloc.recentFoods).thenAnswer((_) => searchSuggestions);

      expectLater(
        foodSearchBloc.state,
        emitsInOrder(<FoodSearchState>[
          ...expectedState,
          FoodSearchLoaded((b) => b
            ..query = "Potato"
            ..results = foodResults.toBuilder()
            ..queryChanged = false
            ..loading = false
          ),
//          FoodSearchLoaded((b) => b
//            ..query = "Dummy state to delay end of test"
//            ..results = foodResults.toBuilder()
//            ..queryChanged = true
//            ..loading = false
//          ),
        ])
      ).then((void _) {
        expect(completer.isCompleted, true);
      });

      foodSearchBloc.dispatch(SuggestFoodRecords());
      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "Potato"));
      foodSearchBloc.dispatch(SearchFoods((b) => b
        ..completer = completer
      ));

      // OPTIMIZE: I don't need these when bloc immediately initializes
//      await Future<void>.delayed(ticks(1));
//      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "Dummy state to delay end of test"));

      // Assume completer.future completes (must be called synchronously)
      completer.future.catchError((Object e) => fail("Shouldn't fail"));
    });

    test("Sucessfully debounced search", () {
      // TODO
    });

    test("Fail on search failure", () async {
      when(foodRepository.searchFoodsByQuery(any)).thenThrow(eventFailedException);

      when(foodDiaryBloc.recentFoods).thenAnswer((_) => searchSuggestions);

      expectLater(
        foodSearchBloc.state,
        emitsInOrder(<FoodSearchState>[
          ...expectedState,
          FoodSearchLoaded((b) => b
            ..query = "Potato"
            ..results = searchSuggestions.toBuilder()
            ..queryChanged = false
            ..loading = false
          ),
//          FoodSearchLoaded((b) => b
//            ..query = "Dummy state to delay end of test"
//            ..results = searchSuggestions.toBuilder()
//            ..queryChanged = true
//            ..loading = false
//          ),
        ])
      ).then((void _) {
        expect(completer.isCompleted, true);
      });

      foodSearchBloc.dispatch(SuggestFoodRecords());
      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "Potato"));
      foodSearchBloc.dispatch(SearchFoods((b) => b
        ..completer = completer
      ));

//      await Future<void>.delayed(ticks(1));
//      foodSearchBloc.dispatch(UpdateQuery((b) => b..query = "Dummy state to delay end of test"));

      completer.future
        // Assume completer.future completes
        .then((_) => fail("Shouldn't complete sucessfully"))
        // Catch expected exception (must be called synchronously)
        .catchError((Object e) => expect(e, eventFailedException));
    });

    test("Fail on invalid state", () async {
//      expect(() => foodSearchBloc.dispatch(SearchFoods()), throwsAssertionError); FIXME: I'm testing this wrong
      // TODO: do similar for food diary day!!!
    });
  });
}

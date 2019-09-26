/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  FoodDiaryBloc foodDiaryBloc;

  /// Mocks
  DiaryRepository diaryRepository;
  Completer<void> completer;

  /// Data
  const userId = "1234";

  final diet = Diet((b) => b
    ..calories = 2000
    ..startDate = 0
  );

  // Constant current date
  final daysSinceEpoch = currentDaysSinceEpoch();

  final expectedState = <FoodDiaryState>[
    FoodDiaryUninitialized(),
    FoodDiaryLoaded((b) => b
      ..currentDate = daysSinceEpoch
      ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
        23: generateFoodDiaryDay(23, []),
        24: generateFoodDiaryDay(24, [["Apple"]]),
      })
      ..diets = ListBuilder(<Diet>[
        diet,
      ])
    ),
  ];

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    diaryRepository = MockDiaryRepository();
    completer = Completer();

    foodDiaryBloc = FoodDiaryBloc(
      diaryRepository: diaryRepository,
      userId: userId,
    );
  });

  void _setupDefaultMocks() {
    when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
      Future.value(BuiltList(<FoodDiaryDay>[
        generateFoodDiaryDay(23, []),
        generateFoodDiaryDay(24, [["Apple"]])
      ])), //
    ]));

    when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromFutures([
      Future.value(BuiltList(<Diet>[
        diet,
      ])),
      Future.delayed(ticks(3), () => Future.error(Exception("Expected error to delay end of test"))),
    ]));
  }

  tearDown(() {
    foodDiaryBloc?.dispose();
  });

  /// Tests
  test("Initialize properly", () {
    expect(foodDiaryBloc.userId, userId);
    expect(foodDiaryBloc.initialState, FoodDiaryUninitialized());
  });

  test("Fail on invalid events", () async {
    expectLater(
      foodDiaryBloc.state,
      emitsInOrder(<dynamic>[
        FoodDiaryUninitialized(),
        BuiltErrorMatcher("Food diary bloc must be loaded"),
        BuiltErrorMatcher("Food diary bloc must be loaded"),
        BuiltErrorMatcher("Food diary bloc must be uninitialized"),
      ])
    );

    foodDiaryBloc.dispatch(UpdateCurrentDate((b) => b
      ..currentDate = 2145
    ));
    await Future<void>.delayed(ticks(1));

    foodDiaryBloc.dispatch(GlobalAddFoodRecords((b) => b
      ..date = 5232
      ..mealIndex = 0
      ..foodRecords = ListBuilder()
    ));
    await Future<void>.delayed(ticks(1));

    foodDiaryBloc.dispatch(InitFoodDiary());
  });

  group("React to streams", () {
    test("Process data arrival stream", () {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[])),
        Future.delayed(ticks(2), () => BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ])), //
        Future.delayed(ticks(3), () => BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(24, [[], ["Apricot"]]),
          generateFoodDiaryDay(25, []),
        ])),
      ]));
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromFutures([
        Future.value(BuiltList(<Diet>[])),
        Future.delayed(ticks(1), () => BuiltList(<Diet>[
          diet,
        ])),
      ]));

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<FoodDiaryState>[
          FoodDiaryUninitialized(),
          // Tick #0
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder<int, FoodDiaryDay>()
            ..diets = ListBuilder<Diet>()
          ),
          // Tick #1
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder<int, FoodDiaryDay>()
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
          // Tick #2
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: generateFoodDiaryDay(23, []),
              24: generateFoodDiaryDay(24, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
          // Tick #3
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: generateFoodDiaryDay(23, []), // Persists while not being in list
              24: generateFoodDiaryDay(24, [[], ["Apricot"]]), // Overridden by new value
              25: generateFoodDiaryDay(25, []),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
        ])
      );

      foodDiaryBloc.dispatch(InitFoodDiary());
    });

    test("Fail on food diary error", () async {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ])), //
        Future.delayed(ticks(1), () => Future.error(Exception("Food diary failed"))), // Ends at first error
        Future.delayed(ticks(2), () => Future.error(Exception("Food diary failed 2"))),
        Future.delayed(ticks(3), () => BuiltList(<FoodDiaryDay>[])),
      ]));
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromFutures([
        Future.value(BuiltList(<Diet>[
          diet,
        ])),
      ]));

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Food diary failed"),
          emitsDone,
        ])
      );

      foodDiaryBloc.dispatch(InitFoodDiary());

      // Ensure first error was last state before stream close
      // Extra time is given to avoid flaky tests
      await Future<void>.delayed(ticks(5));
      foodDiaryBloc.dispose();
    });

    test("Fail on all time diets error", () async {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ])), //
      ]));
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromFutures([
        Future.value(BuiltList(<Diet>[
          diet,
        ])),
        Future.delayed(ticks(1), () => Future.error(Exception("Diet failed"))), // Ends at first error
        Future.delayed(ticks(2), () => Future.error(Exception("Diet failed 2"))),
        Future.delayed(ticks(3), () => BuiltList(<Diet>[
          diet,
        ])),
      ]));

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Diet failed"),
          emitsDone,
        ])
      );

      foodDiaryBloc.dispatch(InitFoodDiary());

      // Ensure first error was last state before stream close
      // Extra time is given to avoid flaky tests
      await Future<void>.delayed(ticks(5));
      foodDiaryBloc.dispose();
    });
  });

  test("Update current date", () async {
    _setupDefaultMocks();

    expectLater(
      foodDiaryBloc.state,
      emitsInOrder(<FoodDiaryState>[
        ...expectedState,
        (expectedState.last as FoodDiaryLoaded).rebuild((b) => b
          ..currentDate = daysSinceEpoch + 1
        ),
      ])
    );

    // Wait for bloc to be fully initialized
    foodDiaryBloc.dispatch(InitFoodDiary());
    await Future<void>.delayed(ticks(1));

    foodDiaryBloc.dispatch(UpdateCurrentDate((b) => b
      ..currentDate = daysSinceEpoch + 1
    ));
  });

  // TOTEST
//  group("Copy food diary days", () {
//  test("Sucessfully copy", () async {
//  test("Fail on copy error", () async {


  group("Globally add food records", () {
    test("Sucessfully add to existing day", () async {
      _setupDefaultMocks();

      final foods = BuiltList<FoodRecord>(<FoodRecord>[FoodRecord.random(), FoodRecord.random()]);

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Expected error to delay end of test"),
        ])
      ).then((void _) {
        final foodDiaryDay = generateFoodDiaryDay(24, [["Apple"]]).rebuild((b) => b
          ..addFoodRecords(0, foods)
        );

        verify(diaryRepository.saveFoodDiaryDay(userId, foodDiaryDay)).called(1);
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      foodDiaryBloc.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      foodDiaryBloc.dispatch(GlobalAddFoodRecords((b) => b
        ..date = 24
        ..mealIndex = 0
        ..foodRecords = foods.toBuilder()
        ..completer = completer
      ));

      // Assume completer.future completes (must be called synchronously)
      completer.future.catchError((Object e) => fail("Shouldn't fail"));
    });

    test("Sucessfully add to new day", () async {
      _setupDefaultMocks();

      final foods = BuiltList<FoodRecord>(<FoodRecord>[FoodRecord.random(), FoodRecord.random()]);

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Expected error to delay end of test"),
        ])
      ).then((void _) {
        final foodDiaryDay = FoodDiaryDay((b) => b
          ..date = 25
          ..meals = BuiltList(List<MealData>.generate(4, (e) => MealData()))
          ..addFoodRecords(1, foods)
        );

        verify(diaryRepository.saveFoodDiaryDay(userId, foodDiaryDay)).called(1);
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      foodDiaryBloc.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      foodDiaryBloc.dispatch(GlobalAddFoodRecords((b) => b
        ..date = 25
        ..mealIndex = 1
        ..foodRecords = foods.toBuilder()
        ..completer = completer
      ));

      // Assume completer.future completes (must be called synchronously)
      completer.future.catchError((Object e) => fail("Shouldn't fail"));
    });

    test("Fail on add error", () async {
      _setupDefaultMocks();
      when(diaryRepository.saveFoodDiaryDay(any, any)).thenThrow(eventFailedException);

      final foods = BuiltList<FoodRecord>(<FoodRecord>[FoodRecord.random(), FoodRecord.random()]);

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Expected error to delay end of test"),
        ])
      ).then((void _) {
        final foodDiaryDay = FoodDiaryDay((b) => b
          ..date = 25
          ..meals = BuiltList(List<MealData>.generate(4, (e) => MealData()))
          ..addFoodRecords(1, foods)
        );

        verify(diaryRepository.saveFoodDiaryDay(userId, foodDiaryDay)).called(1);
        // Ensure completer didn't timeout (must use .isCompleted field)
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      foodDiaryBloc.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      foodDiaryBloc.dispatch(GlobalAddFoodRecords((b) => b
        ..date = 25
        ..mealIndex = 1
        ..foodRecords = foods.toBuilder()
        ..completer = completer
      ));

      completer.future
        // Assume completer.future completes
        .then((_) => fail("Shouldn't complete sucessfully"))
        // Catch expected exception (must be called synchronously)
        .catchError((Object e) => expect(e, eventFailedException));
    });
  });

  // TODO: other full day operations!!!

  group("Recent foods", () {
    test("Empty diary", () async {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromIterable([
        BuiltList(<FoodDiaryDay>[]),
      ]));
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromIterable([
        BuiltList(<Diet>[]),
      ]));

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<FoodDiaryState>[
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder<int, FoodDiaryDay>()
            ..diets = ListBuilder<Diet>()
          ),
        ]),
      );

      // Wait for bloc to be fully initialized
      foodDiaryBloc.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      expect(foodDiaryBloc.recentFoods, BuiltList<FoodRecord>(<FoodRecord>[]));
    });

    test("Filled diary", () async {
      // Ignore future dates
      final tomorrow = currentDaysSinceEpoch() + 1;

      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromIterable([
        BuiltList(<FoodDiaryDay>[]),
        BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Orange", "Apple", "Potato"]]),
          generateFoodDiaryDay(25, [["Apple"]]),
          generateFoodDiaryDay(tomorrow, [["Potato"]])
        ]),
      ]));
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromIterable([
        BuiltList(<Diet>[]),
      ]));

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<FoodDiaryState>[
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder<int, FoodDiaryDay>()
            ..diets = ListBuilder<Diet>()
          ),
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: generateFoodDiaryDay(23, []),
              24: generateFoodDiaryDay(24, [["Orange", "Apple", "Potato"]]),
              25: generateFoodDiaryDay(25, [["Apple"]]),
              tomorrow: generateFoodDiaryDay(tomorrow, [["Potato"]]),
            })
            ..diets = ListBuilder<Diet>()
          ),
        ]),
      );

      // Wait for bloc to be fully initialized
      foodDiaryBloc.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      expect(foodDiaryBloc.recentFoods, BuiltList<FoodRecord>(<FoodRecord>[
        for (final name in ["Apple", "Orange", "Potato"])
          FoodRecord((b) => b
            ..foodName = name
            ..totalNutrients = NutrientMap.fromMacros(1, 2, 3)
          ),
      ]));
    });
  });

  test("Frequent foods", () {
    expect(foodDiaryBloc.frequentFoods, BuiltList<FoodRecord>(<FoodRecord>[]));
  });
}
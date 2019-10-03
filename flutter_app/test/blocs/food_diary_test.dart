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

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  FoodDiaryBloc sut;

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
  final daysSinceEpoch = currentDaysSinceEpoch(); // TODO: test historical days!

  final expectedState = <FoodDiaryState>[
    FoodDiaryUninitialized(),
    FoodDiaryLoaded((b) => b
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

    sut = FoodDiaryBloc(
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
    sut?.dispose();
  });

  /// Tests
  test("Initialize with initial state", () {
    expect(sut.userId, userId);
    expect(sut.date, null);
    expect(sut.initialState, FoodDiaryUninitialized());
  });

  test("Yield error state on invalid events", () async {
    expectLater(
      sut.state,
      emitsInOrder(<dynamic>[
        FoodDiaryUninitialized(),
        BuiltErrorMatcher("Food diary bloc must be loaded"),
        BuiltErrorMatcher("Food diary bloc must be uninitialized"),
      ])
    );

    sut.dispatch(GlobalAddFoodRecords((b) => b
      ..date = 5232
      ..mealIndex = 0
      ..foodRecords = ListBuilder()
    ));
    await Future<void>.delayed(ticks(1));

    sut.dispatch(InitFoodDiary());
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
        sut.state,
        emitsInOrder(<FoodDiaryState>[
          FoodDiaryUninitialized(),
          // Tick #0
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder<int, FoodDiaryDay>()
            ..diets = ListBuilder<Diet>()
          ),
          // Tick #1
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder<int, FoodDiaryDay>()
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
          // Tick #2
          FoodDiaryLoaded((b) => b
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
            // Results are completely overridden
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
              25: generateFoodDiaryDay(25, []),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
        ])
      );

      sut.dispatch(InitFoodDiary());
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
        sut.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Food diary failed"),
          emitsDone,
        ])
      );

      sut.dispatch(InitFoodDiary());

      // Ensure first error was last state before stream close
      // Extra time is given to avoid flaky tests
      await Future<void>.delayed(ticks(5));
      sut.dispose();
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
        sut.state,
        emitsInOrder(<dynamic>[
          ...expectedState,
          BuiltErrorMatcher("Diet failed"),
          emitsDone,
        ])
      );

      sut.dispatch(InitFoodDiary());

      // Ensure first error was last state before stream close
      // Extra time is given to avoid flaky tests
      await Future<void>.delayed(ticks(5));
      sut.dispose();
    });
  });

//  test("Update current date", () async {
//    _setupDefaultMocks();
//
//    expectLater(
//      foodDiaryBloc.state,
//      emitsInOrder(<FoodDiaryState>[
//        ...expectedState,
//        (expectedState.last as FoodDiaryLoaded).rebuild((b) => b
//          ..currentDate = daysSinceEpoch + 1
//        ),
//      ])
//    );
//
//    // Wait for bloc to be fully initialized
//    foodDiaryBloc.dispatch(InitFoodDiary());
//    await Future<void>.delayed(ticks(1));
//
//    foodDiaryBloc.dispatch(UpdateCurrentDate((b) => b
//      ..currentDate = daysSinceEpoch + 1
//    ));
//  });

  // TOTEST
//  group("Copy food diary days", () {
//  test("Sucessfully copy", () async {
//  test("Fail on copy error", () async {


  group("Globally add food records", () {
    test("Sucessfully add to existing day", () async {
      _setupDefaultMocks();

      final foods = BuiltList<FoodRecord>(<FoodRecord>[FoodRecord.random(), FoodRecord.random()]);

      expectLater(
        sut.state,
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
      sut.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      sut.dispatch(GlobalAddFoodRecords((b) => b
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
        sut.state,
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
      sut.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      sut.dispatch(GlobalAddFoodRecords((b) => b
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
        sut.state,
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
      sut.dispatch(InitFoodDiary());
      await Future<void>.delayed(ticks(1));

      sut.dispatch(GlobalAddFoodRecords((b) => b
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

  test("Diet for date", () {

  });
}
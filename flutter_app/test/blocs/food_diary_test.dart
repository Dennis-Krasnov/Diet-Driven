/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
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
  FoodDiaryBloc sut;

  /// Mocks
  DiaryRepository diaryRepository;
  Completer<void> completer;

  /// Data
  const userId = "1234";

  final foodRecords = BuiltList<FoodRecord>(<FoodRecord>[
    FoodRecord.random(),
    FoodRecord.random(),
  ]);

  final diet = Diet((b) => b
    ..idealNutrients = NutrientMap.random()
    ..startDate = 0
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    diaryRepository = MockDiaryRepository();
    completer = Completer();

    sut = FoodDiaryBloc(
      diaryRepository: diaryRepository,
    );
  });

  tearDown(() {
    sut?.dispose();
  });

  void _setupEventTestMocks() {
    when(diaryRepository.allTimeFoodDiaryExists(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async => true);
    when(diaryRepository.allTimeFoodDiary$(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async* {
      yield BuiltList(<FoodDiaryDay>[
        generateFoodDiaryDay(23, []),
        generateFoodDiaryDay(24, [["Apple"]])
      ]);
    });

    when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) async* {
      yield BuiltList(<Diet>[diet]);
    });
  }

  /// Tests
  test("Start with initial state", () {
    expect(sut.userId, null);
    expect(sut.date, null);
    expect(sut.initialState, FoodDiaryUninitialized());
  });

  test("Yield error state on invalid events", () async {
    expectLater(
      sut.state,
      emitsInOrder(<dynamic>[
        FoodDiaryUninitialized(),
        BuiltErrorMatcher("Food diary bloc must be loaded"),
      ])
    );

    sut.dispatch(GlobalAddFoodRecords((b) => b
      ..date = 5232
      ..mealIndex = 0
      ..foodRecords = ListBuilder()
    ));
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid non-empty streams", () {
      when(diaryRepository.allTimeFoodDiaryExists(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async => true);
      when(diaryRepository.allTimeFoodDiary$(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async* {
        await delay(1);
        yield BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]);

        await delay(1);
        yield BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(24, [[], ["Apricot"]]),
          generateFoodDiaryDay(25, []),
        ]);
      });
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) async* {
        yield BuiltList(<Diet>[diet]);
      });

      expectLater(
        sut.state,
        emitsInOrder(<FoodDiaryState>[
          FoodDiaryUninitialized(),
          // Tick #1
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder({
              23: generateFoodDiaryDay(23, []),
              24: generateFoodDiaryDay(24, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Tick #2
          FoodDiaryLoaded((b) => b
          // Results are completely overridden
            ..diaryDays = MapBuilder({
              24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
              25: generateFoodDiaryDay(25, []),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
        ])
      );

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));
    });

    test("Yield loaded state for valid empty streams", () {
      when(diaryRepository.allTimeFoodDiaryExists(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async => false);
      when(diaryRepository.allTimeFoodDiary$(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async* {
        await delay(1);
        yield BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]);

        await delay(1);
        yield BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(24, [[], ["Apricot"]]),
          generateFoodDiaryDay(25, []),
        ]);
      });
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) async* {
        yield BuiltList(<Diet>[diet]);
      });

      expectLater(
        sut.state,
        emitsInOrder(<FoodDiaryState>[
          FoodDiaryUninitialized(),
          // Tick #0
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder()
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Tick #1
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder({
              23: generateFoodDiaryDay(23, []),
              24: generateFoodDiaryDay(24, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Tick #2
          FoodDiaryLoaded((b) => b
          // Results are completely overridden
            ..diaryDays = MapBuilder({
              24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
              25: generateFoodDiaryDay(25, []),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
        ])
      );

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));
    });

    test("Yield error state on errorous food diary stream", () async {
      when(diaryRepository.allTimeFoodDiaryExists(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async => true);
      when(diaryRepository.allTimeFoodDiary$(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async* {
        yield BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]);

        await delay(1);
        throw Exception("Food diary failed");
      });
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) async* {
        yield BuiltList(<Diet>[diet]);
      });

      expectLater(
        sut.state,
        emitsInOrder(<dynamic>[
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: generateFoodDiaryDay(23, []),
              24: generateFoodDiaryDay(24, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Ensure first error was last state before stream close
          BuiltErrorMatcher("Food diary failed"),
          emitsDone,
        ])
      );

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));

      // Extra time is given to avoid flakiness
      await delay(5);
      sut.dispose();
    });

    test("Yield error state on errorous all time diet stream", () async {
      when(diaryRepository.allTimeFoodDiaryExists(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async => true);
      when(diaryRepository.allTimeFoodDiary$(userId, startAt: anyNamed("startAt"))).thenAnswer((_) async* {
        yield BuiltList(<FoodDiaryDay>[
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]);
      });
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) async* {
        yield BuiltList(<Diet>[diet]);

        await delay(1);
        throw Exception("Diet failed");
      });

      expectLater(
        sut.state,
        emitsInOrder(<dynamic>[
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: generateFoodDiaryDay(23, []),
              24: generateFoodDiaryDay(24, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Ensure first error was last state before stream close
          BuiltErrorMatcher("Diet failed"),
          emitsDone,
        ])
      );

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));

      // Extra time is given to avoid flakiness
      await delay(5);
      sut.dispose();
    });
  });

  group("Global food record addition", () {
    test("Add to existing day", () async {
      _setupEventTestMocks();

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));

      await delay(1);
      sut.dispatch(GlobalAddFoodRecords((b) => b
        ..date = 24
        ..mealIndex = 0
        ..foodRecords = foodRecords.toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userId,
        generateFoodDiaryDay(24, [["Apple"]]).rebuild((b) => b
          ..addFoodRecords(0, foodRecords)
        )
      )).called(1);
    });

    test("Add to new day", () async {
      _setupEventTestMocks();

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));

      await delay(1);
      sut.dispatch(GlobalAddFoodRecords((b) => b
        ..date = 25
        ..mealIndex = 1
        ..foodRecords = foodRecords.toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userId,
        FoodDiaryDay((b) => b
          ..date = 25
          ..meals = BuiltList(List<MealData>.generate(4, (e) => MealData()))
          ..addFoodRecords(1, foodRecords)
        )
      )).called(1);
    });

    test("Reject completer on add error", () async {
      _setupEventTestMocks();
      when(diaryRepository.saveFoodDiaryDay(any, any)).thenThrow(eventFailedException);

      sut.dispatch(InitFoodDiary((b) => b..userId = userId));

      await delay(1);
      sut.dispatch(GlobalAddFoodRecords((b) => b
        ..date = 25
        ..mealIndex = 1
        ..foodRecords = foodRecords.toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userId,
        FoodDiaryDay((b) => b
          ..date = 25
          ..meals = BuiltList(List<MealData>.generate(4, (e) => MealData()))
          ..addFoodRecords(1, foodRecords)
        )
      )).called(1);
    });
  });

  group("FoodDiaryLoaded::dietForDate", () {
    final secondDiet = Diet((b) => b
      ..idealNutrients = NutrientMap.random()
      ..startDate = 100
    );

    final loadedState = FoodDiaryLoaded((b) => b
      ..diaryDays = MapBuilder()
      ..diets = ListBuilder(<Diet>[
        diet,
        secondDiet,
      ])
    );

    test("Returns respective diet", () {
      expect(loadedState.dietForDate(0), diet);
      expect(loadedState.dietForDate(10), diet);
      expect(loadedState.dietForDate(100), secondDiet);
      expect(loadedState.dietForDate(1000), secondDiet);
    });

    test("Throws StateError if earliest diet starts after requested date", () {
      expect(() => loadedState.dietForDate(-10), throwsStateError);
    });

    test("FoodDiaryLoaded throws StateError if diets are empty", () {
      expect(() => FoodDiaryLoaded((b) => b
        ..diaryDays = MapBuilder()
        ..diets = ListBuilder()
      ), throwsStateError);
    });
  });
}
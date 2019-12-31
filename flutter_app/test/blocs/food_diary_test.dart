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

import '../utils/utils.dart';

void main() {
  FoodDiaryBloc sut;

  /// Mocks
  DiaryRepository diaryRepository;
  Completer<void> completer;

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    diaryRepository = MockDiaryRepository();
    completer = Completer();

    sut = FoodDiaryBloc(
      diaryRepository: diaryRepository,
    );
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.userId, null);
    expect(sut.date, null);
    expect(sut.initialState, FoodDiaryUninitialized());
  });

  test("Yield error state on invalid events", () async {
    sut.expectEmits([
      FoodDiaryUninitialized(),
      BuiltErrorMatcher("Food diary bloc must be loaded"),
    ]);

    sut.add(GlobalAddFoodRecords((b) => b
      ..date = 5232
      ..mealIndex = 0
      ..foodRecords = ListBuilder()
    ));
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid non-empty streams", () {
      when(diaryRepository.allTimeFoodDiaryExists(userA.uid, startAt: anyNamed("startAt"))).future(true);
      when(diaryRepository.allTimeFoodDiary$(userA.uid, startAt: anyNamed("startAt"))).streamFutures([
        1.tick.value(BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ])),
        2.ticks.value(BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(24, [[], ["Apricot"]]),
          generateFoodDiaryDay(25, []),
        ])),
      ]);
      when(diaryRepository.allTimeDiet$(userA.uid)).stream([BuiltList<Diet>([dietA])]);

      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      sut.expectEmits(<FoodDiaryState>[
        FoodDiaryUninitialized(),
        // Tick #1
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            23: generateFoodDiaryDay(23, []),
            24: generateFoodDiaryDay(24, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Tick #2
        FoodDiaryLoaded((b) => b
        // Results are completely overridden
          ..diaryDays = MapBuilder({
            24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
            25: generateFoodDiaryDay(25, []),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
      ]);
    });

    test("Yield loaded state for valid empty streams", () {
      when(diaryRepository.allTimeFoodDiaryExists(userA.uid, startAt: anyNamed("startAt"))).future(false);
      when(diaryRepository.allTimeFoodDiary$(userA.uid, startAt: anyNamed("startAt"))).streamFutures([
        1.tick.value(BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ])),
        2.tick.value(BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(24, [[], ["Apricot"]]),
          generateFoodDiaryDay(25, []),
        ])),
      ]);
      when(diaryRepository.allTimeDiet$(userA.uid)).stream([BuiltList<Diet>([dietA])]);

      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      sut.expectEmits(<FoodDiaryState>[
        FoodDiaryUninitialized(),
        // Tick #0
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder()
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Tick #1
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            23: generateFoodDiaryDay(23, []),
            24: generateFoodDiaryDay(24, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Tick #2
        FoodDiaryLoaded((b) => b
        // Results are completely overridden
          ..diaryDays = MapBuilder({
            24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
            25: generateFoodDiaryDay(25, []),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
      ]);
    });

    test("Yield error state on errorous food diary stream", () async {
      when(diaryRepository.allTimeFoodDiaryExists(userA.uid, startAt: anyNamed("startAt"))).future(true);
      // Must be async generator function
      when(diaryRepository.allTimeFoodDiary$(userA.uid, startAt: anyNamed("startAt"))).thenAnswer((_) async* {
        yield BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]);

        await 1.tick.delay;
        throw Exception("Food diary failed");
      });
      when(diaryRepository.allTimeDiet$(userA.uid)).stream([BuiltList<Diet>([dietA])]);

      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      sut.expectEmits([
        FoodDiaryUninitialized(),
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
            23: generateFoodDiaryDay(23, []),
            24: generateFoodDiaryDay(24, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Ensure first error was last state before stream close
        BuiltErrorMatcher("Food diary failed"),
        emitsDone,
      ]);

      // Extra time to avoid flakiness
      await 5.ticks.delay;
      sut.close();
    });

    test("Yield error state on errorous all time diet stream", () async {
      when(diaryRepository.allTimeFoodDiaryExists(userA.uid, startAt: anyNamed("startAt"))).future(true);
      when(diaryRepository.allTimeFoodDiary$(userA.uid, startAt: anyNamed("startAt"))).stream([
        BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]),
      ]);
      // Must be async generator function
      when(diaryRepository.allTimeDiet$(userA.uid)).thenAnswer((_) async* {
        yield BuiltList(<Diet>[dietA]);

        await 1.tick.delay;
        throw Exception("Diet failed");
      });

      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      sut.expectEmits([
        FoodDiaryUninitialized(),
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
            23: generateFoodDiaryDay(23, []),
            24: generateFoodDiaryDay(24, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Ensure first error was last state before stream close
        BuiltErrorMatcher("Diet failed"),
        emitsDone,
      ]);

      // Extra time to avoid flakiness
      await 5.ticks.delay;
      sut.close();
    });
  });

  group("Global food record addition", () {
    setUp(() {
      // TODO: do in global setup, override only when needed? - or keep explicit!?
      when(diaryRepository.allTimeFoodDiaryExists(userA.uid, startAt: anyNamed("startAt"))).future(true);
      when(diaryRepository.allTimeFoodDiary$(userA.uid, startAt: anyNamed("startAt"))).stream([
        BuiltList<FoodDiaryDay>([
          generateFoodDiaryDay(23, []),
          generateFoodDiaryDay(24, [["Apple"]]),
        ]),
      ]);
      when(diaryRepository.allTimeDiet$(userA.uid)).stream([BuiltList<Diet>([dietA])]);
    });

    test("Add to existing day", () async {
      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      await 1.tick.delay;
      sut.add(GlobalAddFoodRecords((b) => b
        ..date = 24
        ..mealIndex = 0
        ..foodRecords = foodRecords.toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userA.uid,
        generateFoodDiaryDay(24, [["Apple"]]).rebuild((b) => b
          ..addFoodRecords(0, foodRecords)
        )
      )).called(1);
    });

    test("Add to new day", () async {
      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      await 1.tick.delay;
      sut.add(GlobalAddFoodRecords((b) => b
        ..date = 25
        ..mealIndex = 1
        ..foodRecords = foodRecords.toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userA.uid,
        FoodDiaryDay((b) => b
          ..date = 25
          ..meals = BuiltList(List<MealData>.generate(4, (e) => MealData()))
          ..addFoodRecords(1, foodRecords)
        )
      )).called(1);
    });

    test("Reject completer on add error", () async {
      when(diaryRepository.saveFoodDiaryDay(any, any)).thenThrow(eventFailedException);

      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      await 1.tick.delay;
      sut.add(GlobalAddFoodRecords((b) => b
        ..date = 25
        ..mealIndex = 1
        ..foodRecords = foodRecords.toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userA.uid,
        FoodDiaryDay((b) => b
          ..date = 25
          ..meals = BuiltList(List<MealData>.generate(4, (e) => MealData()))
          ..addFoodRecords(1, foodRecords)
        )
      )).called(1);
    });
  });

  group("FoodDiaryLoaded::dietForDate", () {
    final loadedState = FoodDiaryLoaded((b) => b
      ..diaryDays = MapBuilder()
      ..diets = ListBuilder(<Diet>[
        dietA,
        dietB,
      ])
    );

    test("Returns respective diet", () {
      expect(loadedState.dietForDate(0), dietA);
      expect(loadedState.dietForDate(10), dietA);
      expect(loadedState.dietForDate(100), dietB);
      expect(loadedState.dietForDate(1000), dietB);
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
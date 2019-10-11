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
  FoodDiaryDayBloc sut;

  /// Mocks
  FoodDiaryBloc foodDiaryBloc;
  DiaryRepository diaryRepository;
  Completer<void> completer;

  /// Data
  const userId = "1234";

  const date = 24;

  const mealIndex = 2;

  final foodRecords = BuiltList<FoodRecord>(<FoodRecord>[
    FoodRecord.random(),
    FoodRecord.random(),
  ]);

  final diet = Diet((b) => b
    ..calories = 2000
    ..startDate = 0
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    foodDiaryBloc = MockFoodDiaryBloc();
    when(foodDiaryBloc.userId).thenReturn(userId);

    diaryRepository = MockDiaryRepository();
    completer = Completer();

    sut = FoodDiaryDayBloc(
      foodDiaryBloc: foodDiaryBloc,
      diaryRepository: diaryRepository,
      date: date,
    );
  });

  tearDown(() {
    sut?.dispose();
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.date, date);
    expect(sut.initialState, FoodDiaryDayUninitialized());
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid food diary bloc state stream", () {
      when(foodDiaryBloc.state).thenAnswer((_) async* {
        yield FoodDiaryUninitialized();

        await delay(1);
        yield FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            23: generateFoodDiaryDay(23, []),
            24: generateFoodDiaryDay(24, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[diet])
        );

        await delay(1);
        yield FoodDiaryLoaded((b) => b
        // Results are completely overridden
          ..diaryDays = MapBuilder({
            24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
            25: generateFoodDiaryDay(25, []),
          })
          ..diets = ListBuilder(<Diet>[diet])
        );

        await delay(1);
        yield FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder()
          ..diets = ListBuilder(<Diet>[diet])
        );
      });

      expectLater(
        sut.state,
        emitsInOrder(<FoodDiaryDayState>[
          FoodDiaryDayUninitialized(),
          // Tick #1
          FoodDiaryDayLoaded((b) => b
            ..foodDiaryDay = generateFoodDiaryDay(24, [["Apple"]]).toBuilder()
            ..diet = diet.toBuilder()
          ),
          // Tick #2
          FoodDiaryDayLoaded((b) => b
            ..foodDiaryDay = generateFoodDiaryDay(24, [[], ["Apricot"]]).toBuilder()
            ..diet = diet.toBuilder()
          ),
          // Tick #3
          FoodDiaryDayLoaded((b) => b
            ..foodDiaryDay = null
            ..diet = diet.toBuilder()
          ),
        ])
      );

      sut.dispatch(InitFoodDiaryDay());
    });
  });

  test("Add food records using FoodDiaryBloc's GlobalAddFoodRecords", () async {
    when(foodDiaryBloc.state).thenAnswer((_) async* {
      yield FoodDiaryUninitialized();
      yield FoodDiaryLoaded((b) => b
        ..diaryDays = MapBuilder()
        ..diets = ListBuilder(<Diet>[diet])
      );
    });

    sut.dispatch(InitFoodDiaryDay());

    await delay(1);
    sut.dispatch(AddFoodRecords((b) => b
      ..mealIndex = mealIndex
      ..foodRecords = foodRecords.toBuilder()
      ..completer = completer
    ));

    await delay(1);
    verify(foodDiaryBloc.dispatch(GlobalAddFoodRecords((b) => b
      ..date = date
      ..mealIndex = mealIndex
      ..foodRecords = foodRecords.toBuilder()
      ..completer = completer
    ))).called(1);
  });

  group("Food record replacement", () {
    final foodDiaryDay = generateFoodDiaryDay(24, [["Apple"]]);
    final foodRecord = foodDiaryDay.meals.first.foodRecords.first;

    test("Replce food records", () async {
      when(foodDiaryBloc.state).thenAnswer((_) async* {
        yield FoodDiaryUninitialized();
        yield FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            24: foodDiaryDay,
          })
          ..diets = ListBuilder(<Diet>[diet])
        );
      });

      sut.dispatch(InitFoodDiaryDay());

      await delay(1);
      sut.dispatch(ReplaceFoodRecord((b) => b
        ..oldRecord = foodRecord.toBuilder()
        ..newRecord = foodRecord.rebuild((b) => b..foodName = "Apricot").toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userId,
        generateFoodDiaryDay(24, [["Apricot"]])
      )).called(1);
    });

    test("Reject completer on replace error", () async {
      when(foodDiaryBloc.state).thenAnswer((_) async* {
        yield FoodDiaryUninitialized();
        yield FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            24: foodDiaryDay
          })
          ..diets = ListBuilder(<Diet>[diet])
        );
      });
      when(diaryRepository.saveFoodDiaryDay(any, any)).thenThrow(eventFailedException);

      sut.dispatch(InitFoodDiaryDay());

      await delay(1);
      sut.dispatch(ReplaceFoodRecord((b) => b
        ..oldRecord = foodRecord.toBuilder()
        ..newRecord = foodRecord.rebuild((b) => b..foodName = "Apricot").toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userId,
        generateFoodDiaryDay(24, [["Apricot"]])
      )).called(1);
    });
  });

  // TODO: other operations
}

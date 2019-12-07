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
  FoodDiaryDayBloc sut;

  /// Mocks
  FoodDiaryBloc foodDiaryBloc;
  DiaryRepository diaryRepository;
  Completer<void> completer;

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    foodDiaryBloc = MockFoodDiaryBloc();
    when(foodDiaryBloc.userId).thenReturn(userA.uid);

    diaryRepository = MockDiaryRepository();
    completer = Completer();

    sut = FoodDiaryDayBloc(
      foodDiaryBloc: foodDiaryBloc,
      diaryRepository: diaryRepository,
      date: 24,
    );
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.date, 24);
    expect(sut.initialState, FoodDiaryDayUninitialized());
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid food diary bloc state stream", () {
      foodDiaryBloc.whenListenStreamFutures<FoodDiaryState>([
        Future.value(FoodDiaryUninitialized()),
        1.tick.value(FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            23: generateFoodDiaryDay(23, []),
            24: generateFoodDiaryDay(24, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        )),
        2.ticks.value(FoodDiaryLoaded((b) => b
        // Results are completely overridden
          ..diaryDays = MapBuilder({
            24: generateFoodDiaryDay(24, [[], ["Apricot"]]),
            25: generateFoodDiaryDay(25, []),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        )),
        3.ticks.value(FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder()
          ..diets = ListBuilder(<Diet>[dietA])
        )),
      ]);

      sut.add(InitFoodDiaryDay());

      sut.expectEmits(<FoodDiaryDayState>[
        FoodDiaryDayUninitialized(),
        // Tick #1
        FoodDiaryDayLoaded((b) => b
          ..foodDiaryDay = generateFoodDiaryDay(24, [["Apple"]]).toBuilder()
          ..diet = dietA.toBuilder()
        ),
        // Tick #2
        FoodDiaryDayLoaded((b) => b
          ..foodDiaryDay = generateFoodDiaryDay(24, [[], ["Apricot"]]).toBuilder()
          ..diet = dietA.toBuilder()
        ),
        // Tick #3
        FoodDiaryDayLoaded((b) => b
          ..foodDiaryDay = null
          ..diet = dietA.toBuilder()
        ),
      ]);
    });
  });

  test("Add food records using FoodDiaryBloc's GlobalAddFoodRecords", () async {
    foodDiaryBloc.whenListenStream<FoodDiaryState>([
      FoodDiaryUninitialized(),
      FoodDiaryLoaded((b) => b
        ..diaryDays = MapBuilder()
        ..diets = ListBuilder(<Diet>[dietA])
      )
    ]);

    sut.add(InitFoodDiaryDay());

    await 1.tick.delay;
    sut.add(AddFoodRecords((b) => b
      ..mealIndex = mealIndex
      ..foodRecords = foodRecords.toBuilder()
      ..completer = completer
    ));

    await 1.tick.delay;
    verify(foodDiaryBloc.add(GlobalAddFoodRecords((b) => b
      ..date = 24
      ..mealIndex = mealIndex
      ..foodRecords = foodRecords.toBuilder()
      ..completer = completer
    ))).called(1);
  });

  group("Food record replacement", () {
    final foodDiaryDay = generateFoodDiaryDay(24, [["Apple"]]);
    final foodRecord = foodDiaryDay.meals.first.foodRecords.first;

    test("Replce food records", () async {
      foodDiaryBloc.whenListenStream<FoodDiaryState>([
        FoodDiaryUninitialized(),
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            24: foodDiaryDay,
          })
          ..diets = ListBuilder(<Diet>[dietA])
        )
      ]);

      sut.add(InitFoodDiaryDay());

      await 1.tick.delay;
      sut.add(ReplaceFoodRecord((b) => b
        ..oldRecord = foodRecord.toBuilder()
        ..newRecord = foodRecord.rebuild((b) => b..foodName = "Apricot").toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userA.uid,
        generateFoodDiaryDay(24, [["Apricot"]])
      )).called(1);
    });

    test("Reject completer on replace error", () async {
      foodDiaryBloc.whenListenStream<FoodDiaryState>([
        FoodDiaryUninitialized(),
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder({
            24: foodDiaryDay,
          })
          ..diets = ListBuilder(<Diet>[dietA])
        )
      ]);
      when(diaryRepository.saveFoodDiaryDay(any, any)).thenThrow(eventFailedException);

      sut.add(InitFoodDiaryDay());

      await 1.tick.delay;
      sut.add(ReplaceFoodRecord((b) => b
        ..oldRecord = foodRecord.toBuilder()
        ..newRecord = foodRecord.rebuild((b) => b..foodName = "Apricot").toBuilder()
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(diaryRepository.saveFoodDiaryDay(
        userA.uid,
        generateFoodDiaryDay(24, [["Apricot"]])
      )).called(1);
    });
  });

  // TODO: other operations
}

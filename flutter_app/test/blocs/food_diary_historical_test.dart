/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

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

  /// Data
  const userId = "1234";
  const date = 52342;

  final diet = Diet((b) => b
    ..calories = 2000
    ..startDate = 0
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    diaryRepository = MockDiaryRepository();

    sut = FoodDiaryBloc(
      diaryRepository: diaryRepository,
      userId: userId,
      date: date,
    );
  });

  tearDown(() {
    sut?.dispose();
  });

  /// Tests
  test("Start with historical initial state", () {
    expect(sut.userId, userId);
    expect(sut.date, date);
    expect(sut.initialState, FoodDiaryUninitialized());
  });


  group("Reactive ingress streams", () {
    test("Yield loaded state for valid empty streams", () {
      when(diaryRepository.foodDiaryDayExists(userId, date)).thenAnswer((_) async => true);
      when(diaryRepository.foodDiaryDay$(userId, date)).thenAnswer((_) async* {
        await delay(1);
        yield generateFoodDiaryDay(date, [["Apple"]]);

        await delay(1);
        yield generateFoodDiaryDay(date, [[], ["Apricot"]]);
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
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              date: generateFoodDiaryDay(date, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Tick #2
          FoodDiaryLoaded((b) => b
            // Results are completely overridden
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              date: generateFoodDiaryDay(date, [[], ["Apricot"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
        ])
      );

      sut.dispatch(InitFoodDiary());
    });

    test("Yield loaded state for valid empty streams", () {
      when(diaryRepository.foodDiaryDayExists(userId, date)).thenAnswer((_) async => false);
      when(diaryRepository.foodDiaryDay$(userId, date)).thenAnswer((_) async* {
        await delay(1);
        yield generateFoodDiaryDay(date, [["Apple"]]);

        await delay(1);
        yield generateFoodDiaryDay(date, [[], ["Apricot"]]);
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
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              date: generateFoodDiaryDay(date, [["Apple"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
          // Tick #2
          FoodDiaryLoaded((b) => b
            // Results are completely overridden
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              date: generateFoodDiaryDay(date, [[], ["Apricot"]]),
            })
            ..diets = ListBuilder(<Diet>[diet])
          ),
        ])
      );

      sut.dispatch(InitFoodDiary());
    });
  });
}
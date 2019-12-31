/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

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

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    diaryRepository = MockDiaryRepository();

    sut = FoodDiaryBloc(
      diaryRepository: diaryRepository,
      date: date,
    );
  });

  /// Tests
  test("Start with historical initial state", () {
    expect(sut.userId, null);
    expect(sut.date, date);
    expect(sut.initialState, FoodDiaryUninitialized());
  });


  group("Reactive ingress streams", () {
    test("Yield loaded state for valid empty streams", () {
      when(diaryRepository.foodDiaryDayExists(userA.uid, date)).future(true);
      when(diaryRepository.foodDiaryDay$(userA.uid, date)).streamFutures([
        1.tick.value(generateFoodDiaryDay(date, [["Apple"]])),
        2.tick.value(generateFoodDiaryDay(date, [[], ["Apricot"]])),
      ]);
      when(diaryRepository.allTimeDiet$(userA.uid)).stream([BuiltList<Diet>([dietA])]);

      sut.add(InitFoodDiary((b) => b..userId = userA.uid));

      sut.expectEmits(<FoodDiaryState>[
        FoodDiaryUninitialized(),
        // Tick #1
        FoodDiaryLoaded((b) => b
          ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
            date: generateFoodDiaryDay(date, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Tick #2
        FoodDiaryLoaded((b) => b
        // Results are completely overridden
          ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
            date: generateFoodDiaryDay(date, [[], ["Apricot"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
      ]);
    });

    test("Yield loaded state for valid empty streams", () {
      when(diaryRepository.foodDiaryDayExists(userA.uid, date)).future(false);
      when(diaryRepository.foodDiaryDay$(userA.uid, date)).streamFutures([
        1.tick.value(generateFoodDiaryDay(date, [["Apple"]])),
        2.tick.value(generateFoodDiaryDay(date, [[], ["Apricot"]])),
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
          ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
            date: generateFoodDiaryDay(date, [["Apple"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
        // Tick #2
        FoodDiaryLoaded((b) => b
        // Results are completely overridden
          ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
            date: generateFoodDiaryDay(date, [[], ["Apricot"]]),
          })
          ..diets = ListBuilder(<Diet>[dietA])
        ),
      ]);
    });
  });
}
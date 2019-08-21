/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

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

  /// Data
  const userId = "1234";

  final diet = Diet((b) => b
    ..calories = 2000
    ..startDate = 0
  );

  BuiltListMultimap foodRecordMultiMap(int mealIndex, String foodName) => BuiltListMultimap<int, FoodRecord>({
    mealIndex: BuiltList<FoodRecord>(<FoodRecord>[
      FoodRecord((b) => b
        ..foodName = foodName
      ),
    ])
  });

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    diaryRepository = MockDiaryRepository();

    foodDiaryBloc = FoodDiaryBloc(
      diaryRepository: diaryRepository,
      userId: userId,
    );
  });

  tearDown(() {
    foodDiaryBloc?.dispose();
  });

  /// Tests
  test("Initialize properly", () {
    expect(foodDiaryBloc.userId, userId);
    expect(foodDiaryBloc.initialState, FoodDiaryUninitialized());
  });

  group("React to streams", () {
    test("Process data arrival stream", () {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[])),
        Future.delayed(ticks(2), () => BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 23
            ..mealRecords = BuiltListMultimap<int, FoodRecord>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..mealRecords = foodRecordMultiMap(0, "Apple")
          ),
        ])), //
        Future.delayed(ticks(3), () => BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 24
            ..mealRecords = foodRecordMultiMap(1, "Apricot")
          ),
          FoodDiaryDay((b) => b
            ..date = 25
            ..mealRecords = BuiltListMultimap<int, FoodRecord>()
          ),
        ])),
      ]));
      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromFutures([
        Future.value(BuiltList(<Diet>[])),
        Future.delayed(ticks(1), () => BuiltList(<Diet>[
          diet,
        ])),
      ]));

      // Constant current date
      final daysSinceEpoch = currentDaysSinceEpoch();

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
              23: FoodDiaryDay((b) => b
                ..date = 23
                ..mealRecords = BuiltListMultimap<int, FoodRecord>()
              ),
              24: FoodDiaryDay((b) => b
                ..date = 24
                ..mealRecords = foodRecordMultiMap(0, "Apple")
              ),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
          // Tick #3
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: FoodDiaryDay((b) => b // Persists while not being in list
                ..date = 23
                ..mealRecords = BuiltListMultimap<int, FoodRecord>()
              ),
              24: FoodDiaryDay((b) => b // Overridden by new value
                ..date = 24
                ..mealRecords = foodRecordMultiMap(1, "Apricot")
              ),
              25: FoodDiaryDay((b) => b
                ..date = 25
                ..mealRecords = BuiltListMultimap<int, FoodRecord>()
              ),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
        ])
      );

      foodDiaryBloc.dispatch(InitFoodDiary());
    });

    test("Fail on food diary error", () {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 23
            ..mealRecords = BuiltListMultimap<int, FoodRecord>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..mealRecords = foodRecordMultiMap(0, "Apple")
          ),
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

      // Constant current date
      final daysSinceEpoch = currentDaysSinceEpoch();

      foodDiaryBloc.state.listen((e) {
        print("0000");
        print(e);
      });

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: FoodDiaryDay((b) => b
                ..date = 23
                ..mealRecords = BuiltListMultimap<int, FoodRecord>()
              ),
              24: FoodDiaryDay((b) => b
                ..date = 24
                ..mealRecords = foodRecordMultiMap(0, "Apple")
              ),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
          BuiltErrorMatcher("Food diary failed"),
          // FIXME no way to check that state no longer emits??? (check that doesn't emit for a certain amount of time?)
//          emitsDone,
        ])
      );

      foodDiaryBloc.dispatch(InitFoodDiary());
    });

    test("Fail on all time diets error", () {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 23
            ..mealRecords = BuiltListMultimap<int, FoodRecord>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..mealRecords = foodRecordMultiMap(0, "Apple")
          ),
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

      // Constant current date
      final daysSinceEpoch = currentDaysSinceEpoch();

      expectLater(
        foodDiaryBloc.state,
        emitsInOrder(<dynamic>[
          FoodDiaryUninitialized(),
          FoodDiaryLoaded((b) => b
            ..currentDate = daysSinceEpoch
            ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
              23: FoodDiaryDay((b) => b
                ..date = 23
                ..mealRecords = BuiltListMultimap<int, FoodRecord>()
              ),
              24: FoodDiaryDay((b) => b
                ..date = 24
                ..mealRecords = foodRecordMultiMap(0, "Apple")
              ),
            })
            ..diets = ListBuilder(<Diet>[
              diet,
            ])
          ),
          BuiltErrorMatcher("Diet failed"),
          // FIXME no way to check that state no longer emits??? (check that doesn't emit for a certain amount of time?)
//          emitsDone,
        ])
      );

      foodDiaryBloc.dispatch(InitFoodDiary());
    });
  });

  group("Copy food diary days", () {
    test("Sucessfully copy", () async {

    });

    test("Fail on copy error", () async {

    });
  });

  // TODO: other full day operations!!!
}

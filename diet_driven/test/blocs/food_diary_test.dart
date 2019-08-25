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

  /// Only generate food records for single meal
  BuiltList<MealData> onlyMeal(int mealIndex, String foodName) => BuiltList(<MealData>[
    for (var i in List<int>.generate(4, (e) => e))
      MealData((b) => b
        ..foodRecords = ListBuilder(<FoodRecord>[
          if (mealIndex == i)
            FoodRecord((b) => b
              ..foodName = foodName
              ..totalNutrients = NutrientMap.fromMacros(1, 2, 3)
            ),
        ])
      )
  ]);

  // Constant current date
  final daysSinceEpoch = currentDaysSinceEpoch();

  final expectedState = <FoodDiaryState>[
    FoodDiaryUninitialized(),
    FoodDiaryLoaded((b) => b
      ..currentDate = daysSinceEpoch
      ..diaryDays = MapBuilder(<int, FoodDiaryDay>{
        23: FoodDiaryDay((b) => b
          ..date = 23
          ..meals = BuiltList<MealData>()
        ),
        24: FoodDiaryDay((b) => b
          ..date = 24
          ..meals = onlyMeal(0, "Apple")
        ),
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
            ..meals = BuiltList<MealData>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..meals = onlyMeal(0, "Apple")
          ),
        ])), //
        Future.delayed(ticks(3), () => BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 24
            ..meals = onlyMeal(1, "Apricot")
          ),
          FoodDiaryDay((b) => b
            ..date = 25
            ..meals = BuiltList<MealData>()
          ),
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
              23: FoodDiaryDay((b) => b
                ..date = 23
                ..meals = BuiltList<MealData>()
              ),
              24: FoodDiaryDay((b) => b
                ..date = 24
                ..meals = onlyMeal(0, "Apple")
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
                ..meals = BuiltList<MealData>()
              ),
              24: FoodDiaryDay((b) => b // Overridden by new value
                ..date = 24
                ..meals = onlyMeal(1, "Apricot")
              ),
              25: FoodDiaryDay((b) => b
                ..date = 25
                ..meals = BuiltList<MealData>()
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

    test("Fail on food diary error", () async {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 23
            ..meals = BuiltList<MealData>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..meals = onlyMeal(0, "Apple")
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

      foodDiaryBloc.state.listen((e) {
        print("0000");
        print(e);
      });

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
      await Future<void>.delayed(ticks(4));
      foodDiaryBloc.dispose();
    });

    test("Fail on all time diets error", () async {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
        Future.value(BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 23
            ..meals = BuiltList<MealData>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..meals = onlyMeal(0, "Apple")
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
      await Future<void>.delayed(ticks(4));
      foodDiaryBloc.dispose();
    });
  });

  // TOTEST
  group("Copy food diary days", () {
    /// Configuration
    setUp(() {
      when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream.fromIterable([
        BuiltList(<FoodDiaryDay>[
          FoodDiaryDay((b) => b
            ..date = 23
            ..meals = BuiltList<MealData>()
          ),
          FoodDiaryDay((b) => b
            ..date = 24
            ..meals = onlyMeal(0, "Apple")
          ),
        ]),
      ]));

      when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream.fromIterable([
        BuiltList(<Diet>[
          diet,
        ]),
      ]));
    });

    /// Tests
    test("Sucessfully copy", () async {
//      expectLater(
//        foodDiaryBloc.state,
//        emitsInOrder(expectedState),
//      ).then((void _) {
//        final foodDiaryDayBuilder = FoodDiaryDayBuilder(); // TODO: take existing!!
//        foodDiaryDayBuilder.date = 53; //event.date; // TODO: update only date!!!!
////        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
////          ..primaryColour = "0xffb76b01"
////        );
//
//        verify(diaryRepository.saveFoodDiaryDay(userId, foodDiaryDayBuilder.build())).called(1);
//        expect(completer.isCompleted, true);
//      });
//
//      // Wait for bloc to be fully initialized
//      foodDiaryBloc.dispatch(InitFoodDiary());
//      await Future<void>.delayed(ticks(1));

      // TODO
//      foodDiaryBloc.dispatch(Copy...((b) => b
//        ..date = ....
//        ..completer = completer
//      ));
    });

    test("Fail on copy error", () async {

    });
  });

  // TODO: other full day operations!!!
}

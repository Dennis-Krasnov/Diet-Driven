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

  /// Data
  const userId = "1234";
  const date = 52342;

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

//  void _setupDefaultMocks() {
//    when(diaryRepository.allTimeFoodDiary$(userId)).thenAnswer((_) => Stream<BuiltList<FoodDiaryDay>>.fromFutures([
//      Future.value(BuiltList(<FoodDiaryDay>[
//        generateFoodDiaryDay(23, []),
//        generateFoodDiaryDay(24, [["Apple"]])
//      ])), //
//    ]));
//
//    when(diaryRepository.allTimeDiet$(userId)).thenAnswer((_) => Stream<BuiltList<Diet>>.fromFutures([
//      Future.value(BuiltList(<Diet>[
//        diet,
//      ])),
//      Future.delayed(ticks(3), () => Future.error(Exception("Expected error to delay end of test"))),
//    ]));
//  }

  tearDown(() {
    sut?.dispose();
  });

  /// Tests
  test("Initialize with historical initial state", () {
    expect(sut.userId, userId);
    expect(sut.date, date);
    expect(sut.initialState, FoodDiaryUninitialized());
  });
  // TODO: rename this to sut, make another file for historical food diary bloc!!! -> add asserts that length of diary days is always one!

}
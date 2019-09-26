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
  FoodDiaryDayBloc foodDiaryDayBloc;

  /// Mocks
  FoodDiaryBloc foodDiaryBloc;

  /// Data
  const date = 1234;

  final diet = Diet((b) => b
    ..calories = 2000
    ..startDate = 0
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    foodDiaryBloc = MockFoodDiaryBloc();

    foodDiaryDayBloc = FoodDiaryDayBloc(
      foodDiaryBloc: foodDiaryBloc,
      date: date,
    );
  });

  tearDown(() {
    foodDiaryDayBloc?.dispose();
  });

  /// Tests
  test("Initialize properly", () {
    expect(foodDiaryDayBloc.date, date);
    expect(foodDiaryDayBloc.initialState, FoodDiaryDayUninitialized());
  });

  group("React to streams", () {
    test("Process food diary bloc stream", () {
      when(foodDiaryBloc.state).thenAnswer((_) => Stream.fromFutures(<Future<FoodDiaryState>>[
        Future.value(FoodDiaryUninitialized()),
        Future.delayed(ticks(1), () => null), // FIXME
        // error state, check that doesn't update!
      ]).asBroadcastStream());

      foodDiaryDayBloc.dispatch(InitFoodDiaryDay());
    });
  });

  group("Add food records", () {
    test("Sucessfully add", () async {

    });

    test("Fail on add error", () async {

    });
  });

  // TODO: other operations
}

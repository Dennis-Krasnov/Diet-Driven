/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/models/models.dart';

void main() {
  FoodDiaryDay day;

  // TOTEST: by id, not by identical values!!!

  /// Data
  final peach = FoodRecord((b) => b
    ..foodName = "Peach"
    ..totalNutrients = NutrientMap.random()
  );

  final orange = FoodRecord((b) => b
    ..foodName = "Orange"
    ..totalNutrients = NutrientMap.random()
  );

  final potato = FoodRecord((b) => b
    ..foodName = "Potato"
    ..totalNutrients = NutrientMap.random()
  );

  final tomato = FoodRecord((b) => b
    ..foodName = "Tomato"
    ..totalNutrients = NutrientMap.random()
  );

  final apricot = FoodRecord((b) => b
    ..foodName = "Apricot"
    ..totalNutrients = NutrientMap.random()
  );

  /// Configuration
  setUp(() {
    day = FoodDiaryDay((b) => b
      ..date = 124
      ..meals = BuiltList(<MealData>[
        MealData((b) => b
          ..foodRecords = ListBuilder(<FoodRecord>[peach, orange])
        ),
        MealData((b) => b
          ..foodRecords = ListBuilder()
        ),
        MealData((b) => b
          ..foodRecords = ListBuilder(<FoodRecord>[tomato])
        ),
        MealData((b) => b
          ..foodRecords = ListBuilder()
        ),
      ])
    );
  });

  /// Tests
  test("Data validation", () {
    expect(() => FoodDiaryDay((b) => b
      ..date = -2
    ), throwsStateError);
  });

  test("Add food records", () {
    // Exceptions
    expect(() => day.toBuilder()..addFoodRecords(null, BuiltList(<FoodRecord>[potato])), throwsArgumentError);
    expect(() => day.toBuilder()..addFoodRecords(-1, BuiltList(<FoodRecord>[potato])), throwsArgumentError);
    expect(() => day.toBuilder()..addFoodRecords(4, BuiltList(<FoodRecord>[potato])), throwsArgumentError);

    expect(() => day.toBuilder()..addFoodRecords(0, null), throwsArgumentError);
    expect(() => day.toBuilder()..addFoodRecords(0, BuiltList(<FoodRecord>[])), throwsArgumentError);

    // Behaviour
    expect(day.meals[0].foodRecords, [peach, orange]);
    expect(day.meals[1].foodRecords, isEmpty);

    day = day.rebuild((b) => b
      ..addFoodRecords(0, BuiltList(<FoodRecord>[potato]))
      ..addFoodRecords(1, BuiltList(<FoodRecord>[peach, orange, potato]))
    );

    expect(day.meals[0].foodRecords, [peach, orange, potato]);
    expect(day.meals[1].foodRecords, [peach, orange, potato]);
  });

  test("Replace food records", () {
    // Exceptions
    expect(() => day.toBuilder()..replaceFoodRecord(null, tomato), throwsArgumentError);
    expect(() => day.toBuilder()..replaceFoodRecord(potato, apricot), throwsArgumentError);

    expect(() => day.toBuilder()..replaceFoodRecord(tomato, null), throwsArgumentError);
    expect(() => day.toBuilder()..replaceFoodRecord(tomato, peach), throwsArgumentError);

    // Behaviour
    expect(day.meals[0].foodRecords, [peach, orange]);

    day = day.rebuild((b) => b
      ..replaceFoodRecord(orange, potato)
    );

    expect(day.meals[0].foodRecords, [peach, potato]);
  });

  test("Delete food records", () {
    // Exceptions
    expect(() => day.toBuilder()..deleteFoodRecords(null), throwsArgumentError);
    expect(() => day.toBuilder()..deleteFoodRecords(BuiltList(<FoodRecord>[])), throwsArgumentError);
    expect(() => day.toBuilder()..deleteFoodRecords(BuiltList(<FoodRecord>[apricot])), throwsArgumentError);

    // Behaviour
    expect(day.meals[0].foodRecords, [peach, orange]);
    expect(day.meals[2].foodRecords, [tomato]);

    day = day.rebuild((b) => b
      ..deleteFoodRecords(BuiltList(<FoodRecord>[peach, tomato]))
    );

    expect(day.meals[0].foodRecords, [orange]);
    expect(day.meals[2].foodRecords, isEmpty);
  });

  test("Move food records", () {
    // Exceptions already tested

    // Behaviour
    expect(day.meals[0].foodRecords, [peach, orange]);
    expect(day.meals[2].foodRecords, [tomato]);

    day = day.rebuild((b) => b
      ..moveFoodRecords(1, BuiltList(<FoodRecord>[peach, tomato]))
    );

    expect(day.meals[0].foodRecords, [orange]);
    expect(day.meals[1].foodRecords, [peach, tomato]);
    expect(day.meals[2].foodRecords, isEmpty);
  });
}

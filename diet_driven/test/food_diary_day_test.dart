/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/models/models.dart';

void main() {
  FoodDiaryDay day;

  /// Data
  final peach = FoodRecord((b) => b
    ..foodName = "Peach"
  );

  final orange = FoodRecord((b) => b
    ..foodName = "Orange"
  );

  final potato = FoodRecord((b) => b
    ..foodName = "Potato"
  );

  final tomato = FoodRecord((b) => b
    ..foodName = "Tomato"
  );

  /// Configuration
  setUp(() {
    day = FoodDiaryDay((b) => b
      ..date = 124
      ..mealRecords = BuiltListMultimap<int, FoodRecord>({
        0: [peach, orange],
        2: [tomato],
      })
    );
  });

  test("Add food records", () {
    expect(day.mealRecords[0], [peach, orange]);
    expect(day.mealRecords[1], isEmpty);

    day = day.rebuild((b) => b
      ..addFoodRecords(0, BuiltList(<FoodRecord>[potato]))
      ..addFoodRecords(1, BuiltList(<FoodRecord>[peach, orange, potato]))
    );

    expect(day.mealRecords[0], [peach, orange, potato]);
    expect(day.mealRecords[1], [peach, orange, potato]);
  });

  test("Replace food records", () {
    expect(day.mealRecords[0], [peach, orange]);

    day = day.rebuild((b) => b
      ..replaceFoodRecord(orange, potato)
    );

    expect(day.mealRecords[0], [peach, potato]);
  });

  test("Delete food records", () {
    expect(day.mealRecords[0], [peach, orange]);
    expect(day.mealRecords[2], [tomato]);

    print(day.mealRecords);
    day = day.rebuild((b) => b
      ..deleteFoodRecords(BuiltList(<FoodRecord>[peach, tomato]))
    );
    print(day.mealRecords);

    expect(day.mealRecords[0], [orange]);
    expect(day.mealRecords[2], isEmpty);
  });

  test("Move food records", () {
    expect(day.mealRecords[0], [peach, orange]);
    expect(day.mealRecords[2], [tomato]);

    day = day.rebuild((b) => b
      ..moveFoodRecords(1, BuiltList(<FoodRecord>[peach, tomato]))
    );

    expect(day.mealRecords[0], [orange]);
    expect(day.mealRecords[1], [peach, tomato]);
    expect(day.mealRecords[2], isEmpty);
  });
}

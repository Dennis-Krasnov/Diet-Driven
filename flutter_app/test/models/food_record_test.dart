/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/models/models.dart';

void main() {
  /// Data
  final apple = FoodRecord((b) => b
    ..foodName = "Apple"
    ..totalNutrients = NutrientMap.fromMacros(10, 20, 30)
  );

  final smallNutritiousApple = apple.rebuild((b) => b
    ..grams = 50
  );

  final mysteriousFood = FoodRecord((b) => b
    ..foodName = "Apple pie"
    ..totalNutrients = NutrientMap((b) => b
      ..quantities = BuiltMap<Nutrient, num>(<Nutrient, num>{
        // Missing all macronutrients
        Nutrient.calcium: 124,
      })
      ..calories = 160
    )
  );

  final randomA = FoodRecord.random();
  final randomB = FoodRecord.random();

  /// Tests
  test("Create default", () {
    expect(apple.uid, isNotEmpty);
    expect(apple.grams, 100);
  });

  test("Create random", () {
    expect(randomA, isNotNull);
    expect(randomA.foodName, isNotEmpty);
    expect(randomA.grams, isPositive);

    // Randomness
    expect(apple.uid, isNot(mysteriousFood.uid));
    expect(randomA, isNot(randomB));

    // Nutritional information
    expect(apple.totalNutrients.quantities.length, 3);
    for (final nutrient in apple.totalNutrients.quantities.keys) {
      expect(nutrient.type, NutrientType.macronutrient);
    }

    for (final value in apple.totalNutrients.quantities.values) {
      expect(value, isNonNegative);
    }
  });

  test("Data validation", () {
    expect(() => FoodRecord((b) => b
      ..grams = 0
    ), throwsStateError);

    expect(() => FoodRecord((b) => b
      ..grams = -2
    ), throwsStateError);
  });

  test("Normalized nutrients", () {
    expect(apple.normalizedNutrients, apple.totalNutrients);

    expect(smallNutritiousApple.totalNutrients, apple.totalNutrients);
    expect(smallNutritiousApple.normalizedNutrients, apple.normalizedNutrients * 2);
  });

  test("Macronutrient calories", () {
    expect(apple.proteinCalories, 40);
    expect(apple.fatCalories, 180);
    expect(apple.carbsCalories, 120);

    // Missing macronutrients
    expect(mysteriousFood.proteinCalories, 0);
    expect(mysteriousFood.fatCalories, 0);
    expect(mysteriousFood.carbsCalories, 0);
  });
}

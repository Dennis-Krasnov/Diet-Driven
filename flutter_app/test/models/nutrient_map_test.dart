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
  final a = NutrientMap.fromMacros(10, 20, 30);
  final b = NutrientMap.fromMacros(44, 55, 66);

  final full = NutrientMap((b) => b
    ..quantities = BuiltMap<Nutrient, num>(<Nutrient, num>{
      Nutrient.protein: 10,
      // Missing fat
      Nutrient.carbs: 30,
      Nutrient.calcium: 124, // Extra nutrient
    })
    ..calories = 160
  );

  final randomA = NutrientMap.random();
  final randomB = NutrientMap.random();

  /// Tests
  test("Create random", () {
    expect(randomA, isNotNull);
    expect(randomA.calories, isNonNegative);

    // Randomness
    expect(randomA, isNot(randomB));

    // Only protein, fat, carbs
    expect(a.quantities.length, 3);
    for (final nutrient in randomA.quantities.keys) {
      expect(nutrient.type, NutrientType.macronutrient);
    }

    for (final value in randomA.quantities.values) {
      expect(value, isNonNegative);
    }
  });

  test("Create from macros", () {
    // Exceptions
    expect(() => NutrientMap.fromMacros(null, 20, 30), throwsArgumentError);
    expect(() => NutrientMap.fromMacros(10, null, 30), throwsArgumentError);
    expect(() => NutrientMap.fromMacros(10, 20, null), throwsArgumentError);

    // Behaviour
    expect(a, isNotNull);
    expect(a.calories, 340);

    // Only protein, fat, carbs
    expect(a.quantities.length, 3);
    expect(a.quantities[Nutrient.protein], 10);
    expect(a.quantities[Nutrient.fat], 20);
    expect(a.quantities[Nutrient.carbs], 30);
  });

  test("Vector addition", () {
    final sum = a + b;
    expect(sum.calories, a.calories + b.calories);
    expect(sum.quantities[Nutrient.protein], a.quantities[Nutrient.protein] + b.quantities[Nutrient.protein]);
    expect(sum.quantities[Nutrient.fat], a.quantities[Nutrient.fat] + b.quantities[Nutrient.fat]);
    expect(sum.quantities[Nutrient.carbs], a.quantities[Nutrient.carbs] + b.quantities[Nutrient.carbs]);

    // Union of quantity map
    expect(b.quantities[Nutrient.calcium], isNull);
    expect(full.quantities[Nutrient.fat], isNull);

    final unionSum = b + full;
    expect(unionSum.calories, b.calories + full.calories);
    expect(unionSum.quantities[Nutrient.calcium], full.quantities[Nutrient.calcium]);
    expect(unionSum.quantities[Nutrient.protein], b.quantities[Nutrient.protein] + full.quantities[Nutrient.protein]);
    expect(unionSum.quantities[Nutrient.fat], b.quantities[Nutrient.fat]);
    expect(unionSum.quantities[Nutrient.carbs], b.quantities[Nutrient.carbs] + full.quantities[Nutrient.carbs]);

    // Formal subtraction
    expect(a, sum + (b * -1));

    // Commutativity
    expect(randomA + randomB, randomB + randomA);
  });

  test("Scalar multiplication", () {
    final product = a * 3;
    expect(product.calories, a.calories * 3);
    expect(product.quantities[Nutrient.protein], a.quantities[Nutrient.protein] * 3);
    expect(product.quantities[Nutrient.fat], a.quantities[Nutrient.fat] * 3);
    expect(product.quantities[Nutrient.carbs], a.quantities[Nutrient.carbs] * 3);
  });
}

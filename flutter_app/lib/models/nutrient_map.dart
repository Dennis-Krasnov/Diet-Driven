/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';

part 'nutrient_map.g.dart';

/// Nutritional information base unit used for calculations.
/// eg. final sum = nutrients.reduce((curr, next) => curr + next);
abstract class NutrientMap implements Built<NutrientMap, NutrientMapBuilder> {
  static Serializer<NutrientMap> get serializer => _$nutrientMapSerializer;

  /// Energy of food (kcal).
  num get calories;

  /// Quantity of each nutrient (Nutrient.unitOfMeasure).
  BuiltMap<Nutrient, num> get quantities;

  /// Vector addition of nutrient values.
  /// Only LHS addition operator is defined.
  NutrientMap operator+(NutrientMap other) => rebuild((b) => b + other);

  /// Scalar multiplication of nutrient values.
  /// Only LHS addition operator is defined.
  NutrientMap operator*(num multiplier) => rebuild((b) => b * multiplier);

  factory NutrientMap([void Function(NutrientMapBuilder) updates]) = _$NutrientMap;
  NutrientMap._();

  /// [NutrientMap] with random values.
  factory NutrientMap.random() => NutrientMap((b) => b..random());

  /// [NutrientMap] with specified macronutrients.
  /// [protein], [fat], [carbs] measured in g.
  factory NutrientMap.fromMacros(num protein, num fat, num carbs) => NutrientMap((b) => b..fromMacros(protein, fat, carbs));
}

abstract class NutrientMapBuilder implements Builder<NutrientMap, NutrientMapBuilder> {
  num calories;
  BuiltMap<Nutrient, num> quantities;

  /// Replaces [NutrientMapBuilder] with random values.
  void random() => fromMacros(Random().nextInt(90) + 10, Random().nextInt(75) + 25, Random().nextInt(150) + 50);

  /// Replaces [NutrientMapBuilder] with specified macronutrients.
  /// [protein], [fat], [carbs] measured in g.
  void fromMacros(num protein, num fat, num carbs) {
    ArgumentError.checkNotNull(protein);
    ArgumentError.checkNotNull(fat);
    ArgumentError.checkNotNull(carbs);

    quantities = BuiltMap(<Nutrient, num>{
      Nutrient.protein: protein,
      Nutrient.fat: fat,
      Nutrient.carbs: carbs,
    });

    _setCaloriesFromMacronutrients();
  }

  /// Calculates calories from macronutrients.
  /// Throws [StateError] if a macronutrient hasn't been defined.
  void _setCaloriesFromMacronutrients() {
    final protein = quantities[Nutrient.protein];
    final carbs = quantities[Nutrient.carbs];
    final fat = quantities[Nutrient.fat];

    calories = Nutrient.protein.caloriesFromGram(protein)
      + Nutrient.fat.caloriesFromGram(fat)
      + Nutrient.carbs.caloriesFromGram(carbs);
  }

  /// Performs vector addition of nutrient values.
  /// Only LHS addition operator is defined.
  NutrientMapBuilder operator+(NutrientMap other) {
    calories += other.calories;

    final allKeys = quantities.keys.toSet()..addAll(other.quantities.keys.toSet());
    quantities = BuiltMap<Nutrient, num>(Map<Nutrient, num>.fromIterable(
      allKeys,
      key: (dynamic key) => key,
      value: (dynamic key) => (quantities[key] ?? 0) + (other.quantities[key] ?? 0),
    ));
  }

  /// Performs scalar multiplication of nutrient values.
  /// Only LHS addition operator is defined.
  NutrientMapBuilder operator*(num multiplier) {
    calories *= multiplier;

    quantities = BuiltMap<Nutrient, num>(Map<Nutrient, num>.fromIterable(
      quantities.keys,
      key: (dynamic key) => key,
      value: (dynamic key) => quantities[key] * multiplier,
    ));
  }

  factory NutrientMapBuilder() = _$NutrientMapBuilder;
  NutrientMapBuilder._();
}

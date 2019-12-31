/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

import 'package:diet_driven/models/models.dart';

part 'food_record.g.dart';

/// Contextualizes [NutrientMap] with food name, quantity, and source.
abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  /// Auto-generated unique ID.
  /// Must explicitly compare by uid.
  @BuiltValueField(compare: false)
  String get uid;

  /// Common name of food.
  String get foodName;

  /// Total weight of food (g).
  /// Defaults to 100g.
  num get grams;

  /// Nutritional information for [grams]g.
  NutrientMap get totalNutrients;

  /// Nutritional information per 100g.
  NutrientMap get normalizedNutrients => totalNutrients * (100 / grams);

  // TODO: selection portion size (TODO: make grams a derived value, make quantity field)
  /// TODO: source reference to DB, barcode value

  /// Total calories (kcal) coming from protein.
  /// Defaults to 0kcal if quantity isn't defined.
  num get proteinCalories => Nutrient.protein.caloriesFromGram(totalNutrients.quantities[Nutrient.protein] ?? 0);

  /// Total calories (kcal) coming from fat.
  /// Defaults to 0kcal if quantity isn't defined.
  num get fatCalories => Nutrient.fat.caloriesFromGram(totalNutrients.quantities[Nutrient.fat] ?? 0);

  /// Total calories (kcal) coming from carbs.
  /// Defaults to 0kcal if quantity isn't defined.
  num get carbsCalories => Nutrient.carbs.caloriesFromGram(totalNutrients.quantities[Nutrient.carbs] ?? 0);

  factory FoodRecord([void Function(FoodRecordBuilder b)]) = _$FoodRecord;

  /// Data validation.
  FoodRecord._() {
    if (grams < 0)
      throw StateError("Grams can't be negative");
    if (grams == 0)
      throw StateError("Normalization does division by zero grams");
  }

  /// [FoodRecord] with random values.
  factory FoodRecord.random() => FoodRecord((b) => b..random());
}

abstract class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  String uid = Uuid().v4();
  String foodName;
  num grams = 100;
  NutrientMap totalNutrients;

  /// Replaces [FoodRecordBuilder] with random values.
  void random() {
    final randomFoodNames = <String>["Apple", "Pear", "Orange", "Peach", "Carrot"]..shuffle();
    foodName = randomFoodNames[0];

    grams = Random().nextInt(100) + 100;

    totalNutrients = NutrientMap.random();
  }

  factory FoodRecordBuilder() = _$FoodRecordBuilder;
  FoodRecordBuilder._();
}

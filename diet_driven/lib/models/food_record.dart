/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:diet_driven/models/models.dart';
import 'package:uuid/uuid.dart';

part 'food_record.g.dart';

/// ...
abstract class FoodRecord implements Built<FoodRecord, FoodRecordBuilder> {
  static Serializer<FoodRecord> get serializer => _$foodRecordSerializer;

  /// Auto-generated unique ID.
  /// Must explicitly compare by uid.
  @BuiltValueField(compare: false)
  String get uid;

  ///
  String get foodName;

  /// ...
  /// Defaults to 100g.
  num get grams;

  ///
  NutrientMap get totalNutrients;

  /// Nutrients per 100g.
  NutrientMap get normalizedNutrients => totalNutrients * (100 / grams);

  /// TODO: reference to DB

  /// Total calories (kcal) coming from protein.
  num get proteinCalories => 0;

  /// Total calories (kcal) coming from fat.
  num get fatCalories => 0;

  /// Total calories (kcal) coming from carbs.
  num get carbsCalories => 0;

  // TODO, use in tests
//  factory FoodRecord
//  FoodRecord.random() => FoodRecord((b) => b
//    ..foodName = (["Apple", "Pear", "Orange", "Peach", "Carrot"].shuffle())[0]
//  )

  factory FoodRecord([void Function(FoodRecordBuilder b)]) = _$FoodRecord;

  /// Data validation.
  FoodRecord._() {
    if (grams < 0)
      throw StateError("Grams can't be negative");
    if (grams == 0)
      throw StateError("Normalization is division by zero grams");
  }
}

abstract class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  String uid = Uuid().v4();
  String foodName;
  num grams = 100;
  NutrientMap totalNutrients;

  /// ... in g
  void fromMacros(num protein, num fat, num carbs) {
    grams = protein + fat + carbs;
    totalNutrients = totalNutrients.rebuild((b) => b // OPTIMIZE: create totalNutrients if it's currently not defined?
      ..calories = Nutrient.protein.caloriesFromGram(protein)
        + Nutrient.fat.caloriesFromGram(fat)
        + Nutrient.carbs.caloriesFromGram(carbs)
      ..quantities = b.quantities.rebuild((b) => b
        // Overrides existing values
        ..addAll({
          Nutrient.protein: protein,
          Nutrient.fat: fat,
          Nutrient.carbs: carbs,
        })
      )
    );
  }

  // OPTIMIZE: randomized here?

  factory FoodRecordBuilder() = _$FoodRecordBuilder;
  FoodRecordBuilder._();
}

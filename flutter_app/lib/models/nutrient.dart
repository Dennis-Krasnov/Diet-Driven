/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';

part 'nutrient.g.dart';

///
class Nutrient extends EnumClass {
  static Serializer<Nutrient> get serializer => _$nutrientSerializer;

  /// ...
  /// TODO: wirenames
  static const Nutrient protein = _$protein;

  /// ...
  static const Nutrient fat = _$fat;

  /// ...
  static const Nutrient carbs = _$carbs;

  /// MINERALS

  /// ...
  static const Nutrient calcium = _$calcium;

  /// VITAMINS


  /// ...
  String get scientificName {
    switch (this) {
      case protein:
        return "Protein";
        break;
      case fat:
        return "Fatus maximus";
        break;
      case carbs:
        return "Carbinus";
        break;
      case calcium:
        return "Calsavian";
        break;
      default:
        throw UnimplementedError();
    }
  }

  /// ...
  String get unitOfMeasure {
    switch (this) {
      case protein:
      case fat:
      case carbs:
        return "g";
        break;
      case calcium:
        return "mg";
        break;
      default:
        throw UnimplementedError();
    }
  }

  /// ...
  num caloriesFromGram(num grams) {
    switch (this) {
      case protein:
        // Atwater factor is 3.47
        return 4 * grams;
        break;
      case fat:
        // Atwater factor is 8.37
        return 9 * grams;
        break;
      case carbs:
        // Atwater factor is 4.07
        return 4 * grams;
        break;
      default:
        throw ArgumentError("Can only calculate energy from macronutrients");
    }
  }

  /// ...
  NutrientType get type {
    switch (this) {
      case protein:
      case fat:
      case carbs:
        return NutrientType.macronutrient;
        break;
      case calcium:
        return NutrientType.mineral;
        break;
      default:
        throw UnimplementedError();
    }
  }

  const Nutrient._(String name) : super(name);

  static BuiltSet<Nutrient> get values => _$values;
  static Nutrient valueOf(String name) => _$valueOf(name);
}

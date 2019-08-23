/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';

part 'nutrient_map.g.dart';

/// TODOCUMENT
abstract class NutrientMap implements Built<NutrientMap, NutrientMapBuilder> {
  static Serializer<NutrientMap> get serializer => _$nutrientMapSerializer;

  /// TODOCUMENT
  num get calories;

  /// TODOCUMENT
  BuiltMap<Nutrient, num> get quantities;

  ///
  NutrientMap operator+(NutrientMap other) => rebuild((b) => b + other);

  ///
  NutrientMap operator*(num multiplier) => rebuild((b) => b * multiplier);

  factory NutrientMap([void Function(NutrientMapBuilder) updates]) = _$NutrientMap;
  NutrientMap._();
}

abstract class NutrientMapBuilder implements Builder<NutrientMap, NutrientMapBuilder> {
  num calories;
  BuiltMap<Nutrient, num> quantities;

  ///
  /// eg. nutrients.reduce((curr, next) => curr + next)
  NutrientMapBuilder operator+(NutrientMap other) {
    calories += other.calories;

    final allKeys = quantities.keys.toSet()..addAll(other.quantities.keys.toSet());
    quantities = BuiltMap<Nutrient, num>(Map<Nutrient, num>.fromIterable(
      allKeys,
      key: (dynamic key) => key,
      value: (dynamic key) => (quantities[key] ?? 0) + (other.quantities[key] ?? 0),
    ));
  }

  ///
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

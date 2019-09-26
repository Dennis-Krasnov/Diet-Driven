/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'nutrient_type.g.dart';

///
class NutrientType extends EnumClass {
  static Serializer<NutrientType> get serializer => _$nutrientTypeSerializer;

  /// ...
  static const NutrientType macronutrient = _$macronutrient;

  /// ...
  static const NutrientType vitamin = _$vitamin;

  /// ...
  static const NutrientType mineral = _$mineral;

  const NutrientType._(String name) : super(name);

  static BuiltSet<NutrientType> get values => _$values;
  static NutrientType valueOf(String name) => _$valueOf(name);
}

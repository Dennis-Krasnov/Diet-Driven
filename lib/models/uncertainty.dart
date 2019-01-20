// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

library uncertainty;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uncertainty.g.dart';

class Uncertainty extends EnumClass {
  static Serializer<Uncertainty> get serializer => _$uncertaintySerializer;

  static const Uncertainty accurate = _$accurate;
  static const Uncertainty measured = _$measured;
  static const Uncertainty estimate = _$estimate;
  static const Uncertainty guess = _$guess;


  const Uncertainty._(String name) : super(name);

  static BuiltSet<Uncertainty> get values => _$uncertaintyValues;

  static Uncertainty valueOf(String name) => _$uncertaintyValueOf(name);

  static double toUncertaintyDecimal(Uncertainty u) {
    double uncertainty;
    switch (u) {
      case Uncertainty.accurate:
        uncertainty = 0.00;
        break;

      case Uncertainty.measured:
        uncertainty = 0.05;
        break;

      case Uncertainty.estimate:
        uncertainty = 0.10;
        break;

      case Uncertainty.guess:
        uncertainty = 0.20;
        break;

      default:
        uncertainty = -1;
    }

    return uncertainty;
  }
}
/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_record_result.g.dart';

/// Wrapper ...
/// [existsInDiary] and [existsInSelection] can't both be true.
abstract class FoodRecordResult implements Built<FoodRecordResult, FoodRecordResultBuilder> {
  ///
  FoodRecord get foodRecord;

  ///
//  FoodLoggingTab get resultType; // TODO: store list of where it's appeared? would have to update all results when a new one comes in - recursion?!

  ///
  bool get existsInDiary;

  ///
  bool get existsInSelection;

  factory FoodRecordResult([void Function(FoodRecordResultBuilder b)]) = _$FoodRecordResult;
  FoodRecordResult._();
}

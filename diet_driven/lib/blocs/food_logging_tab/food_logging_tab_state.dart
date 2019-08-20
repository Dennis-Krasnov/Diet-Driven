/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_tab_state.g.dart';

abstract class FoodLoggingTabState {}

/// Skeleton food record results.
abstract class FoodLoggingTabUninitialized with FoodLoggingTabState implements Built<FoodLoggingTabUninitialized, FoodLoggingTabUninitializedBuilder> {
  factory FoodLoggingTabUninitialized([void Function(FoodLoggingTabUninitializedBuilder b)]) = _$FoodLoggingTabUninitialized;
  FoodLoggingTabUninitialized._();
}

/// Food record result list.
abstract class FoodLoggingTabLoaded with FoodLoggingTabState implements Built<FoodLoggingTabLoaded, FoodLoggingTabLoadedBuilder> {
  BuiltList<FoodRecordResult> get results;

  factory FoodLoggingTabLoaded([void Function(FoodLoggingTabLoadedBuilder b)]) = _$FoodLoggingTabLoaded;
  FoodLoggingTabLoaded._();
}

/// Error page.
abstract class FoodLoggingTabFailed with FoodLoggingTabState implements Built<FoodLoggingTabFailed, FoodLoggingTabFailedBuilder> {
  factory FoodLoggingTabFailed([void Function(FoodLoggingTabFailedBuilder b)]) = _$FoodLoggingTabFailed;
  FoodLoggingTabFailed._();
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_tab_events.g.dart';

abstract class FoodLoggingTabEvent {}

/// Reactively updates current [results], shows food results list.
abstract class ResultsArrived with FoodLoggingTabEvent implements Built<ResultsArrived, ResultsArrivedBuilder> {
  BuiltList<FoodRecordResult> get results;

  factory ResultsArrived([void Function(ResultsArrivedBuilder b)]) = _$ResultsArrived;
  ResultsArrived._();
}

/// Shows error page.
abstract class FoodLoggingTabError with FoodLoggingTabEvent implements Built<FoodLoggingTabError, FoodLoggingTabErrorBuilder> {
  String get error;
  String get trace;

  factory FoodLoggingTabError([void Function(FoodLoggingTabErrorBuilder b)]) = _$FoodLoggingTabError;
  FoodLoggingTabError._();
}

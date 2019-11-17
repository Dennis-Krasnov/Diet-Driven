/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';
import 'dart:ui';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';

part 'bloc_utils.g.dart';

// TODO: implements instead of with !? => do uninstantiable thing!
///
abstract class Completable {
  @nullable
  Completer<void> get completer;
}

///
@BuiltValue(instantiable: false)
abstract class BuiltError {
  ///
  Object get error;

  ///
  @nullable
  StackTrace get stacktrace;

  BuiltError rebuild(void Function(BuiltErrorBuilder) updates);
  BuiltErrorBuilder toBuilder();
}

///
int dateTimeToDaysSinceEpoch(DateTime dateTime) => dateTime.toLocal().difference(DateTime(1970).toLocal()).inDays;

///
int currentDaysSinceEpoch() => dateTimeToDaysSinceEpoch(DateTime.now().toLocal());

///
String hexNumberCodeToString(int hexCode) => "0x${hexCode.toRadixString(16).padLeft(8, '0')}";


// TODO: move to charting utils!
//List<CircularStackEntry> generatePieChart(NutrientMap nutrientMap, List<Nutrient> macroNutrientOrder) {
//  assert(nutrientMap != null);
//  assert(macroNutrientOrder != null);
//
//  return <CircularStackEntry>[
//    CircularStackEntry(
//      <CircularSegmentEntry>[
//        // TODO: take list (macronutrient order) from settings
//        for (final nutrient in macroNutrientOrder)
//          CircularSegmentEntry(
//              nutrientMap.quantities[nutrient].toDouble(), // OPTIMIZE
//              nutrient == Nutrient.protein // TODO: dynamic, store in map
//                  ? const Color(0xFFA23648)
//                  : nutrient == Nutrient.fat
//                  ? const Color(0xFFD3AF32)
//                  : const Color(0xFF4DAB75),
//              rankKey: nutrient.name
//          ),
//      ],
//      rankKey: 'Macronutrient distribution',
//    ),
//  ];
//}

//@BuiltValue(instantiable: false)
//abstract class FailState extends Object {
//  String get error;
//  String get trace;
//
//  FailState toBuilder();
//  FailState rebuild(void Function(FailStateBuilder) updates);
//}

//abstract class FailState implements Built<FailState, FailStateBuilder> {
//  String get error;
//  String get trace;
//
//  FailState._();
//  factory FailState([void Function(FailStateBuilder b)]) = _$FailState;
//}

//flutter packages pub run build_runner watch --delete-conflicting-outputs

// Switching from BuiltValue([void Function(BuiltValueBuilder b)]) to BuiltValue([void Function(BuiltValueBuilder)])
// ctrl+shift+r with regex
// from: \[updates\((\w+Builder)
// to: \[void Function\($1



// BEFORE:
//abstract class Test with NavigationEvent implements Built<Test, TestBuilder> {
//  factory Test([void Function(TestBuilder) updates]) = _$Test;
//  Test._();
//}

// AFTER:
//abstract class Test implements NavigationEvent, Built<Test, TestBuilder> {
//  factory Test([void Function(TestBuilder) updates]) = _$Test;
//  Test._();
//}

// ctrl+shift+r with regex
//from: with (\w+Event) implements
//to: implements $1,

// HAVE TO CREATE BUILDERS FOR EACH SUBCLASS TO DEFINE DEFAULTS FOR FIELDS IN UNINSTANTIATED CLASS

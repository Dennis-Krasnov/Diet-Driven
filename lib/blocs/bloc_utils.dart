import 'dart:async';

import 'package:built_value/built_value.dart';

//part 'bloc_utils.g.dart';

// TODO: implements instead of with !? => do uninstantiable thing!
abstract class Completable {
  @nullable
  Completer<void> get completer;
}

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

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

part 'bloc_utils.g.dart';

/// ...
abstract class Completable {
  @nullable
  Completer<void> get completer;
}

/// ...
@BuiltValue(instantiable: false)
abstract class BuiltError {
  /// ...
  Object get error;

  /// ...
  @nullable
  StackTrace get stacktrace;

  BuiltError rebuild(void Function(BuiltErrorBuilder) updates);
  BuiltErrorBuilder toBuilder();
}

extension RangeExtensions on int {
  /// ... [0, end)
  /// eg. for (final i in 10.range)
  List<int> get range => List<int>.generate(this, (i) => i);

  /// ... [start, end)
  /// eg. for (final i in 10.rangeFrom(5))
  List<int> rangeFrom(int start) => List<int>.generate(this - start, (i) => i + start);
}

extension ListExtensions on List {
  /// ...
  Iterable<MapEntry<int, dynamic>> get enumerate => asMap().entries;
}

extension BuiltListExtensions on BuiltList {
  /// ...
  Iterable<MapEntry<int, dynamic>> get enumerate => asMap().entries;
}

extension IntegerDateUtilsExtensions on int {
  /// ...
  DateTime get asDateTime => DateTime(1970).toLocal().add(Duration(days: this));

  /// doesn't work...
//  static int today() => null;
}

extension DateTimeDateUtils on DateTime {
  /// ...
  DateTime get today => null;

  /// ...
  int get asInt => toLocal().difference(DateTime(1970).toLocal()).inDays;
}

extension HexCodeExtensions on int {
  /// ...
  String get asHexNumber => "0x${toRadixString(16).padLeft(8, '0')}";
}
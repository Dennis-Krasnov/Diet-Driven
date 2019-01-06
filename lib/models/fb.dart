// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

library fb;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'fb.g.dart';

class FB extends EnumClass {
  static const FB startListen = _$startListen;
  static const FB stopListen = _$stopListen;

  const FB._(String name) : super(name);

  static BuiltSet<FB> get values => _$fbValues;

  static FB valueOf(String name) => _$fbValueOf(name);
}
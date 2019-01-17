// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

library connections;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'connections.g.dart';

class Connections extends EnumClass {
  static const Connections diary = _$diary;


  static const Connections loginScreen = _$loginScreen;


  const Connections._(String name) : super(name);

  static BuiltSet<Connections> get values => _$connectionsTabValues;

  static Connections valueOf(String name) => _$connectionsValueOf(name);
}
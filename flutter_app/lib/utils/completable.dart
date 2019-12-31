/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:built_value/built_value.dart';

/// ...
abstract class Completable {
  @nullable
  Completer<void> get completer;
}
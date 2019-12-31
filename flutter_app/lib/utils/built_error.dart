/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'built_error.g.dart';

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
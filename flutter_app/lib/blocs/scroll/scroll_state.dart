/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'scroll_state.g.dart';

/// ...
abstract class ScrollState implements Built<ScrollState, ScrollStateBuilder> {
  /// Index of active sticky header.
  int get currentScrollIndex;

  /// Percentage of how much the top header has been pushed out.
  double get scrollPercentage;

  factory ScrollState([void Function(ScrollStateBuilder) updates]) = _$ScrollState;
  ScrollState._();
}
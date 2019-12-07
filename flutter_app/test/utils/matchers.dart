/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';

final StreamMatcher doesNotEmit = emitsInOrder(<dynamic>[]);

class BuiltErrorMatcher extends Matcher {
  // TODO: generalized builtError
  final String expectedError;

  BuiltErrorMatcher(this.expectedError);

  @override
  Description describe(Description description) => description.add("builtError with error '$expectedError'");

//  @override
//  Description describeMismatch(dynamic item, Description mismatchDescription,
//      Map matchState, bool verbose) {
//
//  }

  @override
  bool matches(dynamic item, Map matchState) => item is BuiltError && item.error.toString().endsWith(expectedError);
}
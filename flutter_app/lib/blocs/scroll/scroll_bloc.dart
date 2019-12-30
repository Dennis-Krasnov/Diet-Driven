/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/scroll/scroll_state.dart';

/// Manages sticky header scroll behaviour.
class ScrollBloc extends Bloc<ScrollState, ScrollState> {
  /// Start with correct header's index to avoid unnecessary fade animation.
  final int initialIndex;

  ScrollBloc({this.initialIndex = 0});

  @override
  ScrollState get initialState => ScrollState((b) => b
    ..currentScrollIndex = initialIndex
    ..scrollPercentage = 0
  );

  @override
  Stream<ScrollState> mapEventToState(ScrollState event) async* {
    // Both state and event are represented by the scroll state
    yield event;
  }
}
/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';

/// Manages sticky header scroll behaviour in food diary days.
class FoodDiaryScrollBloc extends Bloc<int, int> {
  /// Whether header is currently being scroll corrected.
  /// Must be static to editable within scroll notification.
  static bool isScrolling = false;

  /// Percentage of how much the top header has been pushed out.
  /// Must be static to editable within scroll notification.
  static double scrollPercentage = 0;

  /// Start with daily stats header's index.
  @override
  int get initialState => -1;

  @override
  Stream<int> mapEventToState(int event) async* {
    // Both state and event are the meal index
    yield event;

    BlocLogger().ui("Active sticky header now #$event");
  }
}
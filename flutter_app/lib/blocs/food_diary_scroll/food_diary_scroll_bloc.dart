/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';

/// Manages sticky header scroll behaviour in food diary days.
class FoodDiaryScrollBloc extends Bloc<int, int> {
  /// Start with correct header's index to avoid unnecessary fade animation.
  final int initialIndex;

  // TODO: include in state to make bloc reusable!
  /// Percentage of how much the top header has been pushed out.
  /// Must be static to editable within scroll notification.
  static double scrollPercentage = 0;

  FoodDiaryScrollBloc({this.initialIndex = 0});

  @override
  int get initialState => initialIndex;

  @override
  Stream<int> mapEventToState(int event) async* {
    // Both state and event are the meal index
    yield event;

    BlocLogger().ui("Active sticky header now #$event");
  }
}
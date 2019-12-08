/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc/bloc.dart';

class FoodDiaryScrollBloc extends Bloc<int, int> {
  /// ...
  static bool isScrolling = false;

  /// ...
  static double scrollPercentage = 0;

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int event) async* {
    // ...
    yield event;
    // TODO: log
  }
}
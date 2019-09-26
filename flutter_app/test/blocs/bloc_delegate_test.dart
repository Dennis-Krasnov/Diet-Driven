/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  BlocSupervisor.delegate = LoggingBlocDelegate();

  /// Mocks
  AnalyticsRepository analyticsRepository;
  UserDataBloc userDataBloc;

  /// Data
  NavigationBloc navigationBloc;

  /// Configuration
  setUp(() {
    analyticsRepository = MockAnalyticsRepository();
    userDataBloc = MockUserDataBloc();

    navigationBloc = NavigationBloc(
      analyticsRepository: analyticsRepository,
      userDataBloc: userDataBloc
    );
  });

  // TODO: expect LoggingBloc() to have certain state!
  // TODO: clear LoggingBloc() events after each test, or match end of stream only!
  // TODO: do LoggingBloc and NavigationBloc tests first!
}

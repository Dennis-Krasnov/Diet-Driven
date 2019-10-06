/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';

/// Manages bottom navigation and deep linking.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final UserDataBloc userDataBloc;
  final AnalyticsRepository analyticsRepository;

  NavigationBloc({@required this.userDataBloc, @required this.analyticsRepository})
    : assert(userDataBloc != null), assert(analyticsRepository != null);

  @override
  NavigationState get initialState => NavigationUninitialized();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is InitNavigation) {
      // Navigation has no error state
      assert(currentState is NavigationUninitialized);

      // Go to default page if navigation bloc hasn't yet been initialized
      Observable<UserDataState>(userDataBloc.state)
        .whereType<UserDataLoaded>()
        .map<NavigationEvent>((state) => state.settings.navigationSettings.defaultPage.navigationEvent)
        .first
        .then(dispatch);
    }

    if (event is NavigateToDiary) {
      yield DiaryTab((b) => b
        ..previousDeepLink = currentState.deepLink?.toBuilder()
        ..deepLink = event.deepLink?.toBuilder() ?? currentState.deepLink?.toBuilder()
      );
    }

    if (event is NavigateToTrack) {
      yield TrackTab();
    }

    if (event is NavigateToReports) {
      yield ReportsTab();
    }

    if (event is NavigateToSettings) {
      yield SettingsTab((b) => b
        ..previousDeepLink = currentState.deepLink?.toBuilder()
        ..deepLink = event.deepLink?.toBuilder() ?? currentState.deepLink?.toBuilder()
      );
    }

    if (event is NavigateToLogging) {
      yield LoggingTab();
    }
  }
}

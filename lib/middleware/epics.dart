import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final Logger log = new Logger("EPICS");

/// EPICS RUN AFTER REDUCERS
Iterable<Epic<AppState, AppStateBuilder, Actions>> createEpicBuilder() => (
  new EpicBuilder<AppState, AppStateBuilder, Actions>()
    ..add(NavigationActionsNames.goTo, goToEpic)
  ).build();

// Navigates to proper screen on state change
Observable<void> goToEpic(Observable<Action<Page>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  log.info("going to ${action.payload}");
  if (api.state.navigation.bottomNavigation.contains(action.payload)) {
    DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
  }
  else {
    DDApp.navigatorKey.currentState.popAndPushNamed(action.payload.toString());
  }

  // TODO: Adjust allowed phone orientation on certain screens
});
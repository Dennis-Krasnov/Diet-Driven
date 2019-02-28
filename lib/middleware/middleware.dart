import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/data/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart' hide Builder;
import 'package:logging/logging.dart';

final Logger log = new Logger("MIDDLEWARE");

/// MIDDLEWARE RUN BEFORE REDUCERS
Middleware<AppState, AppStateBuilder, Actions> createMiddleware(FirebaseAuth auth) {
  return (MiddlewareBuilder<AppState, AppStateBuilder, Actions>()
    ..add(ActionsNames.initApp, initApp(auth))
    ..add(NavigationActionsNames.reorderBottomNavigation, reorderBottomNavigationBuilder())

  ).build();
}

// TODO: shorten like this
//void increment(MiddlewareApi<Counter, CounterBuilder, CounterActions> api, ActionHandler next, Action<int> action) {
//  HttpRequest.postFormData(url, {'incrementAmount': action.payload})
//      .then(capi.actions.increment(action.payload))
//      .catchError(window.alert);
//}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> initApp(FirebaseAuth auth) {

  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    Page destination = api.state.navigation.defaultPage;

    // User isn't authenticated
    if (api.state.user.authUser == null) {
      FirebaseUser authUser = await auth.currentUser();

      // Firebase didn't persist user
      if (authUser == null) {
        print("CREATING ANONYMOUS USER");
        // TODO: destination = Page.loginScreen;
        authUser = await auth.signInAnonymously().catchError((e) => api.actions.user.anonymousUserFail(e));
      } else {
        destination = api.state.navigation.activePage;
      }

      api.actions.user.anonymousUserLoaded(authUser);
    }

//    DDApp.analytics.logLogin().then(() => print("SUCCESS"));
    // Firebase analytics user (anonymous)
    await DDApp.analytics.setUserId(api.state.user.authUser.uid);
    await DDApp.analytics.setUserProperty(name: "auth_type", value: "anonymous");
    // TODO: load user preferences, call DDApp.analytics.setAnalyticsCollectionEnabled(enabled) before all else

    // Go to default page
    api.actions.navigation.goTo(destination);

    next(action);
  };
}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> reorderBottomNavigationBuilder() {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    bool before = api.state.navigation.bottomNavigation.contains(api.state.navigation.activePage);
    next(action);
    bool after = api.state.navigation.bottomNavigation.contains(api.state.navigation.activePage);

    // Open same page in nested page
    if (before && !after) {
      DDApp.navigatorKey.currentState.pushNamed(api.state.navigation.activePage.toString());
    } // Open same page in bottom navigation
    else if (!before && after) {
      DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
    }
  };
}
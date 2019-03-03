import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/util/subscriptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:flutter/material.dart' hide Builder;
import 'package:logging/logging.dart';

final Logger log = new Logger("MIDDLEWARE");

/// MIDDLEWARE RUN BEFORE REDUCERS
Middleware<AppState, AppStateBuilder, Actions> createMiddleware(FirebaseAuth auth, Subscriptions subs) {
  return (MiddlewareBuilder<AppState, AppStateBuilder, Actions>()
    ..add(ActionsNames.initApp, initApp(auth, subs))
    ..add(ActionsNames.disposeApp, disposeApp(auth, subs))
    ..add(NavigationActionsNames.reorderBottomNavigation, reorderBottomNavigationBuilder())
    ..add(UserActionsNames.authStateChanged, authStateChanged)
  ).build();
}

// TODO: shorten like this
//void increment(MiddlewareApi<Counter, CounterBuilder, CounterActions> api, ActionHandler next, Action<int> action) {
//  HttpRequest.postFormData(url, {'incrementAmount': action.payload})
//      .then(capi.actions.increment(action.payload))
//      .catchError(window.alert);
//}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> initApp(FirebaseAuth auth, Subscriptions subs) {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {

    // Store not persisted
    if (api.state.user.authUser == null) {
      FirebaseUser authUser = await auth.currentUser();

      // Firebase user not persisted
      if (authUser == null) {
        authUser = await auth.signInAnonymously().catchError((e) => api.actions.user.anonymousUserFail(e));

        // Populate user with default firebase user
        // Otherwise settings received never happens and forever stuck in loading screen
        api.actions.populateWithDefaultSettings(authUser.uid);
      }

      // Saving authUser to store (not needed with authStateChanged listener)
//      api.actions.user.anonymousUserLoaded(authUser);
    }

    //
    subs.authSubscription = auth.onAuthStateChanged.listen((FirebaseUser fbUser) => api.actions.user.authStateChanged(fbUser));

    // Call remote config when launching app
    RemoteConfig config = await RemoteConfig.instance;

    // TODO: add default params to remoteConfig

    // Enable developer mode to relax fetch throttling
    await config.setConfigSettings(RemoteConfigSettings(debugMode: true));

    try {
      await config.fetch(expiration: const Duration(seconds: 0)); // FIXME
      await config.activateFetched();
      api.actions.firestore.remoteConfigReceived(config);

    } on FetchThrottledException catch (exception) {
      log.shout('Fetch throttled!');
      log.shout(exception);
      api.actions.firestore.remoteConfigReceived(null);
    } catch (exception) {
      log.shout('Unable to fetch remote config. Cached or default values will be used');
      log.shout(exception);
      api.actions.firestore.remoteConfigReceived(null);
    }

    // TODO: use cloud functions to mark every app as 'stale', re-fetch config settings

    //
    subs.startNavigationSubscription(
      api.actions.firestore.navigationSettingsReceived,
      print,
      NavigationStateDocument((b) => b..userId = api.state.user.authUser.uid)
    );

    // Firebase analytics user (anonymous) // TODO: move to authUserReceived!
    await DDApp.analytics.setUserId(api.state.user.authUser.uid);
    await DDApp.analytics.setUserProperty(name: "auth_type", value: "anonymous");
    // TODO: load user preferences first, call DDApp.analytics.setAnalyticsCollectionEnabled(enabled) // settingsReceived

    next(action);
  };
}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> disposeApp(FirebaseAuth auth, Subscriptions subs) {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    //
    subs.authSubscription.cancel();

    //
    await RemoteConfig.instance..dispose();

    //
    subs.stopNavigationSubscription();

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

void authStateChanged(MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action<FirebaseUser> action) async {
  log.info("auth state changed middlware: ${action.payload}");
  log.info("by this time settings loaded is ${api.state.settingsLoaded}");

  bool existsBefore = api.state.user.authUser != null;
  bool anonymousBefore;
  String emailBefore;
  if (existsBefore) {
    anonymousBefore = api.state.user.authUser.isAnonymous;
    emailBefore = api.state.user.authUser.email;
  }

  next(action);

  bool existsAfter = api.state.user.authUser != null; // TODO: use this in subsequent logic
  bool anonymousAfter = api.state.user.authUser.isAnonymous;
  String emailAfter = api.state.user.authUser.email;

  if (existsBefore) {
    if (anonymousBefore && !anonymousAfter) {
      log.info("Anonymous user registered for account");
    }
    else {
       log.shout("something new happened!!!");
    }
  }
  if (!existsBefore) {
    if (anonymousAfter) {
      log.info("New anonymous user");
    }
    else if (emailAfter != null) {
      log.info("Signed up with account from beginning / Existing user signed in");

    }
    else {
      log.shout("something new happened!!!");
    }
  }
}




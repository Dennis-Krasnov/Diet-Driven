import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final Logger log = new Logger("EPICS");

/// EPICS RUN AFTER REDUCERS
Iterable<Epic<AppState, AppStateBuilder, Actions>> createEpicBuilder() => (
  new EpicBuilder<AppState, AppStateBuilder, Actions>()
    ..add(ActionsNames.populateWithDefaultSettings, populateWithDefaultSettingsEpic)
    ..add(NavigationActionsNames.goTo, goToEpic)
    ..add(UserActionsNames.logout, logoutEpic)

    // DIARY
    ..add(FirestoreActionsNames.updateFoodDiaryDay, updateFoodDiaryDayEpic)
//    ..add(FirestoreActionsNames.saveFoodDiaryDay, saveFoodToDiaryEpic) // FIXME
    ..add(FirestoreActionsNames.deleteFoodDiaryDay, deleteFoodDiaryDayEpic)

    // SETTINGS
    ..add(FirestoreActionsNames.updateNavigationState, updateNavigationSettingsEpic)

).build();


///
Observable<void> populateWithDefaultSettingsEpic(Observable<Action<String>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) async {
  log.info("populating with default settings.");

  NavigationState navigationState = NavigationState();

  UserStateDocument((b) => b
    ..userId = action.payload ?? api.state.user.authUser.uid
    ..subPath = "navigation"
  ).update(navigationState);

  log.fine("populated with default settings: $navigationState.");
});

/// Navigates to proper screen on state change
Observable<void> goToEpic(Observable<Action<Page>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  log.info("going to ${action.payload}");
  if (api.state.navigation.bottomNavigation.contains(action.payload)) {
    DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
  }
  else {
    DDApp.navigatorKey.currentState.popAndPushNamed(action.payload.toString());
  }

  // Firebase Analytics page update
  DDApp.analytics.setCurrentScreen(screenName: PageFactory.toText(action.payload), screenClassOverride: action.payload.name);
  // TODO: screenClassOverride: 'AnalyticsDemo',
  //  Adjust allowed phone orientation on certain screens
  //  manage nested navigators
});

///
Observable<void> logoutEpic(Observable<Action> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  FirebaseUser user = api.state.user.authUser;
  log.info("logging out ${user?.uid}");

  if (user != null) {
    if (user.isAnonymous) {
      // TODO: delete all firestore data!
      user.delete();
      log.info("deleted anonymous account");
    } else {
      FirebaseAuth.instance.signOut();
      log.info("signed out");
    }
  }
  // TODO: go to sign in page!
});

// TODO: USE TRANSACTIONS
///
Observable<void> updateFoodDiaryDayEpic(Observable<Action<FoodDiaryDay>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  log.info("Updating food diary day.");

  // TODO: this is a much better way to do it, why would widgets know about documents, still keeps document abstraction
  // Creating Document in epic
  FoodDiaryDayDocument fs = new FoodDiaryDayDocument((b) => b
    ..userId = b.userId ?? api.state.user.authUser.uid
    ..daysSinceEpoch = action.payload.id
  );

  // Delete day if no food records present TODO: check for other data
  if (action.payload.foodRecords.isEmpty) {
    fs.delete();
  }
  else {
    fs.update(action.payload);
  }

  log.fine("updated food diary day  ${action.payload.id}.");
});

///
Observable<void> deleteFoodDiaryDayEpic(Observable<Action<FoodDiaryDay>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  log.info("Deleting food diary day.");

  // TODO: this is a much better way to do it, why would widgets know about documents, still keeps document abstraction
  // Creating Document in epic
  FoodDiaryDayDocument fs = new FoodDiaryDayDocument((b) => b
    ..userId = b.userId ?? api.state.user.authUser.uid
    ..daysSinceEpoch = action.payload.id
  );

  fs.delete();

  log.fine("deleted food diary day  ${action.payload.id}.");
});

///
Observable<void> updateNavigationSettingsEpic(Observable<Action<FSTuple<dynamic>>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) async {
  log.info("Saving new navigation settings.");

  // TODO: make custom userTuple...
  UserStateDocument usd = action.payload.fs as UserStateDocument;

  // Add userId and sub path if it's missing
  usd = usd.rebuild((b) => b
    ..userId = b.userId ?? api.state.user.authUser.uid
    ..subPath = b.subPath ?? "navigation"
  );

  usd.update(action.payload.data);

  log.fine("saved navigation settings: ${action.payload.data}.");
});

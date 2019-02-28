import 'package:built_redux/built_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/util/built_firestore.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final Logger log = new Logger("EPICS");

/// EPICS RUN AFTER REDUCERS
Iterable<Epic<AppState, AppStateBuilder, Actions>> createEpicBuilder() => (
  new EpicBuilder<AppState, AppStateBuilder, Actions>()
    ..add(NavigationActionsNames.goTo, goToEpic)
    ..add(FirestoreActionsNames.updateFoodRecord, updateFoodEpic)
    ..add(FirestoreActionsNames.saveFoodRecord, saveFoodToDiaryEpic)
    ..add(FirestoreActionsNames.deleteFoodRecord, deleteFoodRecordEpic)
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

  // Firebase Analytics page update
  DDApp.analytics.setCurrentScreen(screenName: action.payload.name, screenClassOverride: PageFactory.toPage(action.payload).runtimeType.toString());
  // TODO: screenClassOverride: 'AnalyticsDemo',

  // TODO: Adjust allowed phone orientation on certain screens

  // TODO: manage nested navigators
});

// TODO: USE TRANSACTIONS

Observable<void> updateFoodEpic(Observable<Action<FSTuple<FoodRecord>>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  log.info("Updating food record.");

  // Casting to specific document
  FoodRecordDocument fs = action.payload.fs as FoodRecordDocument;

  // Add userId if it's missing
  fs = fs.rebuild((b) => b..userId = b.userId ?? api.state.user.authUser.uid);

  // Directly update Firestore
  fs.update(action.payload.data);

  log.fine("updated food record  ${action.payload.data.id}.");
});

Observable<void> saveFoodToDiaryEpic(Observable<Action<FSDynamicTuple<FoodRecord>>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) async {
  log.info("Saving new food record.");

  // Casting to specific collection
  FoodDiaryCollection fdc = action.payload.fs as FoodDiaryCollection;

  // Add userId if it's missing
  fdc = fdc.rebuild((b) => b..userId = b.userId ?? api.state.user.authUser.uid);

  // Add to foodDiary collection
  DocumentReference dr = await fdc.add(action.payload.data);

  log.fine("saved food record ${dr.documentID}.");
});

Observable<void> deleteFoodRecordEpic(Observable<Action<FoodRecordDocument>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) async {
  log.info("Deleting food record.");

  FoodRecordDocument frd = action.payload;

  // Add userId if it's missing
  frd = frd.rebuild((b) => b..userId = b.userId ?? api.state.user.authUser.uid);

  frd.delete();

  log.fine("deleted food record ${action.payload.foodRecordId}.");
});

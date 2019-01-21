import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';

//import 'package:built_redux_rx/built_redux_rx.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

// RUNS AFTER REDUCER
Iterable<Epic<AppState, AppStateBuilder, Actions>> createEpicBuilder() =>
    (new EpicBuilder<AppState, AppStateBuilder, Actions>()
        ..add(ActionsNames.goTo, goToEpic)
//        ..add(ActionsNames.startDiaryListen, fsRouter)
//        ..add(ActionsNames.fbStartDocListen, fsDocumentListener)
//        ..add(ActionsNames.fbStopDocListen, fsDocumentListener)
//        ..add(ActionsNames.settingsListen, fsRouter)
//        ..add(ActionsNames.settingsStopListen, fsRouter)
    ).build();


Observable<void> goToEpic(Observable<Action<Page>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  print("GOING TO ${action.payload}");
  if (api.state.bottomNavigation.contains(action.payload)) {
    DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
  }
  else {
    DDApp.navigatorKey.currentState.popAndPushNamed(action.payload.toString());
  }
});


// TODO: create router non-typed...
//Observable<void> fsRouter(Observable<Action<String>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) async {
Observable<void> fsRouter(Observable<Action<int>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) async {
  print("ROUTING!!!");
  print(action.payload);

  if (action.name == ActionsNames.startDiaryListen.name) {

  }
//  await new Future<void>.delayed(new Duration(milliseconds: 1));
//  mwApi.actions.decrement(action.payload);
//  return stream.asyncMap((action) {
//  if (action.name == ActionsNames.settingsListen.name) {
//    api.actions.fbStartDocListen("users/${action.payload}/settings/general");
//  }
//  else if (action.name == ActionsNames.settingsStopListen.name) {
//    api.actions.fbStopDocListen("users/${action.payload}/settings/general");
//  }

//  } else if (action.name == ActionsNames.fbStartDocListen.name) {
//    api.actions.fbStopDocListen("users/${action.payload}/settings/general");
//  else {
//    print("CAN'T CALL ROUTER WITH ${action.name} -> ${action.payload}");
//  }

});


Observable<void> fsDocumentListener(Observable<Action<String>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.flatMap((action) {
//Observable<void> fbDocumentListener(Observable<Action<String>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.flatMap((action) {
//  return new Observable.fromFuture(Firestore.instance.document(action.payload).snapshots).map((DocumentSnapshot doc) => doc["sex"] as String);
//  return new Observable.fromFuture(Firestore.instance.document(action.payload).snapshots)
  if (action.name == ActionsNames.fbStopDocListen.name) {
    print("IM EMPTY");
    return Observable.empty();
  }

//  Map<String, subscription>: widget_uid -> StreamSubsciption (in static class!!!)
  // like Firestore.instance // always somewhere.. always living

//  return Firestore.instance.document(action.payload).snapshots().listen((DocumentSnapshot ds) => null, onDone: () => null, onError: () => null).//() => null)//.distinct()
//    .map((DocumentSnapshot doc) => doc["sex"] as String)
//    .map((sex) => api.actions.settingsReceived(sex));
////    .takeWhile((_) => action.name != ActionsNames.fbStopDocListen.name); //TODO: && action.payload == );
});



//Observable<void> reorderBottomNavigationBuilder(Observable<Action<List<Page>>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
//  bool a = api.state.bottomNavigation.contains(api.state.activePage);
//  bool b = action.payload.contains(api.state.activePage);
//  print("A: $a   B:  $b");
//
//  // Open same page in nested page
//  if (a && !b) {
//    DDApp.navigatorKey.currentState.pushNamed(api.state.activePage.toString());
//  } // Open same page in bottom navigation
//  else if (!a && b) {
//    DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
//  }
//});

//    DDApp.ddAppKey.currentState.store..actionStream(ActionsNames.reorderBottomNavigation).listen((change) {
//      // Open same page in nested page
//      if (change.prev.bottomNavigation.contains(change.prev.activePage) && !change.next.bottomNavigation.contains(change.prev.activePage)) {
//        Navigator.pushNamed(context, change.prev.activePage.toString());
//      } // Open same page in bottom navigation
//      else if (!change.prev.bottomNavigation.contains(change.prev.activePage) && change.next.bottomNavigation.contains(change.prev.activePage)) {
//        Navigator.popUntil(context, ModalRoute.withName("/"));
//      }


//MiddlewareHandler<AppState, AppStateBuilder, Actions, void> logout(FirebaseAuth auth) {
//  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
//    await auth.signOut();
//    api.actions.goTo(Page.loginScreen); // TODO: still throws errors!
//    api.actions.setUser(null);
//    next(action);
//  };
//}
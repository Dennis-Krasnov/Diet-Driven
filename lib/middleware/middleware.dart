import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:built_redux_rx/built_redux_rx.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

// RUNS BEFORE REDUCER
Middleware<AppState, AppStateBuilder, Actions> createMiddleware(FirebaseAuth auth) {
  return (MiddlewareBuilder<AppState, AppStateBuilder, Actions>()
      ..add(ActionsNames.initApp, initApp(auth))
//      ..add(ActionsNames.goTo, goTo())
      ..add(ActionsNames.reorderBottomNavigation, reorderBottomNavigationBuilder())

//      ..add(ActionsNames.logout, logout(auth))
  ).build();
}


MiddlewareHandler<AppState, AppStateBuilder, Actions, void> initApp(FirebaseAuth auth) {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    Page destination = api.state.defaultPage;

    // State doesn't contain user
    if (api.state.user == null) {
      FirebaseUser user = await auth.currentUser();

      // Firebase didn't persist user
      if (user == null) {
        print("CREATING ANONYMOUS USER");
        // TODO: destination = Page.loginScreen;
        user = await auth.signInAnonymously()
            .catchError((e) => api.actions.anonymousUserFail(e));
      } else {
        destination = api.state.activePage;
      }

      print("IF NULL IN MIDDLEWARE");
      api.actions.anonymousUserLoaded(user);
    }
    api.actions.goTo(destination);

    next(action);
  };
}

//NextActionHandler reorderBottomNavigationBuilder(MiddlewareApi api) => (ActionHandler next) => (Action action) {
//  final bool before = api.state.bottomNavigation.contains(api.state.activePage);
//  next(action);
//};



MiddlewareHandler<AppState, AppStateBuilder, Actions, void> goTo() {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api,
      ActionHandler next, Action action) async {
    print("GOTO!!");
    if (api.state.bottomNavigation.contains(action.payload)) {
      DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
    }
    else {
      DDApp.navigatorKey.currentState.popAndPushNamed(action.payload.toString());
    }
    next(action);
  };
}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> reorderBottomNavigationBuilder() {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    bool before = api.state.bottomNavigation.contains(api.state.activePage);
    next(action);
    bool after = api.state.bottomNavigation.contains(api.state.activePage);

    // Open same page in nested page
    if (before && !after) {
      DDApp.navigatorKey.currentState.pushNamed(api.state.activePage.toString());
    } // Open same page in bottom navigation
    else if (!before && after) {
      DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
    }
  };
}

//Observable goToEpic(Observable<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> mwApi) =>
//    stream
//        .where((a) => a.name == ActionsNames.goTo.name)
//        .map((a) => a as Action<Page>)
//        .asyncMap(
//          (action) {
//            print("GO TO EPIC: ${action.payload}");
//          },
//    );

// RUNS AFTER REDUCER
Iterable<Epic<AppState, AppStateBuilder, Actions>> createEpicBuilder() =>
    (new EpicBuilder<AppState, AppStateBuilder, Actions>()
        ..add(ActionsNames.goTo, goToNavigationBuilder)
//        ..add(ActionsNames.reorderBottomNavigation, reorderBottomNavigationBuilder)
    ).build();


Observable<void> goToNavigationBuilder(Observable<Action<Page>> stream, MiddlewareApi<AppState, AppStateBuilder, Actions> api) => stream.asyncMap((action) {
  print("GOING TO ${action.payload}");
  if (api.state.bottomNavigation.contains(action.payload)) {
    DDApp.navigatorKey.currentState.popUntil(ModalRoute.withName("/"));
  }
  else {
    DDApp.navigatorKey.currentState.popAndPushNamed(action.payload.toString());
  }
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
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart' hide Builder;
import 'package:logging/logging.dart';

final Logger log = new Logger("MIDDLEWARE");

/// MIDDLEWARE RUN BEFORE REDUCERS
Middleware<AppState, AppStateBuilder, Actions> createMiddleware(FirebaseAuth auth) {
  return (MiddlewareBuilder<AppState, AppStateBuilder, Actions>()
    ..add(ActionsNames.initApp, initApp(auth))
    ..add(NavigationActionsNames.reorderBottomNavigation, reorderBottomNavigationBuilder())

      ..add(FirestoreActionsNames.subscribe, firestoreSubscribe())
      ..add(FirestoreActionsNames.unsubscribe, firestoreUnsubscribe())
      ..add(ActionsNames.diaryReceived, diaryReceived())
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

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> firestoreSubscribe() {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
//    print("SUBSCRIPTION: ${(action.payload as FS).streamSubscription}");

    var fsPath = action.payload as FSPath;
    var fs = fsPath.firestore;
    log.fine("SUBSCRIPTION: ${fs.streamSubscription}");

    // Already listening to Firestore snapshots
//    if (api.state.subscriptions.contains(action.payload)) { // FIXME: 2 separate methods!!! (action is either FSDOC or FSCOLLECTION)
      if (api.state.subscriptions.keys.contains(fs)) {
        api.actions.firestore.additionalSubscription(action.payload);
      } // Called without a subscription
      else if (fs.streamSubscription == null) {
        Function onData;
        Function onError = print;

        if (fs is FoodRecordDocument) {
          log.fine("FOOD RECORD DOCUMENT");
          onData = (t) => api.actions.diaryRecordReceived(t);
          fs = (fs as FoodRecordDocument).rebuild((b) => b ..streamSubscription = fs.snapshotObservable.listen(onData, onError: onError));
        }
        else if (fsPath.firestore is FoodDiaryCollection) {
          log.fine("FOOD DIARY COLLECTION");
          onData = (t) => api.actions.diaryReceived(t);
          fs = (fs as FoodDiaryCollection).rebuild((b) => b ..streamSubscription = fs.snapshotObservable.listen(onData, onError: onError));
        } else {
          log.shout("DEFAULT ACTION TYPE: ${fsPath.firestore.runtimeType}");
        }


//        Function onData = (t) => log.shout(t); // FIXME


//      print(builder.subscriptions[i] is FSDocument<FoodRecord>); // TODO: i was missing <generics!>

//      (action.payload as FS).getOnDataAction(store.actions) -> returns function!, no need for switch!

        // TODO: different actions based on switch(action.payload.runType) case: FSDiary, etc.
//      print(action.payload.runtimeType);
//      print(action.payload.runtimeType is FSDiary); // FIXME
//      switch (action.payload.runtimeType) {
//        case FSDiary: // it's actually _$FSDiary
//          print("ello");
//          onData = (t) => api.actions.diaryReceived(t);
//          break;
//
//        default:
//          print("UNRECOGNIZED LISTENER");
//          onData = (t) => api.actions.diaryReceived(t);
//          break;
//      }
//        fsPath.firestore.streamSubscription = fsPath.firestore.snapshotObservable.listen(onData, onError: onError);
        api.actions.firestore.subscribe(new FSPath(
            fs,
//            fsPath.firestore.rebuild((b) => b..streamSubscription = fsPath.firestore.snapshotObservable.listen(onData, onError: onError)),
            fsPath.subscriptions
        ));
///        api.actions.firestore.subscribe(action.payload.rebuild((b) => b..streamSubscription = action.payload.snapshotObservable.listen(onData, onError: onError)));
      } // Subscribe to Firestore (recursion base case)
      else {
        next(action);
      }
    };

    // TODO: this logic is flawed (since i introduced subscribe, secondSubscription - it's never called!!!!)
//    if (action.payload.streamSubscription == null && !api.state.subscriptions.contains(action.payload)) {
//      api.actions.subscribe(action.payload.rebuild((b) => b..streamSubscription = action.payload.snapshotObservable.listen((t) => api.actions.diaryReceived(t), onError: print)));
////      api.actions.subscribe(action.payload.rebuild((b) => b..streamSubscription = action.payload.snapshotObservable.listen(print, onError: print)));
//
//    } else {
//      next(action);
//    }
//    var payload = action.payload as FS;
//    if (payload.streamSubscription == null && !api.state.subscriptions.contains(action.payload)) {
////      api.actions.startDiaryListen(payload.rebuild((b) => b..streamSubscription = payload.snapshotObservable.listen(api.actions.diaryReceived, onError: print)));
//      api.actions.startDiaryListen(payload.rebuild((b) => b..streamSubscription = payload.snapshotObservable.listen(api.actions.diaryReceived, onError: print)));
//    }
//    else {
//      next(action);
//    }

    //

//    return firestoreSubscribe()(api, next, action.. (p);

//    next()
//    var a = action;
//    (a.payload as FSDiary).rebuild(updates)
//    next()
//    new Action(payload)..payload = action.payload;

//    if (!api.state.subscriptions.contains(action.payload) && (action.payload as FSDiary).streamSubscription == null) {
//      var fs = action.payload as FSDiary;
////      api.actions.startDiaryListen(fs.rebuild((b) => b..streamSubscription = fs.snapshotObservable.listen(print, onError: print)));
////      next(action);
//    } //
////    else {
//    next(action);
//    }

//    FS fs = action.payload as FS;

//    if (true || api.state.subscriptions.contains(action.payload)) {
//      print("BEFORE: ${fs.streamSubscription}");
//      print("BEFORE: ${(action.payload as FSDiary).streamSubscription}");
//      if (fs is FSDiary) {
//        fs = ;
//      }
//
////      (fs as FSDiary).rebuild((b) => b..streamSubscription = b.snapshotObservable);
////      if (action.payload is Built && action.payload is FS) {
////
////      }
////      ((action.payload as Built) as FS).
////      (fs as Built).rebuild((b) => b..);
//
//      print("AFTER: ${fs.streamSubscription}");
//      print("AFTER: ${(action.payload as FSDiary).streamSubscription}");

//      fs.streamSubscription = fs.snapshotObservable.listen(print, onError: print); // TODO: place listeners on observer instead
//    }
//    String n = action.name;
//    if (n == ActionsNames.startDiaryListen.name && !api.state.subscriptions.containsKey(action.payload)) {
//      action.payload.rebuild((b) => b..streamSubscription = action.payload.subscribe(api.actions.diaryReceived));
//      print("starting");
//    }
//    if (n == ActionsNames.stopDiaryListen.name && api.state.subscriptions.containsKey(action.payload)) {
////      api.state.subscriptions.keys.where((fs) => fs == action.payload).first.sub.cancel(); // FIXME!!!
////      temp.sub.cancel();
//      print("stopping");
//    }
//    next(action);
}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> firestoreUnsubscribe() {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {

//    var payload = action.payload as FSDiary;

    print(api.state.subscriptions.keys.contains(action.payload));
//    print(api.state.subscriptions.indexOf(action.payload));

    var fsPath = (action.payload as FSPath);
    print("SUBSCRIPTION: ${fsPath.firestore.streamSubscription}");
    var fs = api.state.subscriptions.keys.toList()[api.state.subscriptions.keys.toList().indexOf(fsPath.firestore)];

//    var fs = api.state.subscriptions[api.state.subscriptions.indexOf(action.payload)];
    if (api.state.subscriptions.containsKey(fsPath.firestore) && fs.streamSubscription != null) {
      fs.streamSubscription.cancel();
      log.shout("CANCELLED ${action.payload}");
      next(action);
    }
//
//    if (payload.streamSubscription == null) {
//      api.actions.startDiaryListen(payload.rebuild((b) => b..streamSubscription = payload.snapshotObservable.listen(api.actions.diaryReceived, onError: print)));
//    }
//    else {
//      next(action);
//    }

//    String n = action.name;
//    if (n == ActionsNames.startDiaryListen.name && !api.state.subscriptions.containsKey(action.payload)) {
//      action.payload.rebuild((b) => b..streamSubscription = action.payload.subscribe(api.actions.diaryReceived));
//      print("starting");
//    }
//    if (n == ActionsNames.stopDiaryListen.name && api.state.subscriptions.containsKey(action.payload)) {
////      api.state.subscriptions.keys.where((fs) => fs == action.payload).first.sub.cancel(); // FIXME!!!
////      temp.sub.cancel();
//      print("stopping");
//    }
  };
}

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> diaryReceived() {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    print("MW: ${action.payload}");
//    String n = action.name;
//    if (n == ActionsNames.startDiaryListen.name && !api.state.subscriptions.containsKey(Connections.diary)) {
//      print("starting");
//    }
//    if (n == ActionsNames.stopDiaryListen.name && api.state.subscriptions.containsKey(Connections.diary)) {
//      print("stopping");
//    }
    next(action);
  };
}

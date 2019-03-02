import 'dart:async';

import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:flutter/material.dart';

/// Singleton
class Subscriptions {
  static final Subscriptions _subscriptions = new Subscriptions._internal();

  // TODO: single collection for all settings
//  Subscription<NavigationState> _navigationSettings;
  NavigationStateDocument _navigationSettings;

  void startNavigationSubscription(Function onData, Function onError, NavigationStateDocument document) {
    document = document.rebuild((b) => b
      ..streamSubscription = document.snapshotObservable.listen(onData, onError: onError)
    );

//    _navigationSettings = Subscription(onData, onError, document);
    _navigationSettings = document;
  }

  void stopNavigationSubscription() {
    _navigationSettings?.streamSubscription?.cancel();
  }

  // Globally store 100 most recent records
//  Subscription<FoodRecord> foodDiary;

  factory Subscriptions() {
    return _subscriptions;
  }

  Subscriptions._internal();
}

/////
//class Subscription<T> {
//  Function onData;
//  Function onError;
//  FS<T> connection;
//
//  Subscription(this.onData, this.onError, this.connection);
//}
// nope: store single Subscriptions HOC just below ReduxProvider, itself being a connector (listens to ID) NO! can't access it methods

// STORE THIS OBJECT IN STORE? - whats the point...
// TODO: call these methods from middleware, where I have access to actions, methods!


//
//class SubscriberState extends State<Subscriber> {
//
//  @override
//  void initState() {
//    super.initState();
//
//    if (widget.autoSubscribe) {
//      subscribeToSubscriptions();
//    } else {
//      unsubscribeToSubscriptions();
//    }
//  }
//
//  /// Listen to every subscription
//  void subscribeToSubscriptions() {
//    widget.subscriptions.forEach((sub) {
//      log.fine("subscribing to ${sub.connection}");
//
//      var conn;
//      // TODO: DO THIS WITH GENERICS? / pass a type? (do this more elegantly...) (just to doc or collection!?)
//      if (sub.connection is FoodDiaryCollection) {
//        print("IS FS DIARY");
//        conn = sub.connection as FoodDiaryCollection;
//      }
//      else if (sub.connection is NavigationStateDocument) {
//        print("IS FS NAVIGATION STATE");
//        conn = sub.connection as NavigationStateDocument;
//      }
//      else {
//        print("ITS NOT");
//        print(sub.connection.runtimeType);
//
//      }
//      // todo: pass type as param!?
////      var conn2 = sub.connection as Built<sub.connection.runtimeType extends Built, sub.connection.runtimeType>; //pass as param!?
//      sub.connection = conn.rebuild((b) => b..streamSubscription = sub.connection.snapshotObservable.listen(sub.onData, onError: sub.onError));
//    });
//  }
//
//  /// Cancel every non-null subscription
//  void unsubscribeToSubscriptions() {
//    widget.subscriptions.forEach((sub) {
//      log.fine("usubscribing from ${sub.connection}");
//      sub.connection.streamSubscription?.cancel();
//    });
//  }
//
//  @override
//  void dispose() {
//    unsubscribeToSubscriptions();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return widget.builder(context);
//  }
//}
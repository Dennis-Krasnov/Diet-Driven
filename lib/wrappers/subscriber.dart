import 'dart:async';

import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:flutter/material.dart';

///
class Subscription<T> {
  Function onData;
  Function onError;
  FS<T> connection;

  Subscription(this.onData, this.onError, this.connection);
}

///
class Subscriber extends StatefulWidget {
  final int hash;
  final List<Subscription> subscriptions;
  final bool autoSubscribe;
  final Widget Function(BuildContext context) builder;

  Subscriber(this.hash, this.subscriptions, {this.autoSubscribe: true, @required this.builder});

  @override
  State<StatefulWidget> createState() => new SubscriberState();
}

/// Higher order component subscribes to Firestore with given connector
/* FIXME outdated
class DiaryPage extends StoreConnector<AppState, Actions, int> {

  @override
  DiaryPageVM connect(AppState state) {
    return state.some_number;
  }

  @override
  Widget build(BuildContext context, int some_number, Actions actions) {
    var diary = new FoodDiaryCollection((b) => b
      ..userId = some_number;
    );

    return Connector(actions, [diary], builder: (BuildContext context) {
      return Text("now vm has updated data");
    });
  }
}
 */
class SubscriberState extends State<Subscriber> {

  @override
  void initState() {
    super.initState();

    if (widget.autoSubscribe) {
      subscribeToSubscriptions();
    } else {
      unsubscribeToSubscriptions();
    }
  }

  /// Listen to every subscription
  void subscribeToSubscriptions() {
    widget.subscriptions.forEach((sub) {
      log.fine("subscribing to ${sub.connection}");

      var conn;
      // TODO: DO THIS WITH GENERICS? / pass a type? (do this more elegantly...) (just to doc or collection!?)
      if (sub.connection is FoodDiaryCollection) {
        print("IS FS DIARY");
        conn = sub.connection as FoodDiaryCollection;
      }
      else if (sub.connection is NavigationStateDocument) {
        print("IS FS NAVIGATION STATE");
        conn = sub.connection as NavigationStateDocument;
      }
      else {
        print("ITS NOT");
        print(sub.connection.runtimeType);

      }
      // todo: pass type as param!?
//      var conn2 = sub.connection as Built<sub.connection.runtimeType extends Built, sub.connection.runtimeType>; //pass as param!?
      sub.connection = conn.rebuild((b) => b..streamSubscription = sub.connection.snapshotObservable.listen(sub.onData, onError: sub.onError));
    });
  }

  /// Cancel every non-null subscription
  void unsubscribeToSubscriptions() {
    widget.subscriptions.forEach((sub) {
      log.fine("usubscribing from ${sub.connection}");
      sub.connection.streamSubscription?.cancel();
    });
  }

  @override
  void dispose() {
    unsubscribeToSubscriptions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
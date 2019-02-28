import 'dart:async';

import 'package:diet_driven/data/food_record.dart';
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
  final Widget Function(BuildContext context) builder;

  Subscriber(this.hash, this.subscriptions, {@required this.builder});

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
    // Listen to every subscription
    widget.subscriptions.forEach((sub) {
      log.fine("subscribing to ${sub.connection}");
      // DO THIS WITH GENERICS? / pass a type?
      var conn = sub.connection as FoodDiaryCollection; //pass as param!?
//      var conn2 = sub.connection as Built<sub.connection.runtimeType extends Built, sub.connection.runtimeType>; //pass as param!?
      sub.connection = conn.rebuild((b) => b..streamSubscription = sub.connection.snapshotObservable.listen(sub.onData, onError: sub.onError));
    });
  }

  @override
  void dispose() {
    // Cancel every non-null subscription
    widget.subscriptions.forEach((sub) => sub.connection.streamSubscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
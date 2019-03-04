import 'dart:async';

import 'package:diet_driven/models/navigation_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Singleton
class Subscriptions {
  static final Subscriptions _subscriptions = new Subscriptions._internal();

  // TODO: single collection for all settings
//  Subscription<NavigationState> _navigationSettings;
  NavigationStateDocument _navigationSettings;

  // ignore: cancel_subscriptions
  StreamSubscription<FirebaseUser> authSubscription;

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

  // Globally store 100 most recent records, only use Subscriber for temporary syncing
//  Subscription<FoodRecord> foodDiary;

  factory Subscriptions() {
    return _subscriptions;
  }

  Subscriptions._internal();
}
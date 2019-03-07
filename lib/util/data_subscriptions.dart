import 'dart:async';

import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/models/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Singleton
class DataSubscriptions {
  static final DataSubscriptions _dataSubscriptions = new DataSubscriptions._internal();

  UserStateDocument _userData;

  /*
  Description...

  see user_state for example
   */
  SettingsCollection _settings;

  // ignore: cancel_subscriptions
  StreamSubscription<FirebaseUser> authSubscription;

  void startSettingsSubscription(Function onData, Function onError, SettingsCollection collection) {
    collection = collection.rebuild((b) => b
     ..streamSubscription = collection.snapshotObservable.listen(onData, onError: onError)
    );

    _settings = collection;
    print("Started listening to settings $collection}");
  }

  void stopSettingsSubscription() {
    _settings?.streamSubscription?.cancel();
  }

  void startUserDataSubscription(Function onData, Function onError, UserStateDocument document) {
    document = document.rebuild((b) => b
      ..streamSubscription = document.snapshotObservable.listen(onData, onError: onError)
    );

    _userData = document;
    print("Started listening to user data $document}");
  }

  void stopUserDataSubscription() {
    _settings?.streamSubscription?.cancel();
  }

  /*
  Description... (move food records subscription here)

  see user_state
  all logic including going to a historical page
   */

  // Globally store 100 most recent records, only use Subscriber for temporary syncing
//  Subscription<FoodRecord> foodDiary;

  factory DataSubscriptions() {
    return _dataSubscriptions;
  }

  DataSubscriptions._internal();
}
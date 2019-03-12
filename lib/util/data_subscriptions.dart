import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:diet_driven/models/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Singleton
class DataSubscriptions {
  static final DataSubscriptions _dataSubscriptions = new DataSubscriptions._internal();

  /*
  ...
   */
  StreamSubscription<FirebaseUser> authSubscription; // ignore: cancel_subscriptions

  /*
  ...
   */
  StreamSubscription<ConnectivityResult> connectivitySubscription; // ignore: cancel_subscriptions

  /*
  Description...

  see user_state for example
   */
  SettingsCollection _settings;

  ///
  void startSettingsSubscription(Function onData, Function onError, SettingsCollection collection) {
    collection = collection.rebuild((b) => b
     ..streamSubscription = collection.snapshotObservable.listen(onData, onError: onError)
    );

    _settings = collection;
    print("Started listening to settings $collection}");
  }

  ///
  void stopSettingsSubscription() {
    _settings?.streamSubscription?.cancel();
    print("stopped listening to settings");
  }

  /*
  ...
   */
  UserStateDocument _userData;

  ///
  void startUserDataSubscription(Function onData, Function onError, UserStateDocument document) {
    document = document.rebuild((b) => b
      ..streamSubscription = document.snapshotObservable.listen(onData, onError: onError)
    );

    _userData = document;
    print("Started listening to user data $document}");
  }

  ///
  void stopUserDataSubscription() {
    _userData?.streamSubscription?.cancel();
    print("stopped listening to user data");
  }

  /// Singleton
  factory DataSubscriptions() {
    return _dataSubscriptions;
  }

  DataSubscriptions._internal();
}

/*
  Description... (move food records subscription here)

  see user_state
  all logic including going to a historical page
   */

// Globally store 100 most recent records, only use Subscriber for temporary syncing
//  Subscription<FoodRecord> foodDiary;
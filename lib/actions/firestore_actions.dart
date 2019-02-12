library firestore_actions;

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
part 'firestore_actions.g.dart';

///
abstract class FirestoreActions extends ReduxActions {
  ActionDispatcher<String> fbStartDocListen;
  ActionDispatcher<String> fbStopDocListen;
  ActionDispatcher<dynamic> fbDocListenError;

//  ActionDispatcher<Connection> beginRealTimeDatabaseListen;
//  ActionDispatcher<int> beginRealTimeDatabaseListen; /// rename to begin settingsListen
  ActionDispatcher<int> startSettingsListen;
  ActionDispatcher<int> stopSettingsListen;
//  ActionDispatcher<dynamic> updateError;
//  ActionDispatcher<dynamic> addError; etc.

  /// <PATH> ??? instead ???? - how do I pass listeners?
  /// // these replace all other ones!
  ActionDispatcher<FS> subscribe;
  ActionDispatcher<FS> additionalSubscription;
  ActionDispatcher<FS> unsubscribe;

  // String userID
//  ActionDispatcher<String> settingsListen;
//  ActionDispatcher<dynamic> settingsReceived;
//  ActionDispatcher<String> settingsStopListen;

  factory FirestoreActions() => new _$FirestoreActions();
  FirestoreActions._();
}
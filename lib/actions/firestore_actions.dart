library firestore_actions;

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
part 'firestore_actions.g.dart';

///
abstract class FirestoreActions extends ReduxActions {
  //
  ActionDispatcher<String> fbStartDocListen;

  //
  ActionDispatcher<String> fbStopDocListen;

  //
  ActionDispatcher<dynamic> fbDocListenError;

  //
  ActionDispatcher<int> startSettingsListen;

  //
  ActionDispatcher<int> stopSettingsListen;
//  ActionDispatcher<dynamic> updateError;
//  ActionDispatcher<dynamic> addError; etc.

  //
  ActionDispatcher<FSPath> subscribe;

  //
  ActionDispatcher<FSPath> additionalSubscription;

  //
  ActionDispatcher<FSPath> unsubscribe;

  //
  ActionDispatcher<FS> unsubscribeAll;

  factory FirestoreActions() => new _$FirestoreActions();
  FirestoreActions._();
}
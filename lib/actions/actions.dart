library actions;
// TODO: rename as action

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'actions.g.dart';

abstract class Actions extends ReduxActions {
  factory Actions() => new _$Actions();

  Actions._();

  // Firebase Auth
  ActionDispatcher initApp;
  ActionDispatcher<FirebaseUser> anonymousUserLoaded;
  ActionDispatcher<dynamic> anonymousUserFail;
  ActionDispatcher logout;

  // Navigation
  ActionDispatcher<Page> goTo;
  ActionDispatcher<List<Page>> reorderBottomNavigation;
  ActionDispatcher<Page> setDefaultPage;

  // Firebase
  ActionDispatcher<String> fbStartDocListen;
  ActionDispatcher<String> fbStopDocListen;
  ActionDispatcher<dynamic> fbDocListenError;

//  ActionDispatcher<Connection> beginRealTimeDatabaseListen;
//  ActionDispatcher<int> beginRealTimeDatabaseListen; /// rename to begin settingsListen
  ActionDispatcher<int> startSettingsListen;
  ActionDispatcher<int> stopSettingsListen;
//  ActionDispatcher<dynamic> updateError;
//  ActionDispatcher<dynamic> addError; etc.

  ActionDispatcher<FS> subscribe;
  ActionDispatcher<FS> additionalSubscription;


  ActionDispatcher<FSDiary> startDiaryListen;
  ActionDispatcher<FSDiary> stopDiaryListen;
  ActionDispatcher<FoodRecord> diaryReceived;



  // String userID
//  ActionDispatcher<String> settingsListen;
//  ActionDispatcher<dynamic> settingsReceived;
//  ActionDispatcher<String> settingsStopListen;
}



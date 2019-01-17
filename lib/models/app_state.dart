library app_state;

//import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() => new _$AppState._(
    user: null, // TODO: make sure it's persisted
    loading: false,
    subscriptions: new BuiltMap(), // <Connection, List<int>>
    widgets: new BuiltList(),
    activePage: Page.track,
    defaultPage: Page.track, // TODO: read from settings object
    bottomNavigation: [Page.diary, Page.track, Page.diet, Page.cycle, Page.settings],
    bottomNavigationPage: Page.diary,
  );

  AppState._();

  // Firebase
  @nullable
  FirebaseUser get user;
  bool get loading; // TODO: remove

//  Map<Connection, List<int>> get subscriptions;
  BuiltMap<Connection, List<int>> get subscriptions;
  BuiltList<int> get widgets;
  
  // Navigation
  Page get activePage;
  Page get defaultPage;

  // Bottom navigation
  List<Page> get bottomNavigation;
  Page get bottomNavigationPage;
}

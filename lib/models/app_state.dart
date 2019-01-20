library app_state;

//import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/connections.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
//  factory AppState([updates(AppStateBuilder b)]) = _$AppState; // without default values!
  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b) => b /// this syntax is better!
///    ..widgets = ListBuilder<int>([]) /// COMPLETELY OPTIONAL!!!
//    ..diaryRecords = ListBuilder<FoodRecord>([]) /// ListBuilder instead of new BuiltMap
    ..activePage = Page.track
    ..defaultPage = Page.track
    ..bottomNavigation = [Page.diary, Page.track, Page.diet, Page.cycle, Page.settings]
    ..bottomNavigationPage = Page.diary
  );

  AppState._();

  // Firebase
  @nullable
  FirebaseUser get user;

//  BuiltMap<Connection, List<int>> get subscriptions;
  BuiltSetMultimap<Connections, int> get subscriptions;
  BuiltList<int> get widgets;
  BuiltList<FoodRecord> get diaryRecords;

//  @memoized
//  int get calculation;

  // Navigation
  Page get activePage;
  Page get defaultPage;

  // Bottom navigation
  List<Page> get bottomNavigation;
  Page get bottomNavigationPage;
}
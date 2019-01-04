library app_state;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() => new _$AppState._(
      user: null, // TODO: make sure it's persisted
      loading: false,
      activePage: Page.diary,
      defaultPage: Page.track, // TODO: read from settings object
      bottomNavigation: [Page.diary, Page.track, Page.diet, Page.cycle, Page.settings],
      bottomNavigationPage: Page.diary,
  );

  AppState._();

  // Firebase
  @nullable
  FirebaseUser get user;
  bool get loading;

  // Navigation
  Page get activePage;
  Page get defaultPage;

  // Bottom navigation
  List<Page> get bottomNavigation;
  Page get bottomNavigationPage;
}

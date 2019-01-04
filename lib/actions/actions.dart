library actions;

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'actions.g.dart';

abstract class Actions extends ReduxActions {
  factory Actions() => new _$Actions();

  Actions._();

  // Firebase Auth
  ActionDispatcher initApp;
  ActionDispatcher<FirebaseUser> setUser;
  ActionDispatcher<bool> setLoading;
  ActionDispatcher logout;

  // Navigation
  ActionDispatcher<Page> goTo;

  // Bottom navigation
  ActionDispatcher<List<Page>> reorderBottomNavigation;
  ActionDispatcher<Page> setDefaultPage;
}

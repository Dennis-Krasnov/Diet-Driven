library actions;

import 'package:built_redux/built_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:diet_driven/actions/firestore_actions.dart';
import 'package:diet_driven/actions/navigation_actions.dart';
import 'package:diet_driven/actions/user_actions.dart';

export 'package:diet_driven/actions/user_actions.dart';
export 'package:diet_driven/actions/navigation_actions.dart';
export 'package:diet_driven/actions/firestore_actions.dart';

part 'actions.g.dart';

/*
store.actions.ACTION();
ActionsNames.ACTION

store.actions.child.ACTION();
ChildActionsNames.ACTION
 */

/// Top-level actions for Diet Driven
abstract class Actions extends ReduxActions {
  UserActions get user;
  NavigationActions get navigation;
  FirestoreActions get firestore;

  //
  ActionDispatcher initApp;

  //
  ActionDispatcher disposeApp;

  //
  ActionDispatcher<ConnectivityResult> connectivityChanged;

  //
  ActionDispatcher<String> populateWithDefaultSettings;

  // Relatively changes date
  ActionDispatcher<int> changeDaysSinceEpoch;

  // Absolutely changes date
  ActionDispatcher<int> goToDaysSinceEpoch;

  factory Actions() => new _$Actions();
  Actions._();
}

library actions; // TODO: rename as action

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/firestore_actions.dart';
import 'package:diet_driven/actions/navigation_actions.dart';
import 'package:diet_driven/actions/user_actions.dart';
import 'package:diet_driven/models/food_record.dart';

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

  // TODO: close store
  ActionDispatcher disposeApp;

  //
  ActionDispatcher<Duration> changeDate; // with delta
  ActionDispatcher<DateTime> goToDate; // absolutely

  ActionDispatcher<FoodRecord> diaryRecordReceived; // TODO: move
  ActionDispatcher<BuiltList<FoodRecord>> diaryReceived;

  factory Actions() => new _$Actions();
  Actions._();
}

library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/models/user_state.dart';

export 'package:diet_driven/models/user_state.dart';
export 'package:diet_driven/models/navigation_state.dart';

part 'app_state.g.dart';

/// Top-level app state for Diet Driven
abstract class AppState implements Built<AppState, AppStateBuilder> {
  UserState get user;
  NavigationState get navigation;

  //
  BuiltList<FSDocument> get subscriptions;

  //
  BuiltList<FoodRecord> get diaryRecords;

  // TODO: memoized functions
//  @memoized
//  int get calculation;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
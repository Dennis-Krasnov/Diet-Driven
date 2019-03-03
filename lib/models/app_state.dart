library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/models/user_state.dart';

export 'package:diet_driven/models/user_state.dart';
export 'package:diet_driven/models/navigation_state.dart';

part 'app_state.g.dart';


// TODO: move to helper library (duplicate)
int daysSinceEpoch(DateTime dt) {
  return dt.difference(DateTime.fromMicrosecondsSinceEpoch(0, isUtc: false)).inDays + 1;
}

DateTime dateSinceEpoch(int daysSinceEpoch) {
  return DateTime.fromMillisecondsSinceEpoch(0, isUtc: false).add(Duration(days: daysSinceEpoch));
}

/// Top-level app state for Diet Driven
abstract class AppState implements Built<AppState, AppStateBuilder> {
  UserState get user;
  NavigationState get navigation;

  //
  bool get settingsLoaded;

  //
  bool get remoteConfigLoaded;

  //
  BuiltList<FoodDiaryDay> get foodDiaryDays;

  //
  BuiltList<MealsSnapshot> get mealsSnapshots;

  // Days since epoch
  int get currentDaysSinceEpoch;

  //
  DateTime currentDate() => DateTime.fromMillisecondsSinceEpoch(0, isUtc: false).add(Duration(days: currentDaysSinceEpoch));

//  int get currentDate;
  // TODO: serialize in UTC (required), store timezone

  // TODO: memoized functions
//  @memoized
//  int get calculation;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}

abstract class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  UserStateBuilder user;
  NavigationStateBuilder navigation;

  bool settingsLoaded = false;

  bool remoteConfigLoaded = false;

  ListBuilder<FoodDiaryDay> foodDiaryDays = ListBuilder([]);

  ListBuilder<MealsSnapshot> mealsSnapshots = ListBuilder([MealsSnapshot()]);

  int currentDaysSinceEpoch = daysSinceEpoch(DateTime.now().toLocal());

  factory AppStateBuilder() = _$AppStateBuilder;
  AppStateBuilder._();
}
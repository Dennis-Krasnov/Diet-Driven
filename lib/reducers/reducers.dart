import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/reducers/navigation_reducers.dart';
import 'package:diet_driven/reducers/user_reducers.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger("REDUCER");

/*
..add(ActionsNames.ACTION, (s, a, b) => b.FIELD = s.FIELD + a.payload)
 */

/// Top-level reducer
Reducer<AppState, AppStateBuilder, dynamic> getBaseReducer() =>
  (new ReducerBuilder<AppState, AppStateBuilder>()
    ..combineNested(getNavigationReducer())
    ..combineNested(getUserReducer())

    ..add(FirestoreActionsNames.navigationSettingsReceived, settingsReceived)

    ..add(ActionsNames.changeDaysSinceEpoch, changeDaysSinceEpoch)
    ..add(ActionsNames.goToDaysSinceEpoch, goToDaysSinceEpoch)

    // DIARY // TODO: nest
    ..combineList(new ListReducerBuilder((s) => s.diaryRecords, (b) => b.diaryRecords)
      ..add(FirestoreActionsNames.diaryReceived, diaryReceived)
      ..add(FirestoreActionsNames.diaryRecordReceived, diaryRecordReceived)
    )

    // DIETS // TODO: nest


  ).build();


void changeDaysSinceEpoch(AppState state, Action<int> action, AppStateBuilder builder) {
  log.finer("changing daysSinceEpoch by ${action.payload}");

  builder.currentDaysSinceEpoch = state.currentDaysSinceEpoch + action.payload;

  log.fine("daysSinceEpoch is now ${builder.currentDaysSinceEpoch}");
}

void goToDaysSinceEpoch(AppState state, Action<int> action, AppStateBuilder builder) {
  builder.currentDaysSinceEpoch = action.payload;

  log.fine("daysSinceEpoch is now ${action.payload}");
}

void settingsReceived(AppState state, Action<NavigationState> action, AppStateBuilder builder) {
  log.fine("setttings received: ${action.payload}");
  builder.settingsLoaded = true;
  // what does replace do?
  builder.navigation.update((b) => b
    ..bottomNavigation = action.payload.bottomNavigation
    ..defaultPage = action.payload.defaultPage
//    ..activePage =  can't do this because editing from settings page
  );

  // First load into app
  if (state.navigation.activePage == null) {
    log.fine("going to default page ${action.payload.defaultPage}");
    builder.navigation.update((b) => b
      ..bottomNavigationPage = action.payload.defaultPage
      ..activePage = action.payload.defaultPage
    );
  }

  log.fine("settingsLoaded is now true");
}

void diaryReceived(BuiltList<FoodRecord> listState, Action<BuiltList<FoodRecord>> action, ListBuilder<FoodRecord> listBuilder) {
  log.fine("${action.payload.length} diary records received.");
  listBuilder.clear();
  listBuilder.addAll(action.payload);
}

void diaryRecordReceived(BuiltList<FoodRecord> listState, Action<FoodRecord> action, ListBuilder<FoodRecord> listBuilder) {
  log.fine("diary record received: ${action.payload} (does nothing atm)");
  // TODO: store a 'current food record' in state, convert this to normal reducer
}

//void settingsReceived(AppState state, Action<dynamic> action, AppStateBuilder builder) {
//  print("SETTINGS RECERIVED!!!");
//  print(action.payload);
//  serializers.deserialize(json.decode("{\"test\": 234}"));
//}


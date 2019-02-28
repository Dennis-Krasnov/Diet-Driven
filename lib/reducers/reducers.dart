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

    ..add(ActionsNames.changeDaysSinceEpoch, changeDaysSinceEpoch)
    ..add(ActionsNames.goToDaysSinceEpoch, goToDaysSinceEpoch)

    // Diary // TODO: nest
    ..combineList(new ListReducerBuilder((s) => s.diaryRecords, (b) => b.diaryRecords)
        ..add(ActionsNames.diaryReceived, diaryReceived)
        ..add(ActionsNames.diaryRecordReceived, diaryRecordReceived)
    )

    // Diets // TODO: nest


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

void diaryReceived(BuiltList<FoodRecord> listState, Action<BuiltList<FoodRecord>> action, ListBuilder<FoodRecord> listBuilder) {
  log.fine("${action.payload.length} diary records received.");
  listBuilder.clear();
  listBuilder.addAll(action.payload);
}

void diaryRecordReceived(BuiltList<FoodRecord> listState, Action<FoodRecord> action, ListBuilder<FoodRecord> listBuilder) {
  log.fine("diary record received: ${action.payload} (does nothing atm)");
  // TODO: store a 'current food record' in state, convert this to normal reducer
}

void settingsReceived(AppState state, Action<dynamic> action, AppStateBuilder builder) {
  print("SETTINGS RECERIVED!!!");
  print(action.payload);
  serializers.deserialize(json.decode("{\"test\": 234}"));
}


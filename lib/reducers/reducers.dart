import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/reducers/navigation_reducers.dart';
import 'package:diet_driven/reducers/user_reducers.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
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

    // Loading ...
    ..add(FirestoreActionsNames.navigationSettingsReceived, settingsReceived)
    ..add(FirestoreActionsNames.remoteConfigReceived, remoteConfigReceived)

    // ...
    ..add(ActionsNames.changeDaysSinceEpoch, changeDaysSinceEpoch)
    ..add(ActionsNames.goToDaysSinceEpoch, goToDaysSinceEpoch)

    // DIARY // TODO: nest
    ..combineList(new ListReducerBuilder((s) => s.foodDiaryDays, (b) => b.foodDiaryDays)
      ..add(FirestoreActionsNames.foodDiaryReceived, foodDiaryReceived)
//      ..add(FirestoreActionsNames.diaryRecordReceived, diaryRecordReceived)
    )

    // DIETS // TODO: nest


  ).build();

///
void remoteConfigReceived(AppState state, Action<RemoteConfig> action, AppStateBuilder builder) {
  if (action.payload != null) {
    log.fine("successfully loaded remote config data");
    int bonus = action.payload.getInt("bonus");
    log.shout("BONUS IS $bonus");
//    builder.
  }

  builder.remoteConfigLoaded =  true;
  log.fine("remoteConfigLoaded is now true");
}

///
void settingsReceived(AppState state, Action<NavigationState> action, AppStateBuilder builder) {
  log.fine("setttings received: ${action.payload}");

  // ...
  builder.navigation.update((b) => b
    ..bottomNavigation = action.payload.bottomNavigation
    ..defaultPage = action.payload.defaultPage
  );

  // First load into app
  // TODO: call firebase analytics from middleware!
  if (state.navigation.activePage == null) {
    log.fine("going to default page ${action.payload.defaultPage}");
    builder.navigation.update((b) => b
      ..bottomNavigationPage = action.payload.defaultPage
      ..activePage = action.payload.defaultPage
    );
  }

  builder.settingsLoaded = true;
  log.fine("settingsLoaded is now true");
}

///
void changeDaysSinceEpoch(AppState state, Action<int> action, AppStateBuilder builder) {
  log.finer("changing daysSinceEpoch by ${action.payload}");

  builder.currentDaysSinceEpoch = state.currentDaysSinceEpoch + action.payload;

  log.fine("daysSinceEpoch is now ${builder.currentDaysSinceEpoch}");
}

///
void goToDaysSinceEpoch(AppState state, Action<int> action, AppStateBuilder builder) {
  builder.currentDaysSinceEpoch = action.payload;

  log.fine("daysSinceEpoch is now ${action.payload}");
}

///
void foodDiaryReceived(BuiltList<FoodDiaryDay> listState, Action<BuiltList<FoodDiaryDay>> action, ListBuilder<FoodDiaryDay> listBuilder) {
  log.fine("${action.payload.length} food diary days received with ${action.payload.fold(0, (prev, element) => prev + element.foodRecords.length)} food records in totoal.");
  listBuilder.clear(); // TODO: instead keep map {daysSinceEpoch: FoodDiaryDay}, simply override the key, if looking at data past last month/year - simply do a fetch request! - populates only that day / days around it - diary page logic becomes much easier (no more singlewhere)
  // Giving each food record an unique ID TODO: do through cloud function?
  listBuilder.addAll(BuiltList.from(action.payload.map((day) => day.rebuild((b) => b
    ..foodRecords = BuiltList.from(b.foodRecords.map((fr) => fr.rebuild((b) => b
      ..id = "${day.id}-${day.foodRecords.indexOf(fr)}"
    )))
  ))));
}

///
//void diaryRecordReceived(BuiltList<FoodRecord> listState, Action<FoodRecord> action, ListBuilder<FoodRecord> listBuilder) {
//  log.fine("diary record received: ${action.payload} (does nothing atm)");
//  // TODO: store a 'current food record' in state, convert this to normal reducer
//}
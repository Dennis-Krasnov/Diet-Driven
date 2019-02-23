import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/built_realtime/serializers.dart';
import 'package:diet_driven/reducers/navigation_reducers.dart';
import 'package:diet_driven/reducers/user_reducers.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger("REDUCER");

/// Top-level reducer
Reducer<AppState, AppStateBuilder, dynamic> getBaseReducer() =>
  (new ReducerBuilder<AppState, AppStateBuilder>()
    ..combineNested(getNavigationReducer())
    ..combineNested(getUserReducer())

    ..add(ActionsNames.changeDate, (s, a, b) => b.currentDate = s.currentDate.add(a.payload))
    ..add(ActionsNames.goToDate, (s, a, b) => b.currentDate = a.payload)

    ..add(FirestoreActionsNames.additionalSubscription, additionalSubscription)

    ..combineSetMultimap(new SetMultimapReducerBuilder((s) => s.subscriptions, (b) => b.subscriptions)
        ..add(FirestoreActionsNames.subscribe, firstSubscription)
      ..add(FirestoreActionsNames.unsubscribe, unsubscribe)
      ..add(FirestoreActionsNames.unsubscribeAll, unsubscribeAll)
    )

    ..combineList(new ListReducerBuilder((s) => s.diaryRecords, (b) => b.diaryRecords)
        ..add(ActionsNames.diaryReceived, diaryReceived)
        ..add(ActionsNames.diaryRecordReceived, diaryRecordReceived)
    )
  ).build();

void unsubscribeAll(BuiltSetMultimap<FS, int> setMultimapState, Action<FS> action, SetMultimapBuilder<FS, int> setMultimapBuilder) {
  setMultimapBuilder.removeAll(action.payload);
}

void unsubscribe(BuiltSetMultimap<FS, int> setMultimapState, Action<FSPath> action, SetMultimapBuilder<FS, int> setMultimapBuilder) {
  setMultimapBuilder.removeAll(action.payload.firestore); // FIXME
//  for (var val in action.payload.subscriptions) {
//    setMultimapBuilder.remove(action.payload.firestore, val);
//  }
}

//void firstSubscription(BuiltList<FS> listState, Action<FS> action, ListBuilder<FS> listBuilder) {
void firstSubscription(BuiltSetMultimap<FS, int> setMultimapState, Action<FSPath> action, SetMultimapBuilder<FS, int> setMultimapBuilder) {
  log.fine("first subscription: ${action.payload}");
  setMultimapBuilder.addValues(action.payload.firestore, action.payload.subscriptions);
  log.finer(setMultimapBuilder.build());
}

//void additionalSubscription(BuiltList<FS> listState, Action<FS> action, ListBuilder<FS> listBuilder) {
void additionalSubscription(AppState state, Action<FSPath> action, AppStateBuilder builder) {
  log.fine("additional subscription");
  var fs = action.payload;
  print(builder.subscriptions);
}

void diaryReceived(BuiltList<FoodRecord> listState, Action<BuiltList<FoodRecord>> action, ListBuilder<FoodRecord> listBuilder) {
  log.fine("diary received: ${action.payload}");
  listBuilder.clear();
//  listBuilder = action.payload.toBuilder();
  listBuilder.addAll(action.payload);
//  listBuilder.add(action.payload);
}

void diaryRecordReceived(BuiltList<FoodRecord> listState, Action<FoodRecord> action, ListBuilder<FoodRecord> listBuilder) {
  log.fine("diary record received: ${action.payload}");
  listBuilder.clear();
  listBuilder.add(action.payload);
}

void settingsReceived(AppState state, Action<dynamic> action, AppStateBuilder builder) {
  print("SETTINGS RECERIVED!!!");
  print(action.payload);
  serializers.deserialize(json.decode("{\"test\": 234}"));
}


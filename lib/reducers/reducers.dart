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
//      ..add(ActionsNames.anonymousUserLoaded, anonymousUserLoaded)
//      ..add(ActionsNames.anonymousUserFail, anonymousUserFail)



//      ..add(ActionsNames.settingsReceived, settingsReceived)
//      ..add(ActionsNames.startSettingsListen, startListen)
//      ..add(ActionsNames.stopSettingsListen, stopListen)
      
//      ..combineMap(new MapReducerBuilder((AppState state) => state.subscriptions, (AppStateBuilder stateBuilder) => stateBuilder.subscriptions)) // FIXME
///      ..combineMap(new MapReducerBuilder<AppState, AppStateBuilder, Connection, List<int>>((s) => s.subscriptions, (b) => b.subscriptions)
//      ..combineMap(new MapReducerBuilder((AppState state) => state.subscriptions, (AppStateBuilder stateBuilder) => stateBuilder.subscriptions)
//        ..add(ActionsNames.startSettingsListen, (BuiltMap<Connection, List<int>> a, Action<int> b, MapBuilder<Connection, List<int>> c) => stopListen)
        ///..add(ActionsNames.startSettingsListen, startListen)
//        ..add(ActionsNames.startSettingsListen, testListen)
//        ..add(ActionsNames.stopSettingsListen, stopListen)
///      )

//      ..combineSetMultimap(new SetMultimapReducerBuilder((s) => s.subscriptions, (b) => b.subscriptions)
//          ..add(ActionsNames.startDiaryListen, startDiaryListen)
//          ..add(ActionsNames.stopDiaryListen, stopDiaryListen)
//      )


//      ..combineNested(new NestedReducerBuilder((s) => s.subscriptions.))

      ..add(FirestoreActionsNames.additionalSubscription, additionalSubscription)
      ..combineList(new ListReducerBuilder((s) => s.subscriptions, (b) => b.subscriptions)
          ..add(FirestoreActionsNames.subscribe, firstSubscription)
//          ..add(ActionsNames.additionalSubscription, additionalSubscription) // TODO: in seperate reducer!
      )

      ..combineList(new ListReducerBuilder((s) => s.subscriptions, (b) => b.subscriptions)
//          ..add(ActionsNames.startDiaryListen, startDiaryListen)
          ..add(FirestoreActionsNames.unsubscribe, stopDiaryListen)
      )

      ..combineList(new ListReducerBuilder((s) => s.diaryRecords, (b) => b.diaryRecords)
//        ..add(ActionsNames.startDiaryListen, startDiaryListen)
//        ..add(ActionsNames.stopDiaryListen, stopDiaryListen)
          ..add(ActionsNames.diaryReceived, diaryReceived)
      )

//      ..combineList(new ListReducerBuilder((s) => s.widgets, (b) => b.widgets)
//          ..add(ActionsNames.startDiaryListen, diaryListen)
//          ..add(ActionsNames.stopDiaryListen, diaryStop)
//      )
//      ..combineMap(new MapReducerBuilder<AppState, AppStateBuilder>())
  ).build();

//new ListReducerBuilder








//void startDiaryListen(BuiltSetMultimap<FirestoreDocument, int> setMultimapState, Action<int> action, SetMultimapBuilder<FirestoreDocument, int> setMultimapBuilder) {

//void startDiaryListen(BuiltSetMultimap<FSDocument, int> setMultimapState, Action<FSDiary> action, SetMultimapBuilder<FSDocument, int> setMultimapBuilder) {
//void startDiaryListen(BuiltList<FS> listState, Action<FSDiary> action, ListBuilder<FS> listBuilder) {
//  print("LISTENING TO DIARY");
//  var temp = action.payload;
////  temp.rebuild((b) => b..sub = temp.subscribe());
//
//  setMultimapBuilder.add(temp, 124);
//
////  setMultimapBuilder.add(Connections.diary, action.payload);
////  var diary = new FSDiary((b) => b..userId = "0WjbQ1XzVCe1zvwHgE4aluu4FiC3" ..diaryRecordId = "424222");
//  /// var diary = new FSDiary((b) => b..userId = api. ..diaryRecordId = "424222"); -- DO THIS IN EPIC!!
//  //// diary = diary.rebuild((b) => b.sub = diary.snapshotObservable.listen((fr) => print(fr)));
//  ///-- generic reducer only updates subscriptions
//
////  print(diary);
////  print(diary.sub.isPaused);
//
////  setMultimapBuilder.add(diary, action.payload);
//
////  diary.sub = diary.snapshotObservable.listen((fr) => print(fr));
//
////  listBuilder.add(action.payload);
//}

//void stopDiaryListen(BuiltSetMultimap<FSDocument, int> setMultimapState, Action<FSDiary> action, SetMultimapBuilder<FSDocument, int> setMultimapBuilder) {
//void stopDiaryListen(BuiltList<FS> listState, Action<FSDiary> action, ListBuilder<FS> listBuilder) {
//  var temp = action.payload;
////  temp.sub.cancel();
//  setMultimapBuilder.remove(temp, 124);
//
////  var diary = new FSDiary((b) => b..userId = "0WjbQ1XzVCe1zvwHgE4aluu4FiC3" ..diaryRecordId = "424222"); // TODO: create in widget.. it's easier and more portable/dynamic
////  setMultimapState.keys.where((e) => e == diary).first.sub.cancel(); // TODO: don't remove so that an epic can cancel it!
////  setMultimapBuilder.remove(diary, action.payload);
//
//  print("STOP TO DIARY");
////  setMultimapBuilder.remove(Connections.diary, action.payload);
//
////  if (listState.contains(action.payload)) {
////    listBuilder.remove(action.payload);
////  }
//}

//void startDiaryListenTest(AppState state, Action<Page> action, AppStateBuilder builder) {
//
//}

void firstSubscription(BuiltList<FS> listState, Action<FS> action, ListBuilder<FS> listBuilder) {
  listBuilder.add(action.payload);
  print("first");
}

//void additionalSubscription(BuiltList<FS> listState, Action<FS> action, ListBuilder<FS> listBuilder) {
void additionalSubscription(AppState state, Action<FS> action, AppStateBuilder builder) {
  // TODO: logic with duplicates!! - make this a normal reducer!
//  listBuilder.add(action.payload);
  var fs = action.payload;
  print("APPENDING LISTENERS: ${fs.listeners}");
  int i = state.subscriptions.indexOf(action.payload);

//  builder.subscriptions[i].listeners.rebuild((b) => b..add(24));

//  builder.subscriptions[i].listeners = builder.subscriptions[i].listeners.rebuild((b) => b);
//  builder.subscriptions[i].listeners.rebuild((b) => b.add(24421));
/// problem: list is FS!!!! need it to be FSDocument! ---- but does it solve it!?!?!
  ///
  print(builder.subscriptions);
  print(builder.subscriptions[i].listeners);
  builder.subscriptions[i] = builder.subscriptions[i].rebuild((b) => b
//      ..listeners = ListBuilder([1, 2, 4])
//      ..listeners.clear()
//    ..listeners = b.listeners.add(42)



//    b.listeners.build()
  /// THESE ALL WORK!!! (IN COMBINATION WITH ADDING ANOTHER ELEMENT)
//     .listeners.add(4252)
//    ..listeners.update((b) => b..add(424)) // WHY DOESN'T THIS WORK
//    ..listeners.add(43)
//      b[i] =

  // doesn't work
//  ..listeners = builder.subscriptions[i].listeners.rebuild((b) => b
//      ..add(42)
//  ).toBuilder()

  // ALSO DOESN'T WORK
//  ..listeners = state.subscriptions[i].listeners.rebuild((b) => b..add(4)).toBuilder()

  /// THIS WORKS !!!
//    ..path = (b.path as DiaryRecordPath).rebuild((b) => b
//        ..diaryRecordId = "124214"
//    )
  );

  /// ADDING THIS FIXED IT!!!
//  builder.subscriptions.add(FSDocument<FoodRecord>((b) => b..path = DiaryRecordPath((b) => b..userId = "a" ..diaryRecordId = "b") ));

  // this doesn't fix it!
//  builder.subscriptions.update((b) => b);
//  builder.subscriptions.build();

  /// THIS DOESN'T WORK!!!!
//  builder.subscriptions[i].rebuild((b) => b
//    ..path = (b.path as DiaryRecordPath).rebuild((b) => b
//        ..diaryRecordId = "124214"
//    )
//  );

  // DOESN'T WORK
//  builder.subscriptions[i].listeners.rebuild((b) => b.add(42));
//  builder.subscriptions[i].listeners = builder.subscriptions[i].listeners.rebuild((b) => b.add(42));

  print(builder.subscriptions);
  print(builder.subscriptions[i].listeners);
  print(builder.subscriptions[i].runtimeType);
  print(builder.subscriptions[i] is FSDocument<FoodRecord>);

  // FIXME: why can't i get this to work...?
//  builder.subscriptions[state.subscriptions.indexOf(action.payload)].listeners.rebuild((b) => b..addAll(action.payload.listeners));
//  builder.subscriptions[state.subscriptions.indexOf(action.payload)].listeners = BuiltList<int>([1, 2, 3, 4]);
//  builder.subscriptions[state.subscriptions.indexOf(action.payload)].listeners.rebuild((b) => b.clear());
//  builder.subscriptions.clear(); // this works
//  builder.subscriptions.update((b) => b[state.subscriptions.indexOf(action.payload)].listeners.rebuild((b) => b.clear()));
//  builder.subscriptions.update((b) => b[state.subscriptions.indexOf(action.payload)]..listeners.rebuild((b) => b.clear()));
//  builder.subscriptions.update((b) => b[state.subscriptions.indexOf(action.payload)] = new FSDiary((b) => b..userId = "a" ..diaryRecordId = "b")); // THIS WORKS
//  builder.subscriptions.update((b) => b[i] = state.subscriptions[i]); // THIS WORKS
//  builder.subscriptions.update((b) => b[i] = builder.subscriptions[i].listeners.rebuild((b) => b.add(2)));
  print("additional");
}

void startDiaryListen(BuiltList<FS> listState, Action<FS> action, ListBuilder<FS> listBuilder) {
  if (listState.contains(action.payload)) {
    print(action.payload.runtimeType);
    int i = listState.indexOf(action.payload);
    print(listBuilder[i].runtimeType);
//    print(listBuilder[i] is GenericFSDocument);
//    listBuilder[i].listeners = listBuilder[i].listeners.rebuild((b) => BuiltList<int>([]));

//    GenericFSDocument gfs = listBuilder[i] as GenericFSDocument;
//    gfs.rebuild((b) => b..listeners.addAll(action.payload.listeners));
//    gfs.rebuild((b) => b..listeners.addAll(action.payload.listeners));

//    gfs.listeners = listState[listState.indexOf(action.payload)].listeners.rebuild((b) => b.addAll(action.payload.listeners));
//    startDiaryListenTest(listState, action, listBuilder);

//    listBuilder[listState.indexOf(action.payload)] = (listState[listState.indexOf(action.payload)] as Built).rebuild((b) => b..listeners = action.payload.listeners) as FS;
//    ((listState[listState.indexOf(action.payload)] as Built) as FS)
//    ((listState[listState.indexOf(action.payload)] as FS) as Built).


//    listBuilder[listState.indexOf(action.payload)].listeners = listState[listState.indexOf(action.payload)].listeners.rebuild((b) => b.addAll(action.payload.listeners));
//    int i = listState.indexOf(action.payload);
//    FS t = listState[i];
//    listBuilder[i].listeners = t.listeners;
  /// FIXME: doesn't update the listeners - use nested reducers?!!?
    print("appended listeners");
  }
  else {
//    if (action.payload.streamSubscription != null) {
      listBuilder.add(action.payload);
      print("ok added");
//    } else {
//      print("nooope");
//    }
  }
}

void stopDiaryListen(BuiltList<FS> listState, Action<FS> action, ListBuilder<FS> listBuilder) {
  if (listState.contains(action.payload)) {
    listBuilder.remove(action.payload);
//    listBuilder[listState.indexOf(action.payload)].listeners.rebuild((b) => b.addAll(action.payload.listeners));
//    print("appended listeners");
    print("removed");
  }
//  else {
////    if (action.payload.streamSubscription != null) {
//      listBuilder.add(action.payload);
//      print("ok added");
////    } else {
////      print("nooope");
////    }
//  }
}


void diaryReceived(BuiltList<FoodRecord> listState, Action<FoodRecord> action, ListBuilder<FoodRecord> listBuilder) {
  print("RECEIVED ${action.payload}");
  listBuilder.clear();
  listBuilder.add(action.payload);
}

//void diaryListen(BuiltList<int> listState, Action<int> action, ListBuilder<int> listBuilder) {
//  print("LISTENING TO DIARY");
//  listBuilder.add(action.payload);
//}
//
//void diaryStop(BuiltList<int> listState, Action<int> action, ListBuilder<int> listBuilder) {
//  print("STOP TO DIARY");
//  if (listState.contains(action.payload)) {
//    listBuilder.remove(action.payload);
//  }
//}

/////////////////////////////////

//void testListen(BuiltMap<Connection<dynamic>, List<int>> s, Action<int> a, MapBuilder<Connection<dynamic>, List<int>> b) => b[new UserInfoListener.fromId("billy")] = [2];
// (BuiltMap<Connection, List<int>> mapState, Action<int> action, MapBuilder<Connection, List<int>> mapBuilder) =>
//void testListen(BuiltMap<Connection<dynamic>, List<int>> s, Action<int> a, MapBuilder<Connection<dynamic>, List<int>> b) => b[new UserInfoListener.fromId("billy")] = s[new UserInfoListener.fromId("billy")].shuffle();
//void testListen(BuiltMap<Connection<dynamic>, List<int>> s, Action<int> a, MapBuilder<Connection<dynamic>, List<int>> b) {
//  var u = new UserInfoListener.fromId("billy"); // TODO: can't access state...
//  if (s.containsKey(u)) {
//    print("CONTAINS: ${s[u]}");
//    b[u] = s[u]..add(2);
//  } else {
//    print("NOW [1]");
//    b[u] = [1];
//  }
////  b[new UserInfoListener.fromId("billy")] = s[new UserInfoListener.fromId("billy")] == null ? [1] : b[new UserInfoListener.fromId("billy")]..addAll([1]);
//}
////void stopListen(BuiltMap<Connection<dynamic>, List<int>> s, Action<int> a, MapBuilder<Connection<dynamic>, List<int>> b) => b = new BuiltMap<Connection<dynamic>, List<int>>().toBuilder();
//void stopListen(BuiltMap<Connection<dynamic>, List<int>> s, Action<int> a, MapBuilder<Connection<dynamic>, List<int>> b) => b.clear();
//
//void startListen(BuiltMap<Connection, List<int>> mapState, Action<int> action, MapBuilder<Connection, List<int>> mapBuilder) =>
//  (AppState state, Action<int> action, AppStateBuilder builder) {
////    print("BUILT MAP: $mapState");
//    print("ACTION: $action");
////    print("MAPBUILDER: $mapBuilder");
//    print("APPSTATE: $state");
////    mapBuilder
//};


//(BuiltMap<Connection<dynamic>, List<int>>, Action<int>, MapBuilder<Connection<dynamic>, List<int>>) → void) → void
//void startListen(Connection<dynamic> a, List<int>> b, Action<int> c, MapBuilder<Connection<dynamic> d, List<int>> e) {
/// void startListen(AppState state, Action<int> action, AppStateBuilder builder) {
  ///print(state.subscriptions.containsKey(new UserInfoListener.fromId(state.user.uid)));

//  if (state.subscriptions.isNotEmpty) {
//    builder.subscriptions = {new UserInfoListener.fromId(state.user.uid): [state.subscriptions.values.toList()[0][0] + 1]};
//  }
//  else {
//    builder.subscriptions = {new UserInfoListener.fromId(state.user.uid): [0]};
//  }

  ///var u = new UserInfoListener.fromId(state.user.uid);
  ///if (state.subscriptions.containsKey(new UserInfoListener.fromId(state.user.uid))) {
  ///  builder.subscriptions = {u: List.generate(state.subscriptions[u].length + 1, (i) => i)};
  ///} else {
  ///  builder.subscriptions = {u: [action.payload]};
  ///}
//  builder.subscriptions[action.payload] = [1];
//  builder.subscriptions =
//    builder.subscriptions.addAll({new UserInfoListener.fromId(state.user.uid): [action.payload]});

//}

///void stopListen(AppState state, Action<int> action, AppStateBuilder builder) {
//  print("STOP LISTEN");
//  builder.subscriptions[action.payload] = [1];
//  builder.subscriptions = {new UserInfoListener.fromId(state.user.uid): [action.payload]};
//  builder.subscriptions = {};
//}


void settingsReceived(AppState state, Action<dynamic> action, AppStateBuilder builder) {
  print("SETTINGS RECERIVED!!!");
  print(action.payload);
  serializers.deserialize(json.decode("{\"test\": 234}"));
}


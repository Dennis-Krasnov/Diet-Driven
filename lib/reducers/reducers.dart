import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/connections.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/serializers.dart';
import 'package:firebase_auth/firebase_auth.dart';

ReducerBuilder<AppState, AppStateBuilder> reducerBuilder =
    new ReducerBuilder<AppState, AppStateBuilder>()
//      ..add(CounterActionsNames.increment, (s, a, b) => b.count++);
      ..add(ActionsNames.anonymousUserLoaded, anonymousUserLoaded)
      ..add(ActionsNames.anonymousUserFail, anonymousUserFail)
      ..add(ActionsNames.goTo, goTo)
      ..add(ActionsNames.reorderBottomNavigation, reorderBottomNav)
      ..add(ActionsNames.setDefaultPage, setDefaultPage)


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

      ..combineSetMultimap(new SetMultimapReducerBuilder((s) => s.subscriptions, (b) => b.subscriptions)
          ..add(ActionsNames.startDiaryListen, startDiaryListen)
          ..add(ActionsNames.stopDiaryListen, stopDiaryListen)
      )

//      ..combineList(new ListReducerBuilder((s) => s.widgets, (b) => b.widgets)
//          ..add(ActionsNames.startDiaryListen, diaryListen)
//          ..add(ActionsNames.stopDiaryListen, diaryStop)
//      )
//      ..combineMap(new MapReducerBuilder<AppState, AppStateBuilder>())
;

//new ListReducerBuilder


void anonymousUserLoaded(AppState state, Action<FirebaseUser> action, AppStateBuilder builder) {
  builder.user = action.payload;
  print("anonymous ${action.payload.email ?? action.payload.uid} user was loaded");
}

void anonymousUserFail(AppState state, Action<dynamic> action, AppStateBuilder builder) {
  print(action.payload);
}

void goTo(AppState state, Action<Page> action, AppStateBuilder builder) {
  builder.activePage = action.payload;

  if (state.bottomNavigation.contains(action.payload)) {
    builder.bottomNavigationPage = action.payload;
  }
}


void reorderBottomNav(AppState state, Action<List<Page>> action, AppStateBuilder builder) {
  bool properSize = 2 <= action.payload.length && action.payload.length <= 7;
  bool unique = action.payload.length == action.payload.toSet().length;

  if (properSize && unique) {
    builder.bottomNavigation = action.payload;

    // Active page now in bottom navigation
    if (action.payload.contains(state.activePage)) {
      builder.bottomNavigationPage = state.activePage;
    } // Active page no longer in bottom navigation
    else {
      builder.bottomNavigationPage = action.payload[0];
    }

    // Default page no longer in bottom navigation
    if (!action.payload.contains(state.defaultPage)) {
      builder.defaultPage = action.payload[0];
    }
  }
}

void setDefaultPage(AppState state, Action<Page> action, AppStateBuilder builder) {
  if (state.bottomNavigation.contains(action.payload)) {
    builder.defaultPage = action.payload;
  }
}


void startDiaryListen(BuiltSetMultimap<Connections, int> setMultimapState, Action<int> action, SetMultimapBuilder<Connections, int> setMultimapBuilder) {
  print("LISTENING TO DIARY");
  setMultimapBuilder.add(Connections.diary, action.payload);
//  listBuilder.add(action.payload);
}

void stopDiaryListen(BuiltSetMultimap<Connections, int> setMultimapState, Action<int> action, SetMultimapBuilder<Connections, int> setMultimapBuilder) {
  print("STOP TO DIARY");
  setMultimapBuilder.remove(Connections.diary, action.payload);
//  if (listState.contains(action.payload)) {
//    listBuilder.remove(action.payload);
//  }
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


library firestore_actions;

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/models/user_state.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
part 'firestore_actions.g.dart';

///
abstract class FirestoreActions extends ReduxActions {
  // DIARY

  // optional userId (can't do due to custom ids)
//  ActionDispatcher<FSDynamicTuple<FoodDiaryDay>> saveFoodDiaryDay;

  // optional userId
//  ActionDispatcher<FSTuple<FoodDiaryDay>> updateFoodDiaryDay;
  ActionDispatcher<FoodDiaryDay> updateFoodDiaryDay;

  // optional userId
  ActionDispatcher<FoodDiaryDay> deleteFoodDiaryDay;

  //
//  ActionDispatcher<FoodRecord> diaryRecordReceived; // FIXME

  //
  ActionDispatcher<BuiltList<FoodDiaryDay>> foodDiaryReceived;


  // SETTINGS

  //
  ActionDispatcher<UserState> userDataReceived;

  //
  ActionDispatcher<RemoteConfig> remoteConfigReceived;

  //
  ActionDispatcher<BuiltList<SettingsDocument>> settingsReceived;

  // optional userId
  ActionDispatcher<FSTuple<NavigationState>> updateNavigationState;


  factory FirestoreActions() => new _$FirestoreActions();
  FirestoreActions._();
}
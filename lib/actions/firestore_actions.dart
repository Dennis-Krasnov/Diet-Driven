library firestore_actions;

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/models/navigation_state.dart';
import 'package:diet_driven/util/built_firestore.dart';
part 'firestore_actions.g.dart';

///
abstract class FirestoreActions extends ReduxActions {
  // DIARY

  // optional userId, doesn't require foodRecordId
  ActionDispatcher<FSDynamicTuple<FoodRecord>> saveFoodRecord;

  // optional userId
  ActionDispatcher<FSTuple<FoodRecord>> updateFoodRecord;

  // optional userId
  ActionDispatcher<FoodRecordDocument> deleteFoodRecord;

  //
  ActionDispatcher<FoodRecord> diaryRecordReceived;

  //
  ActionDispatcher<BuiltList<FoodRecord>> diaryReceived;

  // SETTINGS TODO: listen to entire collection!
  // optional userId, doesn't require foodRecordId
//  ActionDispatcher<FSTuple<NavigationState>> saveNavigationState;

  // optional userId
  ActionDispatcher<FSTuple<NavigationState>> updateNavigationState;

  // optional userId
//  ActionDispatcher<FoodRecordDocument> deleteFoodRecord;

  //
  ActionDispatcher<NavigationState> navigationSettingsReceived;

  //
//  ActionDispatcher<BuiltList<FoodRecord>> diaryReceived;


  factory FirestoreActions() => new _$FirestoreActions();
  FirestoreActions._();
}
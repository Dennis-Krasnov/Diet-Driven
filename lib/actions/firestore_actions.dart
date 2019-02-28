library firestore_actions;

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
part 'firestore_actions.g.dart';

///
abstract class FirestoreActions extends ReduxActions {
  // optional userId, doesn't require foodRecordId
  ActionDispatcher<FSTuple<FoodRecord>> saveFoodRecord;

  // optional userId
  ActionDispatcher<FSTuple<FoodRecord>> updateFoodRecord;

  //
  ActionDispatcher<FoodRecord> diaryRecordReceived;

  //
  ActionDispatcher<BuiltList<FoodRecord>> diaryReceived;


  factory FirestoreActions() => new _$FirestoreActions();
  FirestoreActions._();
}
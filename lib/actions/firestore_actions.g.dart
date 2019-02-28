// GENERATED CODE - DO NOT MODIFY BY HAND

part of firestore_actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$FirestoreActions extends FirestoreActions {
  factory _$FirestoreActions() => new _$FirestoreActions._();
  _$FirestoreActions._() : super._();

  final ActionDispatcher<FSTuple<FoodRecord>> saveFoodRecord =
      new ActionDispatcher<FSTuple<FoodRecord>>(
          'FirestoreActions-saveFoodRecord');
  final ActionDispatcher<FSTuple<FoodRecord>> updateFoodRecord =
      new ActionDispatcher<FSTuple<FoodRecord>>(
          'FirestoreActions-updateFoodRecord');
  final ActionDispatcher<FoodRecord> diaryRecordReceived =
      new ActionDispatcher<FoodRecord>('FirestoreActions-diaryRecordReceived');
  final ActionDispatcher<BuiltList<FoodRecord>> diaryReceived =
      new ActionDispatcher<BuiltList<FoodRecord>>(
          'FirestoreActions-diaryReceived');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    saveFoodRecord.setDispatcher(dispatcher);
    updateFoodRecord.setDispatcher(dispatcher);
    diaryRecordReceived.setDispatcher(dispatcher);
    diaryReceived.setDispatcher(dispatcher);
  }
}

class FirestoreActionsNames {
  static final ActionName<FSTuple<FoodRecord>> saveFoodRecord =
      new ActionName<FSTuple<FoodRecord>>('FirestoreActions-saveFoodRecord');
  static final ActionName<FSTuple<FoodRecord>> updateFoodRecord =
      new ActionName<FSTuple<FoodRecord>>('FirestoreActions-updateFoodRecord');
  static final ActionName<FoodRecord> diaryRecordReceived =
      new ActionName<FoodRecord>('FirestoreActions-diaryRecordReceived');
  static final ActionName<BuiltList<FoodRecord>> diaryReceived =
      new ActionName<BuiltList<FoodRecord>>('FirestoreActions-diaryReceived');
}

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

  final ActionDispatcher<FSDynamicTuple<FoodRecord>> saveFoodRecord =
      new ActionDispatcher<FSDynamicTuple<FoodRecord>>(
          'FirestoreActions-saveFoodRecord');
  final ActionDispatcher<FSTuple<FoodRecord>> updateFoodRecord =
      new ActionDispatcher<FSTuple<FoodRecord>>(
          'FirestoreActions-updateFoodRecord');
  final ActionDispatcher<FoodRecordDocument> deleteFoodRecord =
      new ActionDispatcher<FoodRecordDocument>(
          'FirestoreActions-deleteFoodRecord');
  final ActionDispatcher<FoodRecord> diaryRecordReceived =
      new ActionDispatcher<FoodRecord>('FirestoreActions-diaryRecordReceived');
  final ActionDispatcher<BuiltList<FoodRecord>> diaryReceived =
      new ActionDispatcher<BuiltList<FoodRecord>>(
          'FirestoreActions-diaryReceived');
  final ActionDispatcher<FSTuple<NavigationState>> updateNavigationState =
      new ActionDispatcher<FSTuple<NavigationState>>(
          'FirestoreActions-updateNavigationState');
  final ActionDispatcher<NavigationState> navigationSettingsReceived =
      new ActionDispatcher<NavigationState>(
          'FirestoreActions-navigationSettingsReceived');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    saveFoodRecord.setDispatcher(dispatcher);
    updateFoodRecord.setDispatcher(dispatcher);
    deleteFoodRecord.setDispatcher(dispatcher);
    diaryRecordReceived.setDispatcher(dispatcher);
    diaryReceived.setDispatcher(dispatcher);
    updateNavigationState.setDispatcher(dispatcher);
    navigationSettingsReceived.setDispatcher(dispatcher);
  }
}

class FirestoreActionsNames {
  static final ActionName<FSDynamicTuple<FoodRecord>> saveFoodRecord =
      new ActionName<FSDynamicTuple<FoodRecord>>(
          'FirestoreActions-saveFoodRecord');
  static final ActionName<FSTuple<FoodRecord>> updateFoodRecord =
      new ActionName<FSTuple<FoodRecord>>('FirestoreActions-updateFoodRecord');
  static final ActionName<FoodRecordDocument> deleteFoodRecord =
      new ActionName<FoodRecordDocument>('FirestoreActions-deleteFoodRecord');
  static final ActionName<FoodRecord> diaryRecordReceived =
      new ActionName<FoodRecord>('FirestoreActions-diaryRecordReceived');
  static final ActionName<BuiltList<FoodRecord>> diaryReceived =
      new ActionName<BuiltList<FoodRecord>>('FirestoreActions-diaryReceived');
  static final ActionName<FSTuple<NavigationState>> updateNavigationState =
      new ActionName<FSTuple<NavigationState>>(
          'FirestoreActions-updateNavigationState');
  static final ActionName<NavigationState> navigationSettingsReceived =
      new ActionName<NavigationState>(
          'FirestoreActions-navigationSettingsReceived');
}

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

  final ActionDispatcher<FoodDiaryDay> updateFoodDiaryDay =
      new ActionDispatcher<FoodDiaryDay>('FirestoreActions-updateFoodDiaryDay');
  final ActionDispatcher<FoodDiaryDay> deleteFoodDiaryDay =
      new ActionDispatcher<FoodDiaryDay>('FirestoreActions-deleteFoodDiaryDay');
  final ActionDispatcher<BuiltList<FoodDiaryDay>> foodDiaryReceived =
      new ActionDispatcher<BuiltList<FoodDiaryDay>>(
          'FirestoreActions-foodDiaryReceived');
  final ActionDispatcher<FSTuple<NavigationState>> updateNavigationState =
      new ActionDispatcher<FSTuple<NavigationState>>(
          'FirestoreActions-updateNavigationState');
  final ActionDispatcher<NavigationState> navigationSettingsReceived =
      new ActionDispatcher<NavigationState>(
          'FirestoreActions-navigationSettingsReceived');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    updateFoodDiaryDay.setDispatcher(dispatcher);
    deleteFoodDiaryDay.setDispatcher(dispatcher);
    foodDiaryReceived.setDispatcher(dispatcher);
    updateNavigationState.setDispatcher(dispatcher);
    navigationSettingsReceived.setDispatcher(dispatcher);
  }
}

class FirestoreActionsNames {
  static final ActionName<FoodDiaryDay> updateFoodDiaryDay =
      new ActionName<FoodDiaryDay>('FirestoreActions-updateFoodDiaryDay');
  static final ActionName<FoodDiaryDay> deleteFoodDiaryDay =
      new ActionName<FoodDiaryDay>('FirestoreActions-deleteFoodDiaryDay');
  static final ActionName<BuiltList<FoodDiaryDay>> foodDiaryReceived =
      new ActionName<BuiltList<FoodDiaryDay>>(
          'FirestoreActions-foodDiaryReceived');
  static final ActionName<FSTuple<NavigationState>> updateNavigationState =
      new ActionName<FSTuple<NavigationState>>(
          'FirestoreActions-updateNavigationState');
  static final ActionName<NavigationState> navigationSettingsReceived =
      new ActionName<NavigationState>(
          'FirestoreActions-navigationSettingsReceived');
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$Actions extends Actions {
  factory _$Actions() => new _$Actions._();
  _$Actions._() : super._();

  final ActionDispatcher<dynamic> initApp =
      new ActionDispatcher<dynamic>('Actions-initApp');
  final ActionDispatcher<dynamic> disposeApp =
      new ActionDispatcher<dynamic>('Actions-disposeApp');
  final ActionDispatcher<Duration> changeDate =
      new ActionDispatcher<Duration>('Actions-changeDate');
  final ActionDispatcher<DateTime> goToDate =
      new ActionDispatcher<DateTime>('Actions-goToDate');
  final ActionDispatcher<FoodRecord> diaryRecordReceived =
      new ActionDispatcher<FoodRecord>('Actions-diaryRecordReceived');
  final ActionDispatcher<BuiltList<FoodRecord>> diaryReceived =
      new ActionDispatcher<BuiltList<FoodRecord>>('Actions-diaryReceived');
  final UserActions user = new UserActions();
  final NavigationActions navigation = new NavigationActions();
  final FirestoreActions firestore = new FirestoreActions();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    initApp.setDispatcher(dispatcher);
    disposeApp.setDispatcher(dispatcher);
    changeDate.setDispatcher(dispatcher);
    goToDate.setDispatcher(dispatcher);
    diaryRecordReceived.setDispatcher(dispatcher);
    diaryReceived.setDispatcher(dispatcher);
    user.setDispatcher(dispatcher);
    navigation.setDispatcher(dispatcher);
    firestore.setDispatcher(dispatcher);
  }
}

class ActionsNames {
  static final ActionName<dynamic> initApp =
      new ActionName<dynamic>('Actions-initApp');
  static final ActionName<dynamic> disposeApp =
      new ActionName<dynamic>('Actions-disposeApp');
  static final ActionName<Duration> changeDate =
      new ActionName<Duration>('Actions-changeDate');
  static final ActionName<DateTime> goToDate =
      new ActionName<DateTime>('Actions-goToDate');
  static final ActionName<FoodRecord> diaryRecordReceived =
      new ActionName<FoodRecord>('Actions-diaryRecordReceived');
  static final ActionName<BuiltList<FoodRecord>> diaryReceived =
      new ActionName<BuiltList<FoodRecord>>('Actions-diaryReceived');
}

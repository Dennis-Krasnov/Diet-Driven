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
  final ActionDispatcher<ConnectivityResult> connectivityChanged =
      new ActionDispatcher<ConnectivityResult>('Actions-connectivityChanged');
  final ActionDispatcher<String> populateWithDefaultSettings =
      new ActionDispatcher<String>('Actions-populateWithDefaultSettings');
  final ActionDispatcher<int> changeDaysSinceEpoch =
      new ActionDispatcher<int>('Actions-changeDaysSinceEpoch');
  final ActionDispatcher<int> goToDaysSinceEpoch =
      new ActionDispatcher<int>('Actions-goToDaysSinceEpoch');
  final UserActions user = new UserActions();
  final NavigationActions navigation = new NavigationActions();
  final FirestoreActions firestore = new FirestoreActions();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    initApp.setDispatcher(dispatcher);
    disposeApp.setDispatcher(dispatcher);
    connectivityChanged.setDispatcher(dispatcher);
    populateWithDefaultSettings.setDispatcher(dispatcher);
    changeDaysSinceEpoch.setDispatcher(dispatcher);
    goToDaysSinceEpoch.setDispatcher(dispatcher);
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
  static final ActionName<ConnectivityResult> connectivityChanged =
      new ActionName<ConnectivityResult>('Actions-connectivityChanged');
  static final ActionName<String> populateWithDefaultSettings =
      new ActionName<String>('Actions-populateWithDefaultSettings');
  static final ActionName<int> changeDaysSinceEpoch =
      new ActionName<int>('Actions-changeDaysSinceEpoch');
  static final ActionName<int> goToDaysSinceEpoch =
      new ActionName<int>('Actions-goToDaysSinceEpoch');
}

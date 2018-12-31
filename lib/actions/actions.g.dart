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

  final ActionDispatcher<Page> updateTab =
      new ActionDispatcher<Page>('Actions-updateTab');
  final ActionDispatcher<bool> setShowBottomNavigation =
      new ActionDispatcher<bool>('Actions-setShowBottomNavigation');
  final ActionDispatcher<List<Page>> reorderBottomNavigation =
      new ActionDispatcher<List<Page>>('Actions-reorderBottomNavigation');
  final ActionDispatcher<dynamic> resetBottomNavigation =
      new ActionDispatcher<dynamic>('Actions-resetBottomNavigation');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    updateTab.setDispatcher(dispatcher);
    setShowBottomNavigation.setDispatcher(dispatcher);
    reorderBottomNavigation.setDispatcher(dispatcher);
    resetBottomNavigation.setDispatcher(dispatcher);
  }
}

class ActionsNames {
  static final ActionName<Page> updateTab =
      new ActionName<Page>('Actions-updateTab');
  static final ActionName<bool> setShowBottomNavigation =
      new ActionName<bool>('Actions-setShowBottomNavigation');
  static final ActionName<List<Page>> reorderBottomNavigation =
      new ActionName<List<Page>>('Actions-reorderBottomNavigation');
  static final ActionName<dynamic> resetBottomNavigation =
      new ActionName<dynamic>('Actions-resetBottomNavigation');
}

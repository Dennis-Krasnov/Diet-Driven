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

  final ActionDispatcher<Page> goTo =
      new ActionDispatcher<Page>('Actions-goTo');
  final ActionDispatcher<List<Page>> reorderBottomNavigation =
      new ActionDispatcher<List<Page>>('Actions-reorderBottomNavigation');
  final ActionDispatcher<Page> setDefaultPage =
      new ActionDispatcher<Page>('Actions-setDefaultPage');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    goTo.setDispatcher(dispatcher);
    reorderBottomNavigation.setDispatcher(dispatcher);
    setDefaultPage.setDispatcher(dispatcher);
  }
}

class ActionsNames {
  static final ActionName<Page> goTo = new ActionName<Page>('Actions-goTo');
  static final ActionName<List<Page>> reorderBottomNavigation =
      new ActionName<List<Page>>('Actions-reorderBottomNavigation');
  static final ActionName<Page> setDefaultPage =
      new ActionName<Page>('Actions-setDefaultPage');
}

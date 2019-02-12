// GENERATED CODE - DO NOT MODIFY BY HAND

part of navigation_actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$NavigationActions extends NavigationActions {
  factory _$NavigationActions() => new _$NavigationActions._();
  _$NavigationActions._() : super._();

  final ActionDispatcher<Page> goTo =
      new ActionDispatcher<Page>('NavigationActions-goTo');
  final ActionDispatcher<List<Page>> reorderBottomNavigation =
      new ActionDispatcher<List<Page>>(
          'NavigationActions-reorderBottomNavigation');
  final ActionDispatcher<Page> setDefaultPage =
      new ActionDispatcher<Page>('NavigationActions-setDefaultPage');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    goTo.setDispatcher(dispatcher);
    reorderBottomNavigation.setDispatcher(dispatcher);
    setDefaultPage.setDispatcher(dispatcher);
  }
}

class NavigationActionsNames {
  static final ActionName<Page> goTo =
      new ActionName<Page>('NavigationActions-goTo');
  static final ActionName<List<Page>> reorderBottomNavigation =
      new ActionName<List<Page>>('NavigationActions-reorderBottomNavigation');
  static final ActionName<Page> setDefaultPage =
      new ActionName<Page>('NavigationActions-setDefaultPage');
}

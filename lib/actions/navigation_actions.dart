library navigation_actions;

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/data/page.dart';

part 'navigation_actions.g.dart';

///
abstract class NavigationActions extends ReduxActions {
  //
  ActionDispatcher<Page> goTo;

  //
  ActionDispatcher<List<Page>> reorderBottomNavigation;

  //
  ActionDispatcher<Page> setDefaultPage;

  factory NavigationActions() => new _$NavigationActions();
  NavigationActions._();
}
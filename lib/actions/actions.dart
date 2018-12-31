library actions;

import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/models/page.dart';

part 'actions.g.dart';

abstract class Actions extends ReduxActions {
  factory Actions() => new _$Actions();

  Actions._();

//  ActionDispatcher<void> get increment;
  // Bottom navigation
  ActionDispatcher<Page> updateTab;
  ActionDispatcher<bool> setShowBottomNavigation;
  ActionDispatcher<List<Page>> reorderBottomNavigation;
  ActionDispatcher resetBottomNavigation;
}

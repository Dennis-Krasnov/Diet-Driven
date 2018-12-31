import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';

ReducerBuilder<AppState, AppStateBuilder> reducerBuilder =
    new ReducerBuilder<AppState, AppStateBuilder>()
//      ..add(CounterActionsNames.increment, (s, a, b) => b.count++);
//      ..add(ActionsNames.increment, increment)
      ..add(ActionsNames.updateTab, updateTab)
      ..add(ActionsNames.setShowBottomNavigation, setBottomNav)
      ..add(ActionsNames.reorderBottomNavigation, reorderBottomNav)
      ..add(ActionsNames.resetBottomNavigation, resetBottomNav);


void updateTab(AppState state, Action<Page> action, AppStateBuilder builder) {
  builder.activePage = action.payload;
}

void setBottomNav(AppState state, Action<bool> action, AppStateBuilder builder) {
  builder.showBottomNavigation = action.payload;
}

void reorderBottomNav(AppState state, Action<List<Page>> action, AppStateBuilder builder) {
  bool properSize = 2 <= action.payload.length && action.payload.length <= 7;
  bool unique = action.payload.length == action.payload.toSet().length;

//  print(action.payload.length);
//  print("$properSize $unique");

  if (properSize && unique) {
    builder.bottomNavigation = action.payload;
  }
}

void resetBottomNav(AppState state, Action<void> action, AppStateBuilder builder) {
  AppState original = new AppState();
  builder.showBottomNavigation = original.showBottomNavigation;
  builder.bottomNavigation = original.bottomNavigation;
}

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/page.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger("NAV_REDUCER");

///
NestedReducerBuilder<AppState, AppStateBuilder, NavigationState, NavigationStateBuilder> getNavigationReducer() =>
  (new NestedReducerBuilder<AppState, AppStateBuilder, NavigationState, NavigationStateBuilder>((s) => s.navigation, (b) => b.navigation)
    ..add(NavigationActionsNames.goTo, goTo)
    ..add(NavigationActionsNames.reorderBottomNavigation, reorderBottomNav)
    ..add(NavigationActionsNames.setDefaultPage, setDefaultPage)

//    ..add(FirestoreActionsNames.navigationSettingsReceived, navigationStateReceived)
  );

///
void goTo(NavigationState state, Action<Page> action, NavigationStateBuilder builder) {
  builder.activePage = action.payload;

  // Updating home page bottom navigation
  if (state.bottomNavigation.contains(action.payload)) {
    builder.bottomNavigationPage = action.payload;
  }
}

///
void reorderBottomNav(NavigationState state, Action<List<Page>> action, NavigationStateBuilder builder) {
  bool properSize = 2 <= action.payload.length && action.payload.length <= 7;
  bool unique = action.payload.length == action.payload.toSet().length;

  if (properSize && unique) {
    builder.bottomNavigation = BuiltList.from(action.payload); // FIXME

    // Active page now in bottom navigation
    if (action.payload.contains(state.activePage)) {
      builder.bottomNavigationPage = state.activePage;
    } // Active page no longer in bottom navigation
    else {
      builder.bottomNavigationPage = action.payload[0];
    }

    // Default page no longer in bottom navigation
    if (!action.payload.contains(state.defaultPage)) {
      builder.defaultPage = action.payload[0];
    }
  }
}

///
void setDefaultPage(NavigationState state, Action<Page> action, NavigationStateBuilder builder) {
  if (state.bottomNavigation.contains(action.payload)) {
    builder.defaultPage = action.payload;
  }
}

/// Not allowed to have multiple reducers with same action
//void navigationStateReceived(NavigationState state, Action<NavigationState> action, NavigationStateBuilder builder) {
//}
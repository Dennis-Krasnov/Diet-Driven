import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

ReducerBuilder<AppState, AppStateBuilder> reducerBuilder =
    new ReducerBuilder<AppState, AppStateBuilder>()
//      ..add(CounterActionsNames.increment, (s, a, b) => b.count++);
      ..add(ActionsNames.anonymousUserLoaded, anonymousUserLoaded)
      ..add(ActionsNames.anonymousUserFail, anonymousUserFail)
      ..add(ActionsNames.setLoading, setLoading)
      ..add(ActionsNames.goTo, goTo)
      ..add(ActionsNames.reorderBottomNavigation, reorderBottomNav)
      ..add(ActionsNames.setDefaultPage, setDefaultPage);


void anonymousUserLoaded(AppState state, Action<FirebaseUser> action, AppStateBuilder builder) {
  builder.user = action.payload;
  print("${action.payload.email ?? action.payload.uid} user was loaded");
  print("(from reducer)");
}

void anonymousUserFail(AppState state, Action<dynamic> action, AppStateBuilder builder) {
  print("Anonymous user loading FAILED");
  print(action.payload);
}

void setLoading(AppState state, Action<bool> action, AppStateBuilder builder) {
  builder.loading = action.payload;
  print("LOADING IS NOW ${action.payload}");
}


void goTo(AppState state, Action<Page> action, AppStateBuilder builder) {
  print("REDUCER GO TO");
  builder.activePage = action.payload;

  if (state.bottomNavigation.contains(action.payload)) {
    builder.bottomNavigationPage = action.payload;
  }
}


void reorderBottomNav(AppState state, Action<List<Page>> action, AppStateBuilder builder) {
  print("REORDER REDUCER!");
  bool properSize = 2 <= action.payload.length && action.payload.length <= 7;
  bool unique = action.payload.length == action.payload.toSet().length;

  if (properSize && unique) {
    builder.bottomNavigation = action.payload;

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

void setDefaultPage(AppState state, Action<Page> action, AppStateBuilder builder) {
  if (state.bottomNavigation.contains(action.payload)) {
    builder.defaultPage = action.payload;
  }
}



import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger("USER_REDUCER");

///
NestedReducerBuilder<AppState, AppStateBuilder, UserState, UserStateBuilder> getUserReducer() =>
  (new NestedReducerBuilder<AppState, AppStateBuilder, UserState, UserStateBuilder>((s) => s.user, (b) => b.user)
    ..add(UserActionsNames.authStateChanged, authStateChanged)
    ..add(UserActionsNames.anonymousUserFail, anonymousUserFail)
  );

///
void authStateChanged(UserState state, Action<FirebaseUser> action, UserStateBuilder builder) {
  builder.authUser = action.payload;

  log.info("${action.payload.uid} user was loaded");
}

///
void anonymousUserFail(UserState state, Action<dynamic> action, UserStateBuilder builder) {
  print(action.payload);
}
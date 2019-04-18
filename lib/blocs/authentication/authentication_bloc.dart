import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/authentication/authentication.dart';
import 'package:diet_driven/repositories/repositories.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Logger _log = new Logger("authentication bloc");
  final AuthenticationRepository authRepository;

  StreamSubscription<FirebaseUser> onAuthStateChangedSubscription;

  AuthenticationBloc({@required this.authRepository}) {
    assert(authRepository != null);

    // Immediately called on app start and on every authentication update
    onAuthStateChangedSubscription = authRepository.onAuthStateChangedStream.listen((user) {
      _log.fine("on auth state change trigger");
      _log.fine("user: $user");

      // TODO: can write this as a ternary operator

      if (user != null) {
        // Switching to another user wipes authentication to prevent showing old user's data
//        if (currentState is AuthAuthenticated && (currentState as AuthAuthenticated).user.uid != user.uid) {
//          dispatch(WipeAuthentication()); // FIXME: this shows splash page for no reason
//          _log.info("wiped due to user switch");
//        }
        // solution: set settings and user data wipe themselves!

        // Updates user, triggers settings reload
        dispatch(SignIn((b) => b.user = user));
        _log.info("authenticated with $user");
      }
      else {
        // User logged out, or not persisted due to timeout or other unexpected authentication termination
        dispatch(SignOut());
        _log.info("user logged out");
      }
    },
    );
  }

  @override
  AuthenticationState get initialState => AuthUninitialized();

  @override
  void dispose() {
    onAuthStateChangedSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is SignIn) {
      yield AuthAuthenticated((b) => b.user = event.user);

      _log.info("signed in");
    }
    if (event is SignOut) {
      yield AuthUnauthenticated();

      _log.info("signed out");
    }
  }
}

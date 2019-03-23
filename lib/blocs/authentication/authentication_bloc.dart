import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/authentication/authentication.dart';
import 'package:diet_driven/repositories/repositories.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Logger log = new Logger("authentication bloc");

  final AuthenticationRepository authRepository;

  StreamSubscription<FirebaseUser> onAuthStateChangedSubscription;

  AuthenticationBloc({@required this.authRepository}) {
    assert(authRepository != null);

    // Called immediately on app start
    onAuthStateChangedSubscription = authRepository.onAuthStateChangedStream.listen((user) {
      log.fine("on auth state change trigger");
      log.fine("user: $user");

      if (user != null) {
        // Triggers settings reload
        dispatch(SignIn((b) => b.user = user));
        log.info("authenticated with $user");
      }
      else {
        // User not persisted or timeout or other unexpected authentication termination
        dispatch(SignOut());
        log.info("user logged out");
      }
    });
  }

  @override
  AuthenticationState get initialState => AuthUninitialized();


  @override
  void dispose() {
    onAuthStateChangedSubscription?.cancel();
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationState currentState, AuthenticationEvent event) async* {
    if (event is SignIn) {
      yield AuthAuthenticated((b) => b.user = event.user);
      log.info("logged in");
    }
    if (event is SignOut) {
      yield AuthUnauthenticated();
      log.info("logged out");
    }
  }
}

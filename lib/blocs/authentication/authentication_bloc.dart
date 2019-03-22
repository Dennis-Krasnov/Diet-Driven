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
        dispatch(LoggedIn((b) => b.user = user));
        log.info("authenticated with $user");
      }
      else {
        if (currentState is AuthUninitialized) {
          // User not persisted
          dispatch(Disconnected());
          log.info("user not persisted");
        }
        if (currentState is AuthAuthenticated) {
          // Timeout or other unexpected authentication termination
          dispatch(Disconnected());
          log.info("disconnected");
        }
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
    if (event is LoggedIn) {
//      await Future.delayed(Duration(seconds: 5));
      yield AuthAuthenticated((b) => b.user = event.user);
      log.info("logged in");
    }
    // TODO: combine loggedOut and disconnected
    if (event is LoggedOut) {
      await authRepository.signOut();
      yield AuthUnauthenticated();
      log.info("logged out");
    }
    if (event is Disconnected) {
      yield AuthUnauthenticated();
      log.info("trigger-based quit");
    }
  }
}

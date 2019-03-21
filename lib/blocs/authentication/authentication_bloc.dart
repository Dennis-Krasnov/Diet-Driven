import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/authentication/authentication.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authRepository;

  AuthenticationBloc({
    @required this.authRepository
  }) : assert(authRepository != null);

  StreamSubscription<FirebaseUser> onAuthStateChangedSubscription;

  @override
  AuthenticationState get initialState => AuthUninitialized();


  @override
  void dispose() {
    onAuthStateChangedSubscription?.cancel();
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationState currentState, AuthenticationEvent event) async* {
    if (event is AppStarted) {

      // Load global config settings
//      TODO: fetchRemoteConfig (settings bloc)

      // Persisted authentication
      final FirebaseUser user = await authRepository.currentUser;
      if (user != null) {
        yield AuthAuthenticated((b) => b.user = user);
      }

      // Timeout or other unexpected authentication termination
      AuthenticationState timeoutState;
//      onAuthStateChangedSubscription = authRepository.onAuthStateChangedStream.listen((user) =>
//        // Safely triggers on LoggedOut event
//        timeoutState = user == null ? AuthUnauthenticated() : null
//      );
      onAuthStateChangedSubscription = authRepository.onAuthStateChangedStream.listen((user) {
        if (user != null) {
          // Triggers settings reload
          timeoutState = AuthAuthenticated((b) => b.user = user);
        } else {
          // Safely triggers on LoggedOut event
          timeoutState = AuthUnauthenticated();
        }
      });

      if (timeoutState != null) {
        yield timeoutState;
      }
    }
    else if (event is LoggedIn) {
      yield AuthLoading();
      // TODO: load user settings! (critical) (settings bloc)

      await Future.delayed(Duration(seconds: 5));
      yield AuthAuthenticated((b) => b.user = event.user);
    }
    else if (event is LoggedOut) {
      yield AuthLoading();
      await authRepository.signOut(); // can't throw
      yield AuthUnauthenticated();
    }
    else {
      print("AUTHENTICATION EVENT NOT DEFINED: $event");
      // TODO: setup logging on all unexpected events
      // TODO: make assertions on class and function arguments
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/authentication/authentication.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authRepository;

  AuthenticationBloc({@required this.authRepository}) : assert(authRepository != null);

  // FIXME: listen to authentication.authStateChanged, update accordingly

  @override
  AuthenticationState get initialState => AuthUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationState currentState, AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final FirebaseUser user = await authRepository.currentUser;

      if (user != null) {
        yield AuthAuthenticated((b) => b.user = user);
      }
      else {
        yield AuthUnauthenticated();
      }
    }
    else if (event is LoggedIn) {
      yield AuthLoading();
      // TODO: load global settings!
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

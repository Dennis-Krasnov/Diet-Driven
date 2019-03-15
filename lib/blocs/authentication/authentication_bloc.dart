import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/authentication/authentication.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationState currentState, AuthenticationEvent event) async* {
    //
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    } //
    else if (event is LoggedIn) {
      yield AuthLoading();
      await userRepository.persistToken(event.token);
      yield AuthAuthenticated();
    } //
    else if (event is LoggedOut) {
      yield AuthLoading();
      await userRepository.deleteToken();
      yield AuthUnauthenticated();
    }
    else {
      print("AUTHENTICATION EVENT NOT DEFINED: $event");
    }
  }


}
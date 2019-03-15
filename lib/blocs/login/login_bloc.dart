import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/authentication/authentication.dart';
import 'package:diet_driven/blocs/login/login.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  }) : assert(userRepository != null), assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    //
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn((b) => b..token = token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure((b) => b.error = error.toString());
      }
    }
    else {
      print("LOGIN EVENT NOT DEFINED: $event");
    }
  }


}
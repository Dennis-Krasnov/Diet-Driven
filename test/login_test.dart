import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';

import 'package:diet_driven/blocs/blocs.dart';

import 'test_utils.dart';

void main() {
  LoginBloc loginBloc;
  UserRepository userRepository;
  AuthenticationBloc authenticationBloc;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = MockAuthenticationBloc();
    loginBloc = LoginBloc(
      userRepository: userRepository,
      authenticationBloc: authenticationBloc,
    );
  });

  test("Initial state is correct", () {
    expect(loginBloc.initialState, LoginInitial());
  });

  test("Dispose doesn't emit new state", () {
    expectLater(loginBloc.state, doesNotEmit);
    authenticationBloc.dispose();
  });

  group("Login button pressed", () {
    test("Emits token on success", () {
      when(userRepository.authenticate(
        username: "valid_username",
        password: "valid_password",
      )).thenAnswer((_) => Future.value("token"));

      expectLater(
        loginBloc.state,
        emitsInOrder([
          LoginInitial(),
          LoginLoading(),
          LoginInitial(),
        ])
      ).then((_) {
        verify(authenticationBloc.dispatch(LoggedIn((b) => b..token = "token"))).called(1);
      });

      loginBloc.dispatch(LoginButtonPressed((b) => b
        ..username = "valid_username"
        ..password = "valid_password"
      ));
    });
  });

}

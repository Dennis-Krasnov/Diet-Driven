import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';

import '../test_utils.dart';

void main() {
  // MOCKS
  AuthenticationRepository userRepository;
  AuthenticationBloc authenticationBloc;

  LoginBloc loginBloc;

  setUp(() {
    FirebaseUser user = FirebaseUserMock();
    when(user.uid).thenReturn("aslfkjslkej2i09f2m0");

    userRepository = MockAuthenticationRepository();

    authenticationBloc = MockAuthenticationBloc();

    loginBloc = LoginBloc(
      authenticationRepository: userRepository,
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

    test("Logs in on correct cridentials", () {
      FirebaseUser user = FirebaseUserMock();
      when(userRepository.signInWithEmail(
        argThat(startsWith("valid")),
        argThat(startsWith("valid"))
      )).thenAnswer((_) => Future.value(user));

      expectLater(
        loginBloc.state,
        emitsInOrder([
          LoginInitial(),
          LoginLoading(),
          LoginInitial(),
        ])
      ).then((_) { // TODO: use async await
        verify(authenticationBloc.dispatch(SignIn((b) => b..user = user))).called(1);
      });

      loginBloc.dispatch(PressLoginButton((b) => b
        ..username = "valid@email.com"
        ..password = "valid_password"
      ));
    });

    test("Fails on incorrect cridentials", () {
      FirebaseUser user = FirebaseUserMock();
      when(userRepository.signInWithEmail(
          argThat(startsWith("invalid")),
          argThat(startsWith("invalid"))
      )).thenThrow(Exception("ERROR"));

      expectLater(
          loginBloc.state,
          emitsInOrder([
            LoginInitial(),
            LoginLoading(),
            LoginFailure((b) => b.error = "ERROR"),
          ])
      ).then((_) { // TODO: use async await
        // FIXME
//        verifyNever(authenticationBloc.dispatch(LoggedIn((b) => b..user = user)));
      });

      loginBloc.dispatch(PressLoginButton((b) => b
        ..username = "invalid_email"
        ..password = "valid_password"
      ));
    });
  });

}

/// TODO: catch different types of errors once they improve error handling in android
// https://github.com/flutter/plugins/pull/775
//ERROR_INVALID_EMAIL - If the email address is malformed
//ERROR_WRONG_PASSWORD - If the password is wrong
//ERROR_USER_NOT_FOUND - If there is no user corresponding to the given email address, or if the user has been deleted.
//ERROR_USER_DISABLED - If the user has been disabled (for example, in the Firebase console)
//ERROR_TOO_MANY_REQUESTS - If there was too many attempts to sign in as this user.
//ERROR_OPERATION_NOT_ALLOWED - Indicates that Email & Password accounts are not enabled.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';

import 'test_utils.dart';

void main() {
  // Mocks
  UserRepository userRepository;
  FirebaseAuth firebaseAuth;
//  GoogleSignIn googleSignIn;
//  GoogleSignInAccount googleSignInAccount;

  AuthenticationBloc authenticationBloc;

  setUp(() {
    userRepository = MockUserRepository();
    firebaseAuth = FirebaseAuthMock();
//    googleSignIn = GoogleSignInMock();
//    googleSignInAccount = GoogleSignInAccountMock();

    authenticationBloc = AuthenticationBloc(userRepository: userRepository);

  });

  test("Initial state is correct", () {
    expect(authenticationBloc.initialState, AuthUninitialized());
  });

  test("Dispose doesn't emit new state", () {
    expectLater(authenticationBloc.state, doesNotEmit);
    authenticationBloc.dispose();
  });

  group("App started", () {
    test("Emits [uninitialized, unauthenticated] for invalid token", () {
      when(userRepository.hasToken()).thenAnswer((_) => Future.value(false));

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthUnauthenticated(),
        ])
      );

      authenticationBloc.dispatch(AppStarted());
    });
  });

  group("Logged in", () {
    test("Emits [uninitialized, loading, authenticated] when token is persisted", () {
      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthLoading(),
          AuthAuthenticated(),
        ])
      );

      authenticationBloc.dispatch(LoggedIn((b) => b
        ..token = "instance.token"
      ));
    });
  });

  group("Logged out", () {
    test("Emits [uninitialized, loading, unauthenticated] when token is deleted", () {
      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthLoading(),
          AuthUnauthenticated(),
        ])
      );

      authenticationBloc.dispatch(LoggedOut());
    });
  });

}

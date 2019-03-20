import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';

import 'test_utils.dart';

void main() {
  // Mocks
  AuthenticationRepository authRepository;
  FirebaseAuth firebaseAuth;
//  GoogleSignIn googleSignIn;
//  GoogleSignInAccount googleSignInAccount;

  AuthenticationBloc authenticationBloc;

  setUp(() {
    authRepository = MockAuthenticationRepository();
    firebaseAuth = FirebaseAuthMock();
//    googleSignIn = GoogleSignInMock();
//    googleSignInAccount = GoogleSignInAccountMock();

    authenticationBloc = AuthenticationBloc(authRepository: authRepository);

  });

  test("Initial state is correct", () {
    expect(authenticationBloc.initialState, AuthUninitialized());
  });

  test("Dispose doesn't emit new state", () {
    expectLater(authenticationBloc.state, doesNotEmit);
    authenticationBloc.dispose();
  });

  group("App started", () {
    test("Emits [uninitialized, unauthenticated] for no current user", () {
      when(authRepository.currentUser).thenAnswer((_) => Future.value(null));

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthUnauthenticated(),
        ])
      );

      authenticationBloc.dispatch(AppStarted());
    });

    test("Emits [uninitialized, authenticated] for persisted current user", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("aslfkjslkej2i09f2m0");

      when(authRepository.currentUser).thenAnswer((_) => Future.value(user));

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ])
      );

      authenticationBloc.dispatch(AppStarted());
    });
  });

  group("Logged in", () {
    test("Emits [uninitialized, loading, authenticated] when current user is logged in", () {
      FirebaseUser user = FirebaseUserMock(); // for both anonymous and signed in
      when(user.uid).thenReturn("aslfkjslkej2i09f2m0");

      // TODO: check for global settings loaded

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthLoading(),
          AuthAuthenticated((b) => b..user = user),
        ])
      );

      authenticationBloc.dispatch(LoggedIn((b) => b
        ..user = user
      ));
    });
  });

  group("Logged out", () {
    test("Emits [uninitialized, loading, unauthenticated] when user signs out", () {
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

  // TODO: failure states!
}

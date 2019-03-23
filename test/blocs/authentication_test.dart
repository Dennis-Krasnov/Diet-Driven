import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:rxdart/rxdart.dart';

import '../test_utils.dart';

void main() {
  AuthenticationRepository authRepository;
  FirebaseAuth firebaseAuth;

  AuthenticationBloc authenticationBloc;

  ///
  void mockAuthenticationRepositoryStream(List<FirebaseUser> events) {
    when(authRepository.onAuthStateChangedStream).thenAnswer((_) =>
        Observable<FirebaseUser>.fromIterable(events).shareValue()
    );
    authenticationBloc = AuthenticationBloc(authRepository: authRepository);
  }

  setUp(() {
    authRepository = MockAuthenticationRepository();
    firebaseAuth = FirebaseAuthMock();
    mockAuthenticationRepositoryStream([]); // No events by default
  });

  test("Initial state is correct", () {
    expect(authenticationBloc.initialState, AuthUninitialized());
  });

  group("Manual", () {
    test("Signs in", () {
      FirebaseUser user = FirebaseUserMock();

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user)
        ])
      );

      authenticationBloc.dispatch(LoggedIn((b) => b..user = user));
    });

    test("Logs out", () {
      FirebaseUser user = FirebaseUserMock();

      expectLater(
          authenticationBloc.state,
          emitsInOrder([
            AuthUninitialized(),
            AuthAuthenticated((b) => b..user = user),
            AuthUnauthenticated(),
          ])
      ).then((_) {
        verifyNever(authRepository.signOut());
      });

      authenticationBloc.dispatch(LoggedIn((b) => b..user = user));
      authenticationBloc.dispatch(LoggedOut());
    });
  });

  group("Stream event triggers", () {
    test("Persists current user", () {
      FirebaseUser user = FirebaseUserMock();
      mockAuthenticationRepositoryStream([user]);

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ])
      );
    });

    test("null user => unauthenticated", () {
      mockAuthenticationRepositoryStream([null]);

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthUnauthenticated(),
        ])
      );
    });

    test("Reauthenticates from in-app user change", () {
      FirebaseUser userA = FirebaseUserMock();
      FirebaseUser userB = FirebaseUserMock();

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = userA),
          AuthAuthenticated((b) => b..user = userB),
        ])
      );

      authenticationBloc.dispatch(LoggedIn((b) => b..user = userA));
      authenticationBloc.dispatch(LoggedIn((b) => b..user = userB));
    });

    test("Handles authentication termination", () {
      FirebaseUser user = FirebaseUserMock();
      mockAuthenticationRepositoryStream([user, null]);

      expectLater(
          authenticationBloc.state,
          emitsInOrder([
            AuthUninitialized(),
            AuthAuthenticated((b) => b..user = user),
            AuthUnauthenticated(),
          ])
      ).then((_) {
        verifyNever(authRepository.signOut());
      });
    });
  });
}

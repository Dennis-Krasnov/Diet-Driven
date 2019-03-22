import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:rxdart/rxdart.dart';

import '../test_utils.dart';

void main() {
  // Mocks
  AuthenticationRepository authRepository;
  FirebaseAuth firebaseAuth;
//  GoogleSignIn googleSignIn;
//  GoogleSignInAccount googleSignInAccount;

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
//    googleSignIn = GoogleSignInMock();
//    googleSignInAccount = GoogleSignInAccountMock();

//    authenticationBloc = AuthenticationBloc(authRepository: authRepository);
  });

  test("Initial state is correct", () {
    expect(authenticationBloc.initialState, AuthUninitialized());
  });

  group("App started", () {
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

    test("Unauthenticated current user", () {
      mockAuthenticationRepositoryStream([null]);

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthUnauthenticated(),
        ])
      );
    });
  });

  group("Logged in", ()
  {
    test("Authentices from manual sign in", () {
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

    test("Authentices from tiggered sign in", () {
      FirebaseUser user = FirebaseUserMock();
      mockAuthenticationRepositoryStream(
          [null, user]); // TODO: see what real one emits, try just [user]

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthUnauthenticated(),
          AuthAuthenticated((b) => b..user = user)
        ])
      );
    });

    test("Reauthenticated from triggred user change", () {
      // user a -> user b
    });

  });


  group("Logged out", () {
//    test("Unauthentices from manual sign out", () {
//      FirebaseUser user = FirebaseUserMock();
//      mockAuthenticationRepositoryStream([null, user]);
//      when(authRepository.signOut()).thenThrow(Error());
////          .thenAnswer((_) => Future.delayed(Duration(seconds: 1))); // FIXME: future void return...
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthUnauthenticated(),
//          AuthAuthenticated((b) => b..user = user),
//          AuthUnauthenticated(),
//        ])
//      ).then((_) {
////        verify(authRepository.signOut()).called(1);
//      });
//
//      authenticationBloc.dispatch(LoggedOut());
//    });

    test("Unauthentices from tiggered sign out", () {
      FirebaseUser user = FirebaseUserMock();
      mockAuthenticationRepositoryStream([null, user, null]);

      expectLater(
        authenticationBloc.state,
        emitsInOrder([
          AuthUninitialized(),
          AuthUnauthenticated(),
          AuthAuthenticated((b) => b..user = user),
          AuthUnauthenticated(),
        ])
      ).then((_) {
        verifyNever(authRepository.signOut());
      });
    });
  });
}

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:mockito/mockito.dart';
//
//import 'package:diet_driven/repositories/repositories.dart';
//import 'package:diet_driven/blocs/blocs.dart';
//import 'package:rxdart/rxdart.dart';
//
//import '../test_utils.dart';
//
//void main() {
//  // Mocks
//  UserRepository authRepository;
//
//  AuthenticationBloc authenticationBloc;
//
//  /// Mocks onAuthStateChangedStream FirebaseUser stream, initializes authBloc
//  void mockAuthenticationRepositoryStream({
//    List<FirebaseUser> authStream: const []
//  }) {
//    when(authRepository.onAuthStateChangedStream).thenAnswer((_) =>
//      Observable<FirebaseUser>.fromIterable(authStream).shareValue()
//    );
//    authenticationBloc = AuthenticationBloc(authRepository: authRepository);
//  }
//
//  setUp(() {
//    authRepository = MockAuthenticationRepository();
//    mockAuthenticationRepositoryStream(); // No events by default
//  });
//
//  test("Initial state is correct", () {
//    expect(authenticationBloc.initialState, AuthUninitialized());
//  });
//
//  group("Manual", () {
//    test("Signs in", () {
//      FirebaseUser user = FirebaseUserMock();
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = user)
//        ])
//      ).then((_) {
//        verifyNever(authRepository.signInWithEmail(any, any));
//        verifyNever(authRepository.signInAnonymously());
//      });
//
//      authenticationBloc.dispatch(SignIn((b) => b..user = user));
//    });
//
//    test("Logs out", () {
//      FirebaseUser user = FirebaseUserMock();
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = user),
//          AuthUnauthenticated(),
//        ])
//      ).then((_) {
//        verifyNever(authRepository.signOut());
//      });
//
//      authenticationBloc.dispatch(SignIn((b) => b..user = user));
//      authenticationBloc.dispatch(SignOut());
//    });
//  });
//
//  group("Auth stream event triggers", () {
//    test("Persists current user", () {
//      FirebaseUser user = FirebaseUserMock();
//      mockAuthenticationRepositoryStream(authStream: [
//        user
//      ]);
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = user),
//        ])
//      );
//    });
//
//    test("null user => unauthenticated", () {
//      mockAuthenticationRepositoryStream(authStream: [
//        null
//      ]);
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthUnauthenticated(),
//        ])
//      );
//    });
//
//    test("Reauthenticates from in-app user change", () {
//      FirebaseUser userA = FirebaseUserMock();
//      FirebaseUser userB = FirebaseUserMock();
//
//      mockAuthenticationRepositoryStream(authStream: [
//        userA,
//        userB
//      ]);
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = userA),
//          AuthAuthenticated((b) => b..user = userB),
//        ])
//      ).then((_) {
//        verifyNever(authRepository.signOut());
//      });
//    });
//
//    test("Handles authentication termination", () {
//      FirebaseUser user = FirebaseUserMock();
//      mockAuthenticationRepositoryStream(authStream: [
//        user,
//        null
//      ]);
//
//      expectLater(
//        authenticationBloc.state,
//        emitsInOrder([
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = user),
//          AuthUnauthenticated(),
//        ])
//      ).then((_) {
//        verifyNever(authRepository.signOut());
//      });
//    });
//  });
//}

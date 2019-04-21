import 'package:diet_driven/models/models.dart';
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
  SettingsRepository settingsRepository;
  UserRepository userRepository;

  UserDataBloc userDataBloc;
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
  setUp(() {
    settingsRepository = MockSettingsRepository();
    userRepository = MockUserRepository();

    // No events by default
    when(userRepository.authStateChangedStream).thenAnswer((_) =>
      Observable<FirebaseUser>.fromIterable([]).shareValue()
    );

    userDataBloc = new UserDataBloc(settingsRepository: settingsRepository, userRepository: userRepository);
  });

  test("Initial state is correct", () {
    expect(userDataBloc.initialState, UserDataUninitialized());
  });
//
  group("Manual", () {
    test("Signs in", () {
      Settings settings = Settings();

      UserData userData = UserData((b) => b
        ..userId = "1234"
        ..email = "example@gmail.com"
        ..name = "John smith"

        ..currentSubscription = "all"

        ..settings = settings
      );

      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
          UserDataLoaded((b) => b..userData = userData.toBuilder())
        ])
      ).then((_) {
//        verifyNever(authRepository.signInWithEmail(any, any));
//        verifyNever(authRepository.signInAnonymously());
      });

      userDataBloc.dispatch(RemoteUserDataArrived((b) => b..userData = userData.toBuilder()));
    });

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
  });
//
//  group("Auth stream event triggers", () {
    test("Persists current user", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");
      when(user.email).thenReturn("example@gmail.com");
      when(user.displayName).thenReturn("Bob Smith");

      when(userRepository.authStateChangedStream).thenAnswer((_) =>
        Observable<FirebaseUser>.fromIterable([user]).shareValue()
      );

      UserDocument userDocument = UserDocument((b) => b..currentSubscription = "all");
      when(settingsRepository.userDocumentStream(user.uid)).thenAnswer((_) =>
        Observable<UserDocument>.fromIterable([userDocument]).shareValue()
      );

      Settings settings = Settings();
      when(settingsRepository.settingsStream(user.uid)).thenAnswer((_) =>
        Observable<Settings>.fromIterable([settings]).shareValue()
      );

      userDataBloc = new UserDataBloc(settingsRepository: settingsRepository, userRepository: userRepository);

      var result = UserData((b) => b
        ..userId = user.uid
        ..email = user.email
        ..name = user.displayName
        ..currentSubscription = userDocument.currentSubscription
        ..settings = settings
      );

      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
          UserDataLoading(),
          UserDataLoaded((b) => b..userData = result.toBuilder()),
//          UserDataLoaded((b) => b..userData = result.toBuilder()..userData.update((b) => b
//            ..userId = "4321"
//          ))
        ])
      );
    });
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
}

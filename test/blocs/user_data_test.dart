import 'package:diet_driven/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:rxdart/rxdart.dart';

import '../test_utils.dart';

void main() {
  // Mocks
  SettingsRepository settingsRepository;
  AuthenticationBloc authenticationBloc;

  UserDataBloc userDataBloc;

  ///
  void mockUserDataBlocSubscription({
    String userId: "1234",
    List<AuthenticationState> authStates: const [],
    List<UserData> userDataStream: const [],
  }) {
    when(authenticationBloc.state).thenAnswer((_) =>
    Observable<AuthenticationState>.fromIterable(authStates)
    );

    when(settingsRepository.userDataDocument(userId)).thenAnswer((_) =>
      Observable<UserData>.fromIterable(userDataStream).shareValue()
    );

    userDataBloc = UserDataBloc(
      settingsRepository: settingsRepository,
      authenticationBloc: authenticationBloc
    );
  }

  setUp(() {
    settingsRepository = MockSettingsRepository();
    authenticationBloc = MockAuthenticationBloc();

    mockUserDataBlocSubscription();
  });

  test("Initial state is correct", () {
    expect(userDataBloc.initialState, UserDataUninitialized());
  });

  group("Manual", () {
    test("Receives user data", () {
      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
          UserDataLoaded((b) => b
            ..userData = UserData((b) => b
              ..userId = "1234"
            ).toBuilder()
          ),
        ])
      );

      userDataBloc.dispatch(UserDataArrived((b) => b
        ..userData = UserData((b) => b
          ..userId = "1234"
        ).toBuilder()
      ));
    });

    test("Doesn't wipe if not loaded", () {
      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
        ])
      );

      userDataBloc.dispatch(WipeUserData());
    });

    test("Wipes if loaded", () {
      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
          UserDataLoaded((b) => b
            ..userData = UserData((b) => b
              ..userId = "1234"
            ).toBuilder()
          ),
          UserDataUninitialized(),
        ])
      );

      userDataBloc.dispatch(UserDataArrived((b) => b
        ..userData = UserData((b) => b
          ..userId = "1234"
        ).toBuilder()
      ));

      userDataBloc.dispatch(WipeUserData());
    });
  });

  group("Authentication bloc state triggers", () {
    test("Does nothing if unauthenticated", () {
      mockUserDataBlocSubscription(authStates: [
        AuthUninitialized(),
        AuthUnauthenticated()
      ]);

      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
        ])
      );
    });

    test("Subscribes to an authenticated user", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");

      mockUserDataBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ],
        userDataStream: []
      );

      // can't do manual sign in, it's just a mock...

      expectLater(userDataBloc.userDataSubscription, isNotNull);
    });

    test("Resubscribes on user change", () {
      FirebaseUser userA = FirebaseUserMock();
      when(userA.uid).thenReturn("1234");

      FirebaseUser userB = FirebaseUserMock();
      when(userA.uid).thenReturn("1234");
//      when(userA.uid).thenReturn("4321");

      mockUserDataBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = userA),
          AuthAuthenticated((b) => b..user = userB),
        ],
        userDataStream: [
          UserData((b) => b..userId = "1234"),
          UserData((b) => b..userId = "1234"),
        ]
      );

      print("data documents:");
      settingsRepository.userDataDocument("1234").listen((data) => print(data.userId));

       // FIXME: create another custom rule! (if 4321, return in reverse?)

//      authenticationBloc.dispatch(SignIn((b) => b..user = userA));
      var subscriptionA = userDataBloc.userDataSubscription;

      print("subscription A: $subscriptionA");

      authenticationBloc.dispatch(SignIn((b) => b..user = userB));
      expect(userDataBloc.userDataSubscription, isNot(subscriptionA));
    });
  });

  group("User data stream triggers", () {
    test("Doesn't load settings if none arrived", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");

      mockUserDataBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ],
        userDataStream: []
      );

      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
        ])
      );
    });

    test("Loads user data", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");

      mockUserDataBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ],
        userDataStream: [
          null,
          UserData((b) => b
            ..userId = "1234"
          )
        ]
      );

      var userData = UserData((b) => b
        ..userId = "1234"
      );

      print("user data: $userData");
      print("user data builder: ${userData.toBuilder()}");

      expectLater(
        userDataBloc.state,
        emitsInOrder([
          UserDataUninitialized(),
          UserDataLoaded((b) => b
            ..userData = userData.toBuilder()
          ),
        ])
      );
    });
  });
}


// TODO: simulate errors!

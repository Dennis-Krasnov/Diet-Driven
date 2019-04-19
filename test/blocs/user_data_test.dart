//import 'package:diet_driven/models/models.dart';
//import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
//import 'package:flutter_test/flutter_test.dart';
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
//  SettingsRepository settingsRepository;
//  AuthenticationBloc authenticationBloc;
//
//  UserDataBloc userDataBloc;
//
//  ///
//  void mockUserDataBlocSubscription({
//    String userId: "1234",
//    List<AuthenticationState> authStates: const [],
//    List<UserData> repoUserDataStream: const [],
//  }) {
//    when(authenticationBloc.state).thenAnswer((_) =>
//      Observable<AuthenticationState>.fromIterable(authStates)
//    );
//
//    when(settingsRepository.userDocument(userId)).thenAnswer((_) =>
//      Observable<UserData>.fromIterable(repoUserDataStream).shareValue()
//    );
//
//    userDataBloc = UserDataBloc(
//      settingsRepository: settingsRepository,
//      authenticationBloc: authenticationBloc
//    );
//  }
//
//  setUp(() {
//    settingsRepository = MockSettingsRepository();
//    authenticationBloc = MockAuthenticationBloc();
//
//    mockUserDataBlocSubscription();
//  });
//
//  test("Initial state is correct", () {
//    expect(userDataBloc.initialState, UserDataUninitialized());
//  });
//
//  group("Manual", () {
//    test("Receives user data", () {
//      final userData = UserData((b) => b..userId = "1234");
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder([
//          UserDataUninitialized(),
//          UserDataLoaded((b) => b
//            ..userData = userData.toBuilder()
//          ),
//        ])
//      );
//
//      userDataBloc.dispatch(RemoteUserDataArrived((b) => b
//        ..userData = userData.toBuilder()
//      ));
//    });
//
//    test("Doesn't wipe if not loaded", () {
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder([
//          UserDataUninitialized(),
//        ])
//      );
//
//      userDataBloc.dispatch(WipeUserData());
//    });
//
//    test("Wipes if loaded", () {
//      final userData = UserData((b) => b..userId = "1234");
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder([
//          UserDataUninitialized(),
//          UserDataLoaded((b) => b
//            ..userData = userData.toBuilder()
//          ),
//          UserDataUninitialized(),
//        ])
//      );
//
//      userDataBloc.dispatch(RemoteUserDataArrived((b) => b
//        ..userData = userData.toBuilder()
//      ));
//
//      userDataBloc.dispatch(WipeUserData());
//    });
//  });
//
//  group("Authentication bloc state triggers", () {
//    test("Does nothing if unauthenticated", () {
//      mockUserDataBlocSubscription(authStates: [
//        AuthUninitialized(),
//        AuthUnauthenticated()
//      ]);
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder([
//          UserDataUninitialized(),
//        ])
//      );
//    });
//
//    test("Subscribes to an authenticated user", () {
//      FirebaseUser user = FirebaseUserMock();
//      when(user.uid).thenReturn("1234");
//      final userData = UserData((b) => b..userId = "1234");
//
//      // TODO: do this manually, like in next test!
//      mockUserDataBlocSubscription(
//        authStates: [
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = user),
//        ],
//        repoUserDataStream: [
//          userData
//        ]
//      );
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder([
//          UserDataUninitialized(),
//          UserDataLoaded((b) => b
//            ..userData = userData.toBuilder()
//          ),
////          UserDataUninitialized(), // FIXME should wipe data on auth stream end
//        ])
//      );
//
////      expectLater(userDataBloc.sub, isNotNull);
//    });
//
//    test("Resubscribes on user change", () {
//      // User A
//      FirebaseUser userA = FirebaseUserMock();
//      when(userA.uid).thenReturn("1234");
//      final userDataA = UserData((b) => b..userId = userA.uid);
//
//      when(settingsRepository.userDocument(userA.uid)).thenAnswer((_) =>
//        Observable<UserData>.fromIterable([userDataA]).shareValue()
//      );
//
//      // User B
//      FirebaseUser userB = FirebaseUserMock();
//      when(userB.uid).thenReturn("4321");
//      final userDataB = UserData((b) => b..userId = userB.uid);
//
//      when(settingsRepository.userDocument(userB.uid)).thenAnswer((_) =>
//        Observable<UserData>.fromIterable([userDataB]).shareValue()
//      );
//
//      // Authentication
//      when(authenticationBloc.state).thenAnswer((_) => // FIXME: this returns null
//        Observable<AuthenticationState>.fromIterable([
//          AuthUninitialized(),
//          AuthAuthenticated((b) => b..user = userA),
//          AuthAuthenticated((b) => b..user = userB),
//        ])
//      );
//
//      userDataBloc = UserDataBloc(
//        settingsRepository: settingsRepository,
//        authenticationBloc: authenticationBloc
//      );
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder([
//          UserDataUninitialized(),
//          UserDataLoaded((b) => b
//            ..userData = userDataA.toBuilder()
//          ),
//          // Wipe when switching users
//          UserDataUninitialized(),
//          UserDataLoaded((b) => b
//            ..userData = userDataB.toBuilder()
//          ),
//        ])
//      );
//
//    });
//  });
//
//  // TOTEST: use manual when like above ie no helper function)
////  group("User data stream triggers", () {
////    test("Doesn't load settings if none arrived", () {
////      FirebaseUser user = FirebaseUserMock();
////      when(user.uid).thenReturn("1234");
////
////      mockUserDataBlocSubscription(
////        authStates: [
////          AuthUninitialized(),
////          AuthAuthenticated((b) => b..user = user),
////        ],
////        repoUserDataStream: []
////      );
////
////      expectLater(
////        userDataBloc.state,
////        emitsInOrder([
////          UserDataUninitialized(),
////        ])
////      );
////    });
////
////    test("Loads user data", () {
////      FirebaseUser user = FirebaseUserMock();
////      when(user.uid).thenReturn("1234");
////
////      mockUserDataBlocSubscription(
////        authStates: [
////          AuthUninitialized(),
////          AuthAuthenticated((b) => b..user = user),
////        ],
////        repoUserDataStream: [
////          null,
////          UserData((b) => b
////            ..userId = "1234"
////          )
////        ]
////      );
////
////      var userData = UserData((b) => b
////        ..userId = "1234"
////      );
////
////      print("user data: $userData");
////      print("user data builder: ${userData.toBuilder()}");
////
////      expectLater(
////        userDataBloc.state,
////        emitsInOrder([
////          UserDataUninitialized(),
////          UserDataLoaded((b) => b
////            ..userData = userData.toBuilder()
////          ),
////        ])
////      );
////    });
////  });
//}
//
//
//// TODO: simulate errors!

//import 'package:diet_driven/models/models.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:meta/meta.dart';
//import 'package:mockito/mockito.dart';
//
//import 'package:diet_driven/repositories/repositories.dart';
//import 'package:diet_driven/blocs/blocs.dart';
//import 'package:rxdart/rxdart.dart';
//
//import '../test_utils.dart';
//
//void main() {
//  UserDataBloc userDataBloc;
//
//  /// Mocks
//  UserRepository userRepository;
//
//  /// Data
//  final Settings settings = Settings();
//
//  /// Signed in user
//  final FirebaseUser userA = FirebaseUserMock();
//  final UserDocument userDocumentA = UserDocument((b) => b
//    ..currentSubscription = "all"
//  );
//
//  /// Anonymous user
//  final FirebaseUser userB = FirebaseUserMock();
//  final UserDocument userDocumentB = UserDocument((b) => b
//    ..currentSubscription = "none"
//  );
//
//  ///
//  void mockAuthenticationRepositoryStream({
//    List<FirebaseUser> authStream = const []
//  }) {
//    when(userRepository.authStateChangedStream).thenAnswer((_) =>
//      Observable<FirebaseUser>.fromIterable(authStream)
//    );
//  }
//
//  ///
//  void mockUserRepositoryStream({
//    @required String userId,
//    List<UserDocument> userDocumentStream = const [],
//    List<Settings> settingsStream = const []
//  }) {
//    when(userRepository.userDocumentStream(userId)).thenAnswer((_) =>
//      Observable<UserDocument>.fromIterable(userDocumentStream)
//    );
//    when(userRepository.settingsStream(userId)).thenAnswer((_) =>
//      Observable<Settings>.fromIterable(settingsStream)
//    );
//  }
//
//  setUp(() {
//    userRepository = MockUserRepository();
//
//    // User stubs
//    when(userA.uid).thenReturn("1234");
//    when(userA.email).thenReturn("example@gmail.com");
//    when(userA.displayName).thenReturn("John Smith");
//
//    when(userB.uid).thenReturn("4321");
//    when(userB.email).thenReturn(null);
//    when(userB.displayName).thenReturn(null);
//
//    // No authentication state changes by default
//    mockAuthenticationRepositoryStream();
//
//    userDataBloc = UserDataBloc(userRepository: userRepository);
//  });
//
//  test("Initialize properly", () {
//    expect(userDataBloc.initialState, UserDataUninitialized());
//  });
//
//  group("Manual", () {
//    test("Load user data", () {
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder(<UserDataState>[
//          UserDataUninitialized(),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.toBuilder()
//            ..settings = settings.toBuilder()
//          )
//        ])
//      );
//
//      userDataBloc.dispatch(RemoteUserDataArrived((b) => b
//        ..authentication = userA
//        ..userDocument = userDocumentA.toBuilder()
//        ..settings = settings.toBuilder()
//      ));
//    });
//
//    test("Fail on loading error", () {
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder(<UserDataState>[
//          UserDataUninitialized(),
//          UserDataFailed((b) => b..error = "oops")
//        ])
//      );
//
//      userDataBloc.dispatch(UserDataError((b) => b..error = "oops"));
//    });
//  });
//
//  group("Reactive auth state changed triggers", () {
//    test("Onboard unauthenticated user", () {
//      mockAuthenticationRepositoryStream(authStream: [null, userA, null]);
//      mockUserRepositoryStream(userId: userA.uid, settingsStream: [settings], userDocumentStream: [userDocumentA]);
//      userDataBloc = UserDataBloc(userRepository: userRepository);
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder(<UserDataState>[
//          UserDataUninitialized(),
//          UserDataUnauthenticated(),
//          UserDataLoading(),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.toBuilder()
//            ..settings = settings.toBuilder()
//          ),
//          UserDataUnauthenticated(),
//        ])
//      );
//    });
//
//    test("Resubscribe on user change", () {
//      mockAuthenticationRepositoryStream(authStream: [userA, userB]);
//      mockUserRepositoryStream(userId: userA.uid, settingsStream: [settings], userDocumentStream: [userDocumentA]);
//      mockUserRepositoryStream(userId: userB.uid, settingsStream: [settings], userDocumentStream: [userDocumentB]);
//      userDataBloc = UserDataBloc(userRepository: userRepository);
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder(<UserDataState>[
//          UserDataUninitialized(),
//          UserDataLoading(),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.toBuilder()
//            ..settings = settings.toBuilder()
//          ),
//          UserDataLoading(),
//          UserDataLoaded((b) => b
//            ..authentication = userB
//            ..userDocument = userDocumentB.toBuilder()
//            ..settings = settings.toBuilder()
//          ),
//        ])
//      );
//    });
//  });
//
//  group("Reactive userDocument and settings triggers", () {
//    test("Update user document", () {
//      mockAuthenticationRepositoryStream(authStream: [userA]);
//      mockUserRepositoryStream(userId: userA.uid, settingsStream: [settings], userDocumentStream: [userDocumentA, userDocumentB]);
//      userDataBloc = UserDataBloc(userRepository: userRepository);
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder(<UserDataState>[
//          UserDataUninitialized(),
//          UserDataLoading(),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.toBuilder()
//            ..settings = settings.toBuilder()
//          ),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.rebuild((b) => b..currentSubscription = "none").toBuilder()
//            ..settings = settings.toBuilder()
//          ),
//        ])
//      );
//    });
//
//    test("Update settings", () {
//      Settings settingsB = Settings((b) => b
//        ..navigationSettings = NavigationSettings((b) => b..defaultPage = Page.profile)
//      );
//
//      mockAuthenticationRepositoryStream(authStream: [userA]);
//      mockUserRepositoryStream(userId: userA.uid, settingsStream: [settings, settingsB], userDocumentStream: [userDocumentA]);
//      userDataBloc = UserDataBloc(userRepository: userRepository);
//
//      expectLater(
//        userDataBloc.state,
//        emitsInOrder(<UserDataState>[
//          UserDataUninitialized(),
//          UserDataLoading(),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.toBuilder()
//            ..settings = settings.toBuilder()
//          ),
//          UserDataLoaded((b) => b
//            ..authentication = userA
//            ..userDocument = userDocumentA.toBuilder()
//            ..settings = settingsB.toBuilder()
//          ),
//        ])
//      );
//    });
//
//    // FIXME
////    test("Fail on error", () {
////      mockAuthenticationRepositoryStream(authStream: [userA]);
////      when(settingsRepository.userDocumentStream(userA.uid)).thenThrow(Exception("oops"));
////      when(settingsRepository.settingsStream(userA.uid)).thenThrow(Exception("oops 2"));
////      userDataBloc = UserDataBloc(userRepository: userRepository);
////
////      expectLater(
////        userDataBloc.state,
////        emitsInOrder([
////          UserDataUninitialized(),
////          UserDataLoading(),
////          UserDataFailed((b) => b..error = "oops"),
////          UserDataFailed((b) => b..error = "oops 2"),
////        ])
////      );
////    });
//  });
//}

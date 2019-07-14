void main() {

}
//import 'package:diet_driven/models/models.dart';
//import 'package:diet_driven/repositories/repositories.dart';
//import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
//import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';
//import 'package:rxdart/rxdart.dart';
//
//import 'package:diet_driven/blocs/blocs.dart';
//
//import '../test_utils.dart';
//
//void main() {
//  NavigationBloc navigationBloc;
//
//  /// Mocks
//  AnalyticsRepository analyticsRepository;
//  UserDataBloc userDataBloc;
//
//  /// Data
//  final FirebaseUser userA = FirebaseUserMock();
//  final UserDocument userDocumentA = UserDocument((b) => b
//    ..currentSubscription = "all"
//  );
//
//  final UserDataLoaded userDataStateA = UserDataLoaded((b) => b
//    ..authentication = userA
//    ..userDocument = userDocumentA.toBuilder()
//    ..settings = Settings((b) => b
//      ..navigationSettings = NavigationSettings((b) => b
//        ..defaultPage = Page.diet
//      )
//    ).toBuilder()
//  );
//
//  final UserDataLoaded userDataStateB = UserDataLoaded((b) => b
//    ..authentication = userA
//    ..userDocument = userDocumentA.toBuilder()
//    ..settings = Settings((b) => b
//      ..navigationSettings = NavigationSettings((b) => b
//        ..defaultPage = Page.recipes
//      )
//    ).toBuilder()
//  );
//
//  setUp(() {
//    analyticsRepository = MockAnalyticsRepository();
//    userDataBloc = MockUserDataBlock();
//
//    // User stub
//    when(userA.uid).thenReturn("1234");
//    when(userA.email).thenReturn("example@gmail.com");
//    when(userA.displayName).thenReturn("John Smith");
//
//    when(userDataBloc.state).thenAnswer((_) =>
//      Observable<UserDataState>.fromIterable([])
//    );
//
//    navigationBloc = NavigationBloc(analyticsRepository: analyticsRepository, userDataBloc: userDataBloc);
//  });
//
//  test("Initialize properly", () {
//    expect(navigationBloc.initialState, NavigationUninitialized());
//  });
//
//  test("Go to default page", () {
//    // Only need to check logic from within the same user as switching users re-instantiates navigation bloc
//    when(userDataBloc.state).thenAnswer((_) =>
//      Observable<UserDataState>.fromIterable([
//        UserDataUninitialized(),
//        UserDataLoading(),
//        userDataStateA,
//        userDataStateB
//      ])
//    );
//    navigationBloc = NavigationBloc(analyticsRepository: analyticsRepository, userDataBloc: userDataBloc);
//
//    expectLater(
//      navigationBloc.state,
//      emitsInOrder(<NavigationState>[
//        NavigationUninitialized(),
//        NavigationLoaded((b) => b..currentPage = Page.diet),
////        emitsDone // should succeed => timeout
//      ])
//    ).then((_) {
//      verify(analyticsRepository.navigateToScreen(Page.diet.name)).called(1);
//      // Don't go to default page unless going from uninitialized
//      verifyNever(analyticsRepository.navigateToScreen(Page.recipes.name));
//    });
//  });
//
//  test("Navigate to page", () async {
//    when(userDataBloc.state).thenAnswer((_) =>
//      Observable<UserDataState>.fromIterable([
//        UserDataUninitialized(),
//        UserDataLoading(),
//        userDataStateA
//      ])
//    );
//    navigationBloc = NavigationBloc(analyticsRepository: analyticsRepository, userDataBloc: userDataBloc);
//
//    expectLater(
//      navigationBloc.state,
//      emitsInOrder(<NavigationState>[
//        NavigationUninitialized(),
//        NavigationLoaded((b) => b..currentPage = Page.diet), // default page
//        NavigationLoaded((b) => b..currentPage = Page.track),
//        NavigationLoaded((b) => b..currentPage = Page.recipes),
//        NavigationLoaded((b) => b..currentPage = Page.diet),
//      ])
//    ).then((_) {
//      verify(analyticsRepository.navigateToScreen(Page.diet.name)).called(2);
//      verify(analyticsRepository.navigateToScreen(Page.track.name)).called(1);
//      verify(analyticsRepository.navigateToScreen(Page.recipes.name)).called(1);
//      verifyNever(analyticsRepository.navigateToScreen(Page.diary.name));
//    });
//
//    // Need time for asynchronous default page event to run
//    await Future<dynamic>.delayed(Duration(milliseconds: 10));
//    navigationBloc.dispatch(NavigateToPage((b) => b..page = Page.track));
//    navigationBloc.dispatch(NavigateToPage((b) => b..page = Page.recipes));
//    navigationBloc.dispatch(NavigateToPage((b) => b..page = Page.diet));
//  });
//}

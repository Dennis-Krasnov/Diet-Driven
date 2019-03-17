import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/blocs/blocs.dart';

import 'test_utils.dart';

void main() {
  NavigationBloc navigationBloc;

  setUp(() {
    navigationBloc = NavigationBloc();
  });

  test("Initial state is correct", () {
    expect(navigationBloc.initialState, NavigationState((b) => b
//      TODO
    ));
  });

  test("Dispose doesn't emit new state", () {
    expectLater(navigationBloc.state, doesNotEmit);
    navigationBloc.dispose();
  });

  group("Navigate to page", () {
    test("Goes to same page", () {
      expectLater(
          navigationBloc.state,
          emitsInOrder([
            NavigationState((b) => b), // TODO: create default builder!
            LoginLoading(),
            LoginInitial(),
          ])
      ).then((_) { // TODO: use async await
//        neverCalled // TODO: doesn't log in analytics
//        verify(authenticationBloc.dispatch(LoggedIn((b) => b..user = user))).called(1);
      });

      navigationBloc.dispatch(NavigateToPage((b) => b
        ..page = b.page
      ));
    });

    test("Goes to different page", () {

    });
  });

  group("Reorder bottom navigation", () {

  });

}
/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  NavigationBloc sut;

  /// Mocks
  UserDataBloc userDataBloc;
  AnalyticsRepository analyticsRepository;

  /// Data
  final userDataStates = <UserDataState>[
    UserDataUninitialized(),
    UserDataUnauthenticated(),
    // TODO: put this (with settingsFull) in utils, only rebuild settings/whatever's needed for given test
    UserDataLoaded((b) => b
      ..authentication = Authentication((b) => b
        ..uid = "1234"
        ..isAnonymous = true
        ..isEmailVerified = false
      ).toBuilder()
      ..userDocument = UserDocumentBuilder()
      ..settings = Settings((b) => b
        ..navigationSettings = NavigationSettings((b) => b
          ..bottomNavigationPages = ListBuilder(<Page>[Page.diary, Page.reports, Page.track])
          ..defaultPage = Page.reports
        ).toBuilder()
      ).toBuilder()
      ..userSettings = SettingsBuilder()
      ..subscription = SubscriptionType.all_access
    ),
    // TODO: put second userDataLoaded, but with different default page??
    UserDataUnauthenticated(),
  ];

  final pageDeepLinks = BuiltMap<Page, BuiltList<DeepLink>>(<Page, BuiltList<DeepLink>>{
    Page.diary: BuiltList(<DeepLink>[DiaryDeepLink.today()]),
    Page.track: BuiltList(<DeepLink>[]),
    Page.reports: BuiltList(<DeepLink>[]),
    Page.settings: BuiltList(<DeepLink>[SettingsDeepLink()]),
  });

  NavigationRoute generateNavigationRoute(Page page, bool animate, [List<DeepLink> deepLinks]) => NavigationRoute((b) => b
    ..page = page
    ..pageDeepLinks = (pageDeepLinks.toBuilder()..updateValue(page, (_old) => deepLinks != null ? BuiltList<DeepLink>(deepLinks) : _old))
    ..shouldAnimate = animate
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    userDataBloc = MockUserDataBloc();
    when(userDataBloc.state).thenAnswer((_) => Stream.fromIterable(userDataStates));

    analyticsRepository = MockAnalyticsRepository();

    sut = NavigationBloc(
      analyticsRepository: analyticsRepository,
      userDataBloc: userDataBloc
    );
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialState, NavigationUninitialized());
  });

  // TODO: test analytics events for all events!!!
  // TODO: test failure navigating to pages not in bottomNavigationStates, solution: only allow rearranging pages?

  test("Navigate to default page on initialization", () {
    expectLater(
      sut.state,
      emitsInOrder(<NavigationState>[
        NavigationUninitialized(),
        generateNavigationRoute(Page.reports, false),
      ])
    );

    sut.dispatch(InitNavigation());
  });

  group("Page navigation", () {
    test("Navigate to diary page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          generateNavigationRoute(Page.reports, false),
          generateNavigationRoute(Page.diary, false),
          generateNavigationRoute(Page.diary, false, [
            DiaryDeepLink((b) => b
              ..date = 2523
            ),
          ]),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(SwitchTab((b) => b
        ..to = Page.diary
      ));
      sut.dispatch(Navigate((b) => b
        ..page = Page.diary
        ..deepLinks = ListBuilder(<DeepLink>[DiaryDeepLink((b) => b
          ..date = 2523
        )])
      ));
    });

    test("Navigate to tracking page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          generateNavigationRoute(Page.reports, false),
          generateNavigationRoute(Page.track, false),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(SwitchTab((b) => b
        ..to = Page.track
      ));
    });

    test("Navigate to reports page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          generateNavigationRoute(Page.reports, false),
          generateNavigationRoute(Page.diary, false),
          generateNavigationRoute(Page.reports, false),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      // Navigate away from default page
      sut.dispatch(SwitchTab((b) => b
        ..to = Page.diary
      ));
      sut.dispatch(SwitchTab((b) => b
        ..to = Page.reports
      ));
    });

    test("Navigate to settings page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          generateNavigationRoute(Page.reports, false),
          generateNavigationRoute(Page.settings, false),
          generateNavigationRoute(Page.settings, true, [
            SettingsDeepLink(),
            ThemeSettingsDeepLink(),
          ]),
          generateNavigationRoute(Page.settings, true, [
            SettingsDeepLink(),
            DiarySettingsDeepLink(),
          ]),
          generateNavigationRoute(Page.settings, false),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(SwitchTab((b) => b
        ..to = Page.settings
      ));
      sut.dispatch(Push((b) => b
        ..deepLink = ThemeSettingsDeepLink()
      ));
      sut.dispatch(Navigate((b) => b
        ..page = Page.settings
        ..deepLinks = ListBuilder(<DeepLink>[SettingsDeepLink(), DiarySettingsDeepLink()])
      ));
      sut.dispatch(Pop());
    });
  });
}

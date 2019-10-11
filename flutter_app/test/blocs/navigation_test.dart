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
          ..bottomNavigationPages = ListBuilder(<Page>[Page.diary, Page.reports, Page.recipes])
          ..defaultPage = Page.reports
        ).toBuilder()
      ).toBuilder()
      ..userSettings = SettingsBuilder()
      ..subscription = SubscriptionType.all_access
    ),
    // TODO: put second userDataLoaded, but with different default page??
    UserDataUnauthenticated(),
  ];

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

  test("Navigate to default page on initialization", () {
    expectLater(
      sut.state,
      emitsInOrder(<NavigationState>[
        NavigationUninitialized(),
        ReportsTab(),
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
          ReportsTab(),
          DiaryTab(),
          DiaryTab((b) => b
            ..deepLink = ListBuilder(<DeepLink>[ValueDeepLink<int>((b) => b
              ..path = "diary"
              ..data = 24
            )])
          ),
          DiaryTab((b) => b
            ..deepLink = ListBuilder(<DeepLink>[ValueDeepLink<int>((b) => b
              ..path = "diary"
              ..data = 35
            )])
            ..previousDeepLink = ListBuilder(<DeepLink>[ValueDeepLink<int>((b) => b
              ..path = "diary"
              ..data = 24
            )])
          ),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(NavigateToDiary());
      sut.dispatch(NavigateToDiary.day(24));
      sut.dispatch(NavigateToDiary.day(35));
    });

    test("Navigate to tracking page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          TrackTab(),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(NavigateToTrack());
    });

    test("Navigate to reports page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          DiaryTab(),
          ReportsTab(),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      // Navigate away from default page
      sut.dispatch(NavigateToDiary());
      sut.dispatch(NavigateToReports());
    });

    test("Navigate to settings page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          SettingsTab(),
          SettingsTab((b) => b
            ..deepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "general")])
          ),
          SettingsTab((b) => b
            ..deepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "theme")])
            ..previousDeepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "general")])
          ),
          SettingsTab((b) => b
            ..deepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "diary")])
            ..previousDeepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "theme")])
          ),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(NavigateToSettings());
      sut.dispatch(NavigateToSettings.general());
      sut.dispatch(NavigateToSettings.theme());
      sut.dispatch(NavigateToSettings.diary());
    });

    // TODO: remove completely!
    test("Navigate to logging page", () async {
      expectLater(
        sut.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          LoggingTab(),
        ])
      );

      sut.dispatch(InitNavigation());

      await delay(1);
      sut.dispatch(NavigateToLogging());
    });
  });
}

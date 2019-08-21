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
  NavigationBloc navigationBloc;

  /// Mocks
  AnalyticsRepository analyticsRepository;
  UserDataBloc userDataBloc;

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

    analyticsRepository = MockAnalyticsRepository();
    userDataBloc = MockUserDataBloc();

    when(userDataBloc.state).thenAnswer((_) => Stream.fromIterable(userDataStates));

    navigationBloc = NavigationBloc(
      analyticsRepository: analyticsRepository,
      userDataBloc: userDataBloc
    );
  });

  /// Tests
  test("Initialize properly", () {
    expect(navigationBloc.initialState, NavigationUninitialized());
  });

  // TODO: test analytics events for all events!!!
  test("Navigate to default page", () {
    expectLater(
      navigationBloc.state,
      emitsInOrder(<NavigationState>[
        NavigationUninitialized(),
        ReportsTab(),
      ])
    );

    navigationBloc.dispatch(InitNavigation());
  });

  group("Navigate to pages", () {
    test("Diary page", () async {
      expectLater(
        navigationBloc.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          DiaryTab(),
          DiaryTab((b) => b
            ..deepLink = DateDeepLink((b) => b
              ..date = 24
            )
          ),
          DiaryTab(),
        ])
      );

      // Wait for bloc to be fully initialized
      navigationBloc.dispatch(InitNavigation());
      await Future<void>.delayed(ticks(1));

      navigationBloc.dispatch(NavigateToDiary());
      navigationBloc.dispatch(NavigateToDiary((b) => b
        ..deepLink = DateDeepLink((b) => b
          ..date = 24
        )
      ));
      navigationBloc.dispatch(ClearDeepLink());
    });

    test("Tracking page", () async {
      expectLater(
        navigationBloc.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          TrackTab(),
        ])
      );

      // Wait for bloc to be fully initialized
      navigationBloc.dispatch(InitNavigation());
      await Future<void>.delayed(ticks(1));

      navigationBloc.dispatch(NavigateToTrack());
      navigationBloc.dispatch(ClearDeepLink());
    });

    test("Reports page", () async {
      expectLater(
        navigationBloc.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          DiaryTab(),
          ReportsTab(),
        ])
      );

      // Wait for bloc to be fully initialized
      navigationBloc.dispatch(InitNavigation());
      await Future<void>.delayed(ticks(1));

      navigationBloc.dispatch(NavigateToDiary());
      navigationBloc.dispatch(NavigateToReports());
      navigationBloc.dispatch(ClearDeepLink());
    });

    test("Settings page", () async {
      expectLater(
        navigationBloc.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          SettingsTab(),
          SettingsTab((b) => b
            ..deepLink = ProfileDeepLink()
          ),
          SettingsTab((b) => b
            ..deepLink = ThemeDeepLink()
          ),
          SettingsTab((b) => b
            ..deepLink = DiarySettingsDeepLink()
          ),
          SettingsTab(),
        ])
      );

      // Wait for bloc to be fully initialized
      navigationBloc.dispatch(InitNavigation());
      await Future<void>.delayed(ticks(1));

      navigationBloc.dispatch(NavigateToSettings());
      navigationBloc.dispatch(NavigateToSettings((b) => b
        ..deepLink = ProfileDeepLink()
      ));
      navigationBloc.dispatch(NavigateToSettings((b) => b
        ..deepLink = ThemeDeepLink()
      ));
      navigationBloc.dispatch(NavigateToSettings((b) => b
        ..deepLink = DiarySettingsDeepLink()
      ));
      navigationBloc.dispatch(ClearDeepLink());
    });

    test("Logging page", () async {
      expectLater(
        navigationBloc.state,
        emitsInOrder(<NavigationState>[
          NavigationUninitialized(),
          ReportsTab(),
          LoggingTab(),
        ])
      );

      // Wait for bloc to be fully initialized
      navigationBloc.dispatch(InitNavigation());
      await Future<void>.delayed(ticks(1));

      navigationBloc.dispatch(NavigateToLogging());
      navigationBloc.dispatch(ClearDeepLink());
    });
  });
}

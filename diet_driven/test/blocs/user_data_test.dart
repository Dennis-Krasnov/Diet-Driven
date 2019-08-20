/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  UserDataBloc userDataBloc;

  /// Mocks
  UserRepository userRepository;
  SettingsRepository settingsRepository;

  /// Data
  final userA = Authentication((b) => b
    ..uid = "1234"
    ..isAnonymous = true
    ..isEmailVerified = false
  );

  final userB = Authentication((b) => b
    ..uid = "6789"
    ..isAnonymous = true
    ..isEmailVerified = false
  );

  final userDocument = UserDocument();

  final settingsLight = Settings((b) => b
    ..themeSettings = ThemeSettings((b) => b
      ..darkMode = false
    ).toBuilder()
  );

  final settingsDark = Settings((b) => b
    ..themeSettings = ThemeSettings((b) => b
      ..darkMode = true
    ).toBuilder()
  );

  /// Configuration
  setUp(() {
    userRepository = MockUserRepository();
    settingsRepository = MockSettingsRepository();

    userDataBloc = UserDataBloc(
      userRepository: userRepository,
      settingsRepository: settingsRepository,
    );
  });

  tearDown(() {
    userDataBloc?.dispose();
  });

  /// Tests
  test("Initialize properly", () {
    expect(userDataBloc.initialState, UserDataUninitialized());
  });

  // TODO: verify that repository.streams() are called just once

  group("React to streams", () {
    test("Authentication stream", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA, null, userB]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userB.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

    test("Data arrival stream", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      // TODO: different values for user document
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromFutures([
        Future.value(userDocument),
        Future.delayed(ticks(2), () => userDocument), // Duplicate
      ]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromFutures([
        Future.value(settingsLight),
        Future.delayed(ticks(1), () => settingsDark),
        Future.delayed(ticks(2), () => settingsDark), // Duplicate
      ]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));
      // TODO: also mock subscription arriving at different times

      expectLater(
        userDataBloc.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsDark.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          UserDataUnauthenticated(),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

  });

  group("Merge user and default settings", () {
    test("Exclusively use default settings", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

    test("Use mix of user and default settings", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([Settings((b) => b
        ..themeSettings = ThemeSettings((b) => b
          ..darkMode = false
          ..primaryColour = "pink <3"
        ).toBuilder()
      )]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([settingsDark]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = Settings((b) => b
              ..themeSettings = ThemeSettings((b) => b
                ..darkMode = true // From user settings
                ..primaryColour = "pink <3" // From default settings
              ).toBuilder()
            ).toBuilder()
            ..userSettings = settingsDark.toBuilder()
            ..subscription = SubscriptionType.all_access
          ),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

    test("Exclusively use user settings", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([settingsDark]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsDark.toBuilder()
            ..userSettings = settingsDark.toBuilder()
            ..subscription = SubscriptionType.all_access
          ),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });
  });

  group("Handle runtime exceptions", () {
    test("Fail on user document error", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromFutures([
        Future.value(userDocument),
        Future.delayed(ticks(1), () => Future.error(Exception("User document failed"))), // Ends at first error
        Future.delayed(ticks(2), () => Future.error(Exception("User document failed 2"))),
      ]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<dynamic>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          BuiltErrorMatcher("User document failed"),
          UserDataUnauthenticated(),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

    test("Fail on settings error", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromFutures([
        Future.value(settingsLight),
        Future.delayed(ticks(1), () => Future.error(Exception("Settings failed"))), // Ends at first error
        Future.delayed(ticks(2), () => Future.error(Exception("Settings failed 2"))),
      ]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<dynamic>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          BuiltErrorMatcher("Settings failed"),
          UserDataUnauthenticated(),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });
  });
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  UserDataBloc sut;

  /// Mocks
  UserRepository userRepository;
  SettingsRepository settingsRepository;

  // TODO: move common data to data file!!!

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

  // TODO: different values for user document
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
    BlocSupervisor.delegate = LoggingBlocDelegate();

    userRepository = MockUserRepository();
    settingsRepository = MockSettingsRepository();

    sut = UserDataBloc(
      userRepository: userRepository,
      settingsRepository: settingsRepository,
    );
  });

  tearDown(() => sut?.dispose());

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialState, UserDataUninitialized());
  });

  test("Yield error state on invalid events", () async {
    expectLater(
      sut.state,
      emitsInOrder(<dynamic>[
        UserDataUninitialized(),
        BuiltErrorMatcher("User data bloc must be loaded"),
        BuiltErrorMatcher("User data bloc must be loaded"),
      ])
    );

    sut.dispatch(UpdateDarkMode((b) => b
      ..darkMode = true
    ));

    await delay(1);
    sut.dispatch(UpdatePrimaryColour((b) => b
      ..colourValue = 0xffb76b01
    ));
  });

  // TODO
//  test("Yield error state on invalid events", () async {
//    sut.dispatch(UpdateDarkMode((b) => b
//      ..darkMode = true
//    ));
//
//    await delay(1);
//    sut.dispatch(UpdatePrimaryColour((b) => b
//      ..colourValue = 0xffb76b01
//    ));
//
//    await sut.emits([
//      UserDataUninitialized(),
//      BuiltErrorMatcher("User data bloc must be loaded"),
//      BuiltErrorMatcher("User data bloc must be loaded"),
//    ]);
//  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid authentication stream", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStream([null, userA, null, userB]);
      when(userRepository.userDocument$(any)).stream([userDocument]);
      when(settingsRepository.defaultSettings$()).stream([settingsLight]);
      when(settingsRepository.userSettings$(any)).stream([null]);

      expectLater(
        sut.state,
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

      sut.dispatch(InitUserData());
    });

    test("Yield loaded state for valid streams", () {
      // Must be broadcast stream
      // TODO: extension: thenBroadcastAnswer((_) async* {
      //   yield null;
      //   yield userA;
      //
      //   await delay(5);
      //   yield null;
      // });
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(5)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) async* {
        yield userDocument;

        // TODO: await 2.ticks;
        await delay(2);
        yield userDocument;
      });
      when(settingsRepository.defaultSettings$()).thenAnswer((_) async* {
        yield settingsLight;

        await delay(1);
        yield settingsDark;

        await delay(2);
        yield settingsLight;
      });
      when(settingsRepository.userSettings$(any)).stream([null]);
//      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));
      // TODO: also mock subscription arriving at different times

      expectLater(
        sut.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          // Tick #0
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          // Tick #1
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsDark.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          // Tick #2
          // TODO: also change user document, as it the bloc takes distinct states!
//          UserDataLoaded((b) => b
//            ..authentication = userA.toBuilder()
//            ..userDocument = UserDocumentBuilder()
//            ..settings = settingsDark.toBuilder()
//            ..userSettings = SettingsBuilder()
//            ..subscription = SubscriptionType.all_access
//          ),
          // Tick #3
          UserDataLoaded((b) => b
            ..authentication = userA.toBuilder()
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..userSettings = SettingsBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          // Tick #5
          UserDataUnauthenticated(),
        ])
      );

      sut.dispatch(InitUserData());
    });

    test("Yield error state on errorous user document stream", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) async* {
        yield userDocument;

        await delay(1);
        throw Exception("User document failed");
      });
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        sut.state,
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

      sut.dispatch(InitUserData());
    });

    test("Yield error state on errorous default settings stream", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) async* {
        yield settingsLight;

        await delay(1);
        throw Exception("Default settings failed");
      });
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        sut.state,
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
          BuiltErrorMatcher("Default settings failed"),
          UserDataUnauthenticated(),
        ])
      );

      sut.dispatch(InitUserData());
    });

    // TODO: same for user settings?!
  });

  group("UserDataBloc::_mergeSettings", () {
    test("Merge using exclusively default settings", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

      expectLater(
        sut.state,
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

      sut.dispatch(InitUserData());
    });

    test("Merge using mix of user and default settings", () {
      // Must be broadcast stream
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
        sut.state,
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

      sut.dispatch(InitUserData());
    });

    test("Merge using exclusively use user settings", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
      when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsLight]));
      when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([settingsDark]));

      expectLater(
        sut.state,
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

      sut.dispatch(InitUserData());
    });
  });
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../utils/utils.dart';

void main() {
  UserDataBloc sut;

  /// Mocks
  UserRepository userRepository;
  SettingsRepository settingsRepository;

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

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialState, UserDataUninitialized());
  });

  test("Yield error state on invalid events", () async {
    sut.expectEmits([
      UserDataUninitialized(),
      BuiltErrorMatcher("User data bloc must be loaded"),
      BuiltErrorMatcher("User data bloc must be loaded"),
    ]);

    sut.add(UpdateDarkMode((b) => b
      ..darkMode = true
    ));

    await 1.tick.delay;
    sut.add(UpdatePrimaryColour((b) => b
      ..colourValue = 0xffb76b01
    ));
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid authentication stream", () async {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStream([null, userA, null, userB]);
      when(userRepository.userDocument$(any)).stream([userDocument]);
      when(settingsRepository.defaultSettings$()).stream([settingsLight]);
      when(settingsRepository.userSettings$(any)).stream([null]);

      sut.add(InitUserData());

      sut.expectEmits(<UserDataState>[
        UserDataUninitialized(),
        UserDataUnauthenticated(),
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = userDocument.toBuilder()
          ..settings = settingsLight.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
        UserDataUnauthenticated(),
        UserDataLoaded((b) => b
          ..authentication = userB.toBuilder()
          ..userDocument = userDocument.toBuilder()
          ..settings = settingsLight.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
      ]);
    });

    test("Yield loaded state for valid streams", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStreamFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        5.ticks.value(null),
      ]);
      when(userRepository.userDocument$(any)).streamFutures([
        Future.value(userDocument),
        2.ticks.value(userDocument),
      ]);
      when(settingsRepository.defaultSettings$()).streamFutures([
        Future.value(settingsLight),
        1.tick.value(settingsDark),
        3.ticks.value(settingsLight),
      ]);
      when(settingsRepository.userSettings$(any)).stream([null]);

      sut.add(InitUserData());

      sut.expectEmits(<UserDataState>[
        UserDataUninitialized(),
        UserDataUnauthenticated(),
        // Tick #0
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = userDocument.toBuilder()
          ..settings = settingsLight.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
        // Tick #1
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = userDocument.toBuilder()
          ..settings = settingsDark.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
        // Tick #2
        // TODO: also change subscription, user document, as it the bloc takes distinct states!
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
          ..userDocument = userDocument.toBuilder()
          ..settings = settingsLight.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
        // Tick #5
        UserDataUnauthenticated(),
      ]);
    });

    test("Yield error state on errorous user document stream", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStreamFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        5.ticks.value(null),
      ]);
      // Must be async generator function
      when(userRepository.userDocument$(any)).thenAnswer((_) async* {
        yield userDocument;

        await 1.tick.delay;
        throw Exception("User document failed");
      });
      when(settingsRepository.defaultSettings$()).stream([settingsLight]);
      when(settingsRepository.userSettings$(any)).stream([null]);

      sut.add(InitUserData());

      sut.expectEmits([
        UserDataUninitialized(),
        UserDataUnauthenticated(),
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = userDocument.toBuilder()
          ..settings = settingsLight.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
        BuiltErrorMatcher("User document failed"),
        UserDataUnauthenticated(),
      ]);
    });

    test("Yield error state on errorous default settings stream", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStreamFutures(<Future<Authentication>>[
        Future.value(),
        Future.value(userA),
        5.ticks.value(null),
      ]);
      when(userRepository.userDocument$(any)).stream([userDocument]);
      // Must be async generator function
      when(settingsRepository.defaultSettings$()).thenAnswer((_) async* {
        yield settingsLight;

        await 1.tick.delay;
        throw Exception("Default settings failed");
      });
      when(settingsRepository.userSettings$(any)).stream([null]);

      sut.add(InitUserData());

      sut.expectEmits([
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
      ]);
    });
  });

  group("UserDataBloc::_saveUserSettings", () {
    Completer<void> completer;

    setUp(() {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStream([null, userA]);
      when(userRepository.userDocument$(any)).stream([userDocument]);

      when(settingsRepository.defaultSettings$()).stream([settingsFull]);
      when(settingsRepository.userSettings$(any)).stream([null]);

      completer = Completer();
    });

    test("Update setting", () async {
      sut.add(InitUserData());

      await 1.tick.delay;
      sut.add(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);
    });

    test("Reject completer on setting update error", () async {
      when(settingsRepository.saveSettings(any, any)).thenThrow(eventFailedException);

      sut.add(InitUserData());

      await 1.tick.delay;
      sut.add(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);
    });

    test("Call settings repository", () async {
      sut.add(InitUserData());

      await 1.tick.delay;
      sut.add(UpdateDarkMode((b) => b..darkMode = true));
      sut.add(UpdatePrimaryColour((b) => b..colourValue = 1234));

      await 1.tick.delay;
      verify(settingsRepository.saveSettings(userA.uid, any)).called(2);
    });
  });

  group("UserDataBloc::_mergeSettings", () {
    test("Merge using exclusively default settings", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStream([null, userA]);
      when(userRepository.userDocument$(any)).stream([userDocument]);
      when(settingsRepository.defaultSettings$()).stream([settingsLight]);
      when(settingsRepository.userSettings$(any)).stream([null]);

      sut.add(InitUserData());

      sut.expectEmits(<UserDataState>[
        UserDataUninitialized(),
        UserDataUnauthenticated(),
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = UserDocumentBuilder()
          ..settings = settingsLight.toBuilder()
          ..userSettings = SettingsBuilder()
          ..subscription = SubscriptionType.all_access
        ),
      ]);
    });

    test("Merge using mix of user and default settings", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStream([null, userA]);
      when(userRepository.userDocument$(any)).stream([userDocument]);
      when(settingsRepository.defaultSettings$()).stream([
        Settings((b) => b
          ..theme = ThemeSettings((b) => b
            ..darkMode = false
            ..primaryColour = "pink <3"
          ).toBuilder()
        ),
      ]);
      when(settingsRepository.userSettings$(any)).stream([settingsDark]);

      sut.add(InitUserData());

      sut.expectEmits(<UserDataState>[
        UserDataUninitialized(),
        UserDataUnauthenticated(),
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = UserDocumentBuilder()
          ..settings = Settings((b) => b
            ..theme = ThemeSettings((b) => b
              ..darkMode = true // From user settings
              ..primaryColour = "pink <3" // From default settings
            ).toBuilder()
          ).toBuilder()
          ..userSettings = settingsDark.toBuilder()
          ..subscription = SubscriptionType.all_access
        ),
      ]);
    });

    test("Merge using exclusively use user settings", () {
      // Must be broadcast stream
      when(userRepository.authStateChanged$()).broadcastStream([null, userA]);
      when(userRepository.userDocument$(any)).stream([userDocument]);
      when(settingsRepository.defaultSettings$()).stream([settingsLight]);
      when(settingsRepository.userSettings$(any)).stream([settingsDark]);

      sut.add(InitUserData());

      sut.expectEmits(<UserDataState>[
        UserDataUninitialized(),
        UserDataUnauthenticated(),
        UserDataLoaded((b) => b
          ..authentication = userA.toBuilder()
          ..userDocument = UserDocumentBuilder()
          ..settings = settingsDark.toBuilder()
          ..userSettings = settingsDark.toBuilder()
          ..subscription = SubscriptionType.all_access
        ),
      ]);
    });
  });
}

// TODO: bloc extensions!
// possibly even without ()
// var fooBloc = context.bloc<FooBloc>();
// var barRepo = context.repo<BarRepo>();

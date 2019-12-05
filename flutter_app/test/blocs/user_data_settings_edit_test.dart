/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:diet_driven/navigation/navigation.dart';
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
  Completer<void> completer;

  /// Data
  final user = Authentication((b) => b
    ..uid = "1234"
    ..isAnonymous = true
    ..isEmailVerified = false
  );

  final userDocument = UserDocument();

  final Settings settingsFull = Settings((b) => b
    ..navigationSettings = NavigationSettings((b) => b
//      ..defaultPage = DiaryDateDL.today()
//      ..bottomNavigationPages = ListBuilder(<DeepLink>[
//        DiaryDateDL.today(),
//        MeasureDL(),
//        ReportsDL(),
//        UserDL("TODO"),
//      ])
    ).toBuilder()
    ..themeSettings = ThemeSettings((b) => b
      ..darkMode = false
      ..primaryColour = "dark blue"
    ).toBuilder()
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    userRepository = MockUserRepository();
    // Must be broadcast stream
    when(userRepository.authStateChanged$()).broadcastStream([null, user]);
    when(userRepository.userDocument$(any)).stream([userDocument]);

    settingsRepository = MockSettingsRepository();
    when(settingsRepository.defaultSettings$()).stream([settingsFull]);
    when(settingsRepository.userSettings$(any)).stream([null]);

    completer = Completer();

    sut = UserDataBloc(
      userRepository: userRepository,
      settingsRepository: settingsRepository,
    );
  });

  // TODO: all like this!
  tearDown(() => sut?.dispose());

  /// Tests
  group("Dark mode updates", () {
    test("Update dark mode", () async {
      sut.dispatch(InitUserData());

      await delay(1);
      sut.dispatch(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(settingsRepository.saveSettings(
        user.uid,
        (SettingsBuilder()..themeSettings.update((b) => b
          ..darkMode = true
        )).build()
      )).called(1);
    });

    test("Reject completer on dark mode update error", () async {
      when(settingsRepository.saveSettings(any, any)).thenThrow(eventFailedException);

      sut.dispatch(InitUserData());

      await delay(1);
      sut.dispatch(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(settingsRepository.saveSettings(
        user.uid,
        (SettingsBuilder()..themeSettings.update((b) => b
          ..darkMode = true
        )).build()
      )).called(1);
    });
  });

  group("Primary colour updates", () {
    test("Update primary colour", () async {
      sut.dispatch(InitUserData());

      await delay(1);
      sut.dispatch(UpdatePrimaryColour((b) => b
        ..colourValue = 0xffb76b01
        ..completer = completer
      ));

      await expectLater(completer.future, completes);
      expect(completer.isCompleted, true);

      verify(settingsRepository.saveSettings(
        user.uid,
        (SettingsBuilder()..themeSettings.update((b) => b
          ..primaryColour = "0xffb76b01"
        )).build()
      )).called(1);
    });

    // FIXME: colour doesn't change, but colour picker UI still updates... TODO: recreate colour selection package myself
    test("Reject completer on primary colour update error", () async {
      when(settingsRepository.saveSettings(any, any)).thenThrow(eventFailedException);

      sut.dispatch(InitUserData());

      await delay(1);
      sut.dispatch(UpdatePrimaryColour((b) => b
        ..colourValue = 0xffb76b01
        ..completer = completer
      ));

      await expectLater(completer.future, throwsException);
      expect(completer.isCompleted, true);

      verify(settingsRepository.saveSettings(
        user.uid,
        (SettingsBuilder()..themeSettings.update((b) => b
          ..primaryColour = "0xffb76b01"
        )).build()
      )).called(1);
    });
  });
}

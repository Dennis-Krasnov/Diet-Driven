import 'dart:async';

import 'package:built_collection/built_collection.dart';
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
      ..defaultPage = Page.reports
      ..bottomNavigationPages = ListBuilder(<Page>[
        Page.reports,
        Page.diary,
        Page.logging,
      ])
    ).toBuilder()
    ..themeSettings = ThemeSettings((b) => b
      ..darkMode = false
      ..primaryColour = "dark blue"
    ).toBuilder()
  );

  final expectedState = <UserDataState>[
    UserDataUninitialized(),
    UserDataUnauthenticated(),
    UserDataLoaded((b) => b
      ..authentication = user.toBuilder()
      ..userDocument = UserDocumentBuilder()
      ..settings = settingsFull.toBuilder()
      ..userSettings = SettingsBuilder()
      ..subscription = SubscriptionType.all_access
    ),
    UserDataUnauthenticated(),
  ];

  /// Configuration
  setUp(() {
    userRepository = MockUserRepository();
    settingsRepository = MockSettingsRepository();
    completer = Completer();

    when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
      Future.value(),
      Future.value(user),
      Future.delayed(ticks(3)),
    ]).asBroadcastStream());
    when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([userDocument]));
    when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromFutures([
      Future.value(userDocument),
      Future.delayed(ticks(2), () => userDocument), // Duplicate
    ]));
    when(settingsRepository.defaultSettings$()).thenAnswer((_) => Stream.fromIterable([settingsFull]));
    when(settingsRepository.userSettings$(any)).thenAnswer((_) => Stream.fromIterable([null]));

    userDataBloc = UserDataBloc(
      userRepository: userRepository,
      settingsRepository: settingsRepository,
    );
  });

  tearDown(() {
    userDataBloc?.dispose();
  });

  /// Tests
  group("Update dark mode", () {
    test("Sucessfully update", () async {
      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((_) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..darkMode = true
        );

        verify(settingsRepository.replaceSettings(user.uid, settingsBuilder.build())).called(1);
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));
    });

    test("Fail on update error", () async {
      // TODO: making throw a lambda no longer throws in-place!!!
      when(settingsRepository.replaceSettings(any, any)).thenThrow(() => Exception("Update failed"));

      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((_) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..darkMode = true
        );

        verify(settingsRepository.replaceSettings(user.uid, settingsBuilder.build())).called(1);
        expect(completer.isCompleted, false);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdateDarkMode((b) => b
        ..darkMode = true
        ..completer = completer
      ));
    });
  });

  group("Update primary colour", () {
    test("Sucessfully update", () async {
      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((_) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..primaryColour = "0xffb76b01"
        );

        verify(settingsRepository.replaceSettings(user.uid, settingsBuilder.build())).called(1);
        expect(completer.isCompleted, true);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdatePrimaryColour((b) => b
        ..colourValue = 0xffb76b01
        ..completer = completer
      ));
    });

    test("Fail on update error", () async {
      // TODO: making throw a lambda no longer throws in-place!!!
      when(settingsRepository.replaceSettings(any, any)).thenThrow(() => Exception("Update failed"));

      expectLater(
        userDataBloc.state,
        emitsInOrder(expectedState),
      ).then((_) {
        final settingsBuilder = SettingsBuilder()..themeSettings.update((b) => b
          ..primaryColour = "0x00ffff00" // Converts to lower case
        );

        verify(settingsRepository.replaceSettings(user.uid, settingsBuilder.build())).called(1);
        expect(completer.isCompleted, false);
      });

      // Wait for bloc to be fully initialized
      userDataBloc.dispatch(InitUserData());
      await Future<void>.delayed(ticks(1));

      userDataBloc.dispatch(UpdatePrimaryColour((b) => b
        ..colourValue = 0xFFFF00
        ..completer = completer
      ));
    });
  });
}

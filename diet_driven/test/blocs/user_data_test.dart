import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
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
  final userA = FirebaseUserMock();
  final userB = FirebaseUserMock();

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

    when(userA.uid).thenReturn("Jimmy");
    when(userB.uid).thenReturn("Bobby");

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
  // TOTEST: merging settings documents!!!
  group("React to streams", () {
    test("Authentication stream", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, userA, null, userB]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([UserDocument()]));
      when(settingsRepository.settings$(any)).thenAnswer((_) => Stream.fromIterable([settingsLight]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<UserDataState>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userB
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..subscription = SubscriptionType.all_access
          ),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

    test("Data arrival stream", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<FirebaseUser>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      // TODO: different values for user document
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromFutures([
        Future.value(UserDocument()),
        Future.delayed(ticks(2), () => UserDocument()), // Duplicate
      ]));
      when(settingsRepository.settings$(any)).thenAnswer((_) => Stream.fromFutures([
        Future.value(settingsLight),
        Future.delayed(ticks(1), () => settingsDark),
        Future.delayed(ticks(2), () => settingsDark), // Duplicate
      ]));

      // TODO: also mock subscription arriving at different times

      expectLater(
          userDataBloc.state,
          emitsInOrder(<UserDataState>[
            UserDataUninitialized(),
            UserDataUnauthenticated(),
            UserDataLoaded((b) => b
              ..authentication = userA
              ..userDocument = UserDocumentBuilder()
              ..settings = settingsLight.toBuilder()
              ..subscription = SubscriptionType.all_access
            ),
            UserDataLoaded((b) => b
              ..authentication = userA
              ..userDocument = UserDocumentBuilder()
              ..settings = settingsDark.toBuilder()
              ..subscription = SubscriptionType.all_access
            ),
            UserDataUnauthenticated(),
          ])
      );

      userDataBloc.dispatch(InitUserData());
    });

  });

  group("Handle runtime exceptions", () {
    test("Fail on user document error", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<FirebaseUser>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromFutures([
        Future.value(UserDocument()),
        Future.delayed(ticks(1), () => Future.error(Exception("User document failed"))), // Ends at first error
        Future.delayed(ticks(2), () => Future.error(Exception("User document failed 2"))),
      ]));
      when(settingsRepository.settings$(any)).thenAnswer((_) => Stream.fromIterable([settingsLight]));

      expectLater(
        userDataBloc.state,
        emitsInOrder(<dynamic>[
          UserDataUninitialized(),
          UserDataUnauthenticated(),
          UserDataLoaded((b) => b
            ..authentication = userA
            ..userDocument = UserDocumentBuilder()
            ..settings = settingsLight.toBuilder()
            ..subscription = SubscriptionType.all_access
          ),
          BuiltErrorMatcher("User document failed"),
          UserDataUnauthenticated(),
        ])
      );

      userDataBloc.dispatch(InitUserData());
    });

    test("Fail on settings error", () {
      when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<FirebaseUser>>[
        Future.value(),
        Future.value(userA),
        Future.delayed(ticks(3)),
      ]).asBroadcastStream());
      when(userRepository.userDocument$(any)).thenAnswer((_) => Stream.fromIterable([UserDocument()]));
      when(settingsRepository.settings$(any)).thenAnswer((_) => Stream.fromFutures([
        Future.value(settingsLight),
        Future.delayed(ticks(1), () => Future.error(Exception("Settings failed"))), // Ends at first error
        Future.delayed(ticks(2), () => Future.error(Exception("Settings failed 2"))),
      ]));

      expectLater(
          userDataBloc.state,
          emitsInOrder(<dynamic>[
            UserDataUninitialized(),
            UserDataUnauthenticated(),
            UserDataLoaded((b) => b
              ..authentication = userA
              ..userDocument = UserDocumentBuilder()
              ..settings = settingsLight.toBuilder()
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

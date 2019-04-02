import 'package:diet_driven/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:rxdart/rxdart.dart';

import '../test_utils.dart';

void main() {
  // Mocks
  SettingsRepository settingsRepository;
  AuthenticationBloc authenticationBloc;

  SettingsBloc settingsBloc;

  ///
  void mockSettingsBlocSubscription({
      String userId: "1234",
      List<AuthenticationState> authStates: const [],
      List<Settings> settings: const [],
    }) {
    when(authenticationBloc.state).thenAnswer((_) =>
      Observable<AuthenticationState>.fromIterable(authStates)
    );

    when(settingsRepository.settingsDocumentsList(userId)).thenAnswer((_) =>
      Observable<Settings>.fromIterable(settings).shareValue()
    );

    settingsBloc = SettingsBloc(
      settingsRepository: settingsRepository,
      authenticationBloc: authenticationBloc
    );
  }

  setUp(() {
    settingsRepository = MockSettingsRepository();
    authenticationBloc = MockAuthenticationBloc();

    mockSettingsBlocSubscription();
  });

  test("Initial state is correct", () {
    expect(settingsBloc.initialState, SettingsUninitialized());
  });

  group("Manual", () {
    test("Receives settings documents", () {
      expectLater(
        settingsBloc.state,
        emitsInOrder([
          SettingsUninitialized(),
          SettingsLoaded((b) => b
            ..settings = Settings((b) => b
              ..navigationSettings = NavigationSettingsBuilder()
            ).toBuilder()
          ),
        ])
      );

      settingsBloc.dispatch(SettingsArrived((b) => b
        ..settings = Settings((b) => b
          ..navigationSettings = NavigationSettingsBuilder()
        ).toBuilder()
      ));
    });

    test("Doesn't wipe settings if not loaded", () {
      expectLater(
        settingsBloc.state,
        emitsInOrder([
          SettingsUninitialized(),
        ])
      );

      settingsBloc.dispatch(WipeSettings());
    });

    test("Wipes settings if loaded", () {
      expectLater(
        settingsBloc.state,
        emitsInOrder([
          SettingsUninitialized(),
          SettingsLoaded((b) => b
            ..settings = Settings((b) => b
              ..navigationSettings = NavigationSettingsBuilder()
            ).toBuilder()
          ),
          SettingsUninitialized(),
        ])
      );

      settingsBloc.dispatch(SettingsArrived((b) => b
        ..settings = Settings((b) => b
          ..navigationSettings = NavigationSettingsBuilder()
        ).toBuilder()
      ));

      settingsBloc.dispatch(WipeSettings());
    });
  });

  group("Authentication bloc state triggers", () {
    test("Does nothing if unauthenticated", () {
      mockSettingsBlocSubscription(authStates: [
        AuthUninitialized(),
        AuthUnauthenticated()
      ]);

      expectLater(
        settingsBloc.state,
        emitsInOrder([
          SettingsUninitialized(),
        ])
      );
    });

    test("Subscribes to an authenticated user", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");

      mockSettingsBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ],
        settings: [],
      );

      // can't do manual sign in, it's just a mock...

      // OPTIMIZE: need async?
      expectLater(settingsBloc.settingStream, isNotNull);
      expectLater(settingsBloc.settingsSubscription, isNotNull);
    });

    test("Resubscribes to settings on user change", () {
      FirebaseUser userA = FirebaseUserMock();
      when(userA.uid).thenReturn("1234");

      FirebaseUser userB = FirebaseUserMock();
      when(userA.uid).thenReturn("4321"); // FIXME: create another custom rule! (if 4321, return in reverse?)

      authenticationBloc.dispatch(SignIn((b) => b..user = userA));
      var subscriptionA = settingsBloc.settingsSubscription;

      authenticationBloc.dispatch(SignIn((b) => b..user = userB));
      expect(settingsBloc.settingsSubscription, isNot(subscriptionA));
    });
  });

  group("Settings document triggers", () {
    test("Doesn't load settings if none arrived", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");

      mockSettingsBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ],
        settings: []
      );

      expectLater(
        settingsBloc.state,
        emitsInOrder([
          SettingsUninitialized(),
        ])
      );
    });

    test("Loads settings documents", () {
      FirebaseUser user = FirebaseUserMock();
      when(user.uid).thenReturn("1234");

      NavigationSettings navigationSettings = NavigationSettings();

      mockSettingsBlocSubscription(
        authStates: [
          AuthUninitialized(),
          AuthAuthenticated((b) => b..user = user),
        ],
        settings: [
          null,
          Settings((b) => b
            ..navigationSettings = navigationSettings.toBuilder()
          )
        ]
      );

      expectLater(
        settingsBloc.state,
        emitsInOrder([
          SettingsUninitialized(),
          SettingsLoaded((b) => b..settings = Settings((b) => b
            ..navigationSettings = navigationSettings.toBuilder()
          ).toBuilder()),
        ])
      );
    });

  });

}

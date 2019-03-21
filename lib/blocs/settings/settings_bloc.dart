import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/settings/settings.dart';
import 'package:diet_driven/models/models.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;
  final AuthenticationBloc authenticationBloc;

  StreamSubscription<AuthenticationState> authenticationSubscription;

  ValueObservable<UserData> userDataStream;
  StreamSubscription<UserData> userDataSubscription;

  ValueObservable<BuiltList<SettingsDocument>> settingsDocumentStream;
  StreamSubscription<BuiltList<SettingsDocument>> settingsDocumentSubscription;

  ValueObservable<ConfigSettings> configStream;
  StreamSubscription<ConfigSettings> configSubscription;

  SettingsBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    // Reset all settings subscriptions on auth state changed
    authenticationSubscription = authenticationBloc.state.listen((state) {
      if (state is AuthAuthenticated) {
        // Cancel old user settings subscriptions
        userDataSubscription?.cancel();
        settingsDocumentSubscription?.cancel();
        // don't cancel remote config stream based on authentication status

        if (state.user != null) {
          String id = state.user.uid;

          // User data
          userDataStream = settingsRepository.userDataDocument(id);
          userDataSubscription = userDataStream.listen((userData) =>
            dispatch(UserDataArrived((b) => b
              ..userData = userData.toBuilder()
            ))
          );

          // Settings documents
          settingsDocumentStream = settingsRepository.settingsDocumentsList(id);
          settingsDocumentSubscription = settingsDocumentStream.listen((docs) =>
            dispatch(SettingsDocumentsArrived((b) => b
              ..settingsDocuments = docs.toBuilder()
            ))
          );
        }
        else {
          print("authentication changed but no user - don't reload settings"); // TODO: add proper logging
        }
      }
    });
  }

  @override
//  SettingsState get initialState => SettingsUninitialized();
  SettingsState get initialState => SettingsLoaded((b) => b
    ..settings = Settings((b) => b
      ..userData = UserData((b) => b..staleRemoteConfig = false ..currentSubscription = "default").toBuilder()
      ..configSettings = ConfigSettings((b) => b..bonus = 244224).toBuilder()
      ..navigationSettings = NavigationSettings((b) => b..temp = "temp").toBuilder()
    ).toBuilder()
  );

  @override
  void dispose() {
    authenticationSubscription?.cancel();
    userDataSubscription?.cancel();
    settingsDocumentSubscription?.cancel();
    configSubscription?.cancel();
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsState currentState, SettingsEvent event) async* {
    if (event is LoadInitialSettings) {
      yield SettingsLoading();

      // Must be already authenticated!
      assert(authenticationBloc.currentState is AuthAuthenticated);
      assert(userDataSubscription != null);
      assert(settingsDocumentSubscription != null);

      // Waiting for all to finish
      List<Future> futures = [
        userDataStream.isEmpty..then((b) => print("user data arrived $b")),
        settingsDocumentStream.isEmpty..then((b) => print("settings documents arrived $b")),
        Future.delayed(Duration(seconds: 3))
      ];
      await Future.wait(futures);

      print("state is now settings loaded");
      yield SettingsLoaded((b) => b
        ..settings = Settings((b) => b
          ..userData = userDataStream.value.toBuilder()
          ..configSettings = configStream?.value?.toBuilder() ?? ConfigSettings((b) => b..bonus = 1245242).toBuilder() // TODO: init stream from main, remove ?.
          ..navigationSettings = (settingsDocumentStream.value[0] as NavigationSettings).toBuilder()
//            TODO: map settings documents
        ).toBuilder()
      );
    } else {
      // Update existing settings
      if (currentState is SettingsLoaded) { // FIXME
        if (event is UserDataArrived) {
          //
          ConfigSettings newConfig;
          if (event.userData.staleRemoteConfig) {
            newConfig = await settingsRepository.fetchRemoteConfig();
            // Cloud function updates staleRemoteConfig to false (this event will be called twice) TODO
            print("remote config updated");
          }

          print("USER DATA EVENT: $event");

          yield SettingsLoaded((b) => b
            ..settings = currentState.settings.rebuild((b) => b
              ..userData = event.userData.toBuilder()
              ..configSettings = newConfig.toBuilder() ?? currentState.settings.configSettings ?? ConfigSettings((b) => b..bonus = 244224)
            ).toBuilder()
          );
          print("user data updated");
        }
        if (event is SettingsDocumentsArrived) {
          print("SETTINGS DOOCUMENTS EVENT: $event");

          yield SettingsLoaded((b) => b
            ..settings = currentState.settings.rebuild((b) => b
                ..navigationSettings = (event.settingsDocuments[0] as NavigationSettings).toBuilder()
//              TODO: map documents
            // start with updating navigation bloc
            ).toBuilder()
          );
          print("-------");
          print(SettingsLoaded((b) => b
            ..settings = currentState.settings.rebuild((b) => b
              ..navigationSettings = (event.settingsDocuments[0] as NavigationSettings).toBuilder()
//              TODO: map documents
              // start with updating navigation bloc
            ).toBuilder()));
          print("settings documents updated");
        }
      } else {
        print("TRIED UPDATING SETTINGS BUT IT'S NOT YET LOADED");
      }
    }
  }
}

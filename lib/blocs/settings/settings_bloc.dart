import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/settings/settings.dart';
import 'package:diet_driven/models/models.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Logger log = new Logger("settings bloc");

  final SettingsRepository settingsRepository;
  final AuthenticationBloc authenticationBloc;

  StreamSubscription<AuthenticationState> authenticationSubscription;

  ValueObservable<UserData> userDataStream;
  StreamSubscription<UserData> userDataSubscription;

  ValueObservable<BuiltList<SettingsDocument>> settingsDocumentStream;
  StreamSubscription<BuiltList<SettingsDocument>> settingsDocumentSubscription;

  SettingsBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    // Subscribing to authentication changes
    authenticationSubscription = authenticationBloc.state.listen((state) {
      // Cancel old user settings subscriptions
      userDataSubscription?.cancel();
      settingsDocumentSubscription?.cancel();
      log.fine("cancelled old subscriptions");

      // Start new settings subscriptions
      if (state is AuthAuthenticated) {
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

        log.info("subscribed to $id's settings");
      }
    });
  }

  @override
  SettingsState get initialState => SettingsUninitialized();

  @override
  void dispose() {
    authenticationSubscription?.cancel();
    userDataSubscription?.cancel();
    settingsDocumentSubscription?.cancel();
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsState currentState, SettingsEvent event) async* {
    Settings settings;

    // Modifying existing settings
    if (currentState is SettingsLoaded) {
      settings = currentState.settings;
      log.fine("modifying existing settings");
    } else {
      log.fine("first time settings load");
    }

    // Events
    if (event is UserDataArrived) {
      yield SettingsLoaded((b) => b
        ..settings = settings.rebuild((b) => b
          ..userData = event.userData.toBuilder()
        ).toBuilder()
      );

      log.info("loaded user data");
      log.fine("data: ${event.userData}");
    }
    if (event is SettingsDocumentsArrived) {
      yield SettingsLoaded((b) => b
        ..settings = settings.rebuild((b) => b
          ..navigationSettings = event.settingsDocuments.whereType<NavigationSettings>().single.toBuilder()
        ).toBuilder()
      );

      log.info("loaded settings documents");
      log.fine("data: ${event.settingsDocuments}");
    }
  }
}

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

  ValueObservable<BuiltList<SettingsDocument>> settingsDocumentStream;
  StreamSubscription<BuiltList<SettingsDocument>> settingsDocumentSubscription;

  SettingsBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    // TODO: if already authenticated, set settings as uninitialized so that they don't use old user's settings!
    // TODO: do this by checking if currentState is loaded, if so make a wipeSettings event (sets to uninitialized)

    // Subscribing to authentication changes
    authenticationSubscription = authenticationBloc.state.listen((state) {
      // Cancel old user settings subscriptions
      settingsDocumentSubscription?.cancel();
      log.fine("cancelled old settings documents subscription");

      // Start new settings subscriptions
      if (state is AuthAuthenticated) {
        String id = state.user.uid;

        // Settings documents
        settingsDocumentStream = settingsRepository.settingsDocumentsList(id);
        settingsDocumentSubscription = settingsDocumentStream.listen((docs) =>
          dispatch(SettingsDocumentsArrived((b) => b
            ..settingsDocuments = docs.toBuilder()
          ))
        );

        log.info("subscribed to $id's settings documents");
      }
    });
  }

  @override
  SettingsState get initialState => SettingsUninitialized();

  @override
  void dispose() {
    authenticationSubscription?.cancel();
    settingsDocumentSubscription?.cancel();
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsState currentState, SettingsEvent event) async* {
    if (event is SettingsDocumentsArrived) {
      yield SettingsLoaded((b) => b
        ..settings = Settings((b) => b
          ..navigationSettings = event.settingsDocuments.whereType<NavigationSettings>().single.toBuilder()
          // TODO: other settings
        ).toBuilder()
      );

      log.info("loaded settings documents");
      log.fine("data: ${event.settingsDocuments}");
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/settings/settings.dart';
import 'package:diet_driven/models/models.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Logger _log = new Logger("settings bloc");

  final SettingsRepository settingsRepository;
  final AuthenticationBloc authenticationBloc;

  StreamSubscription<AuthenticationState> authenticationSubscription;

  ValueObservable<Settings> settingStream;
  StreamSubscription<Settings> settingsSubscription;

  SettingsBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    // Subscribing to authentication changes
    authenticationSubscription = authenticationBloc.state.listen((state) {
      // Cancel old user settings subscriptions
      settingsSubscription?.cancel();

      // Start new settings subscriptions
      if (state is AuthAuthenticated) {
        String id = state.user.uid;

        // Ensure new user doesn't use settings from previous user
        dispatch(WipeSettings());

        // Settings documents
        settingStream = settingsRepository.settingsDocumentsList(id);
        settingsSubscription = settingStream.listen((settings) =>
          // TODO: error state, add error screen in main
          // Invalid settings are treated the same as a lack of settings (since onError only catches events in mapEventToState)
          // settingsStream returns null if invalid
          dispatch(settings == null
            ? WipeSettings()
            : SettingsArrived((b) => b
                ..settings = settings.toBuilder()
              )
          )
        );

        _log.info("subscribed to $id's settings documents");
      }
    });
  }

  @override
  SettingsState get initialState => SettingsUninitialized();

  @override
  void dispose() {
    authenticationSubscription?.cancel();
    settingsSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is WipeSettings) {
      if (currentState is SettingsLoaded) {
        yield SettingsUninitialized();

        _log.info("wiped settings");
      }
    }
    if (event is SettingsArrived) {
      assert(event.settings != null);

      yield SettingsLoaded((b) => b
        ..settings = event.settings.toBuilder()
      );

      _log.info("loaded settings documents");
      _log.fine("data: ${event.settings}");
    }
  }
}

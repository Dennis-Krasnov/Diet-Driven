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
  final UserDataBloc userDataBloc;

  StreamSubscription<AuthenticationState> authenticationSubscription;

  Observable<Settings> _settingStream;
  StreamSubscription<Settings> _settingsSubscription;

  SettingsBloc({this.settingsRepository, this.userDataBloc}) {
    assert(settingsRepository != null);
    assert(userDataBloc != null);

    _settingStream = Observable<UserDataState>(userDataBloc.state)
      .where((userDataState) => userDataState is UserDataLoaded)
      .map<String>((userDataState) => (userDataState as UserDataLoaded).userData.userId)
      .distinct()
      // Ensure user doesn't see settings from previous user => shows loading screen
      .doOnData((userId) {
        if (currentState is SettingsLoaded) {
          dispatch(WipeSettings());
        }
      })
      .switchMap<Settings>((userId) => settingsRepository.settingsDocumentsList(userId))
      .distinct();

    _settingsSubscription = _settingStream.listen((settings) =>
      dispatch(RemoteSettingsArrived((b) => b..settings = settings.toBuilder())),
      onError: (error, trace) => dispatch(SettingsError((b) => b..error = error)),
      onDone: () => dispatch(WipeSettings()),
    );
  }

  @override
  SettingsState get initialState => SettingsUninitialized();

  @override
  void dispose() {
    authenticationSubscription?.cancel();
    _settingsSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsError) {
      yield SettingsFailed((b) => b..error = event.error);

      _log.info("user data failed");
    }
    if (event is RemoteSettingsArrived) {
      yield SettingsLoaded((b) => b
        ..settings = event.settings.toBuilder()
      );

      _log.info("loaded settings documents");
      _log.fine("data: ${event.settings}");
    }
  }
}

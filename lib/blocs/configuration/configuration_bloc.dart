import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'dart:async';

import 'package:diet_driven/blocs/configuration/configuration.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final Logger _log = new Logger("configuration bloc");

  final SettingsRepository settingsRepository;
  final UserDataBloc userDataBloc;

  StreamSubscription<UserDataState> userDataSubscription;

  ConfigurationBloc({this.settingsRepository, this.userDataBloc}) {
    assert(settingsRepository != null);
    assert(userDataBloc != null);

    // Subscribe to stale configurations
    userDataSubscription = userDataBloc.state.listen((state) {
      if (state is UserDataLoaded) {
        if (state.userData.staleRemoteConfig) {
          _log.info("stale remote config");
          dispatch(FetchConfiguration());
        }
      }
    });
  }

  @override
  ConfigurationState get initialState => ConfigurationUninitialized();

  @override
  void dispose() {
    userDataSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is FetchConfiguration) {
      // Initial loading
      if (currentState is ConfigurationUninitialized) {
        yield ConfigurationLoading();
      }

      RemoteConfiguration config = await settingsRepository.fetchRemoteConfig();

      // Default to previous or default configuration if config is null
      config ??= currentState is ConfigurationLoaded
        ? (currentState as ConfigurationLoaded).configuration
        : RemoteConfiguration((b) => b // TODO: create default builder
          ..defaultConfiguration = true
          ..bonus = 123456789
        );

      // Load configuration
      yield ConfigurationLoaded((b) => b
        ..configuration = config.toBuilder()
      );

      if (userDataBloc.currentState is UserDataLoaded && (userDataBloc.currentState as UserDataLoaded).userData.staleRemoteConfig) {
        _log.fine("called cloud function to mark staleRemoteConfig false"); // TODO
      }

      _log.info("${config == null || config.defaultConfiguration ? "default": "custom"} remote config loaded");
      _log.fine("data: $config");
    }
  }
}



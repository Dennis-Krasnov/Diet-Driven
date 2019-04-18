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

  ConfigurationBloc({this.settingsRepository}) : assert(settingsRepository != null);

  @override
  ConfigurationState get initialState => ConfigurationUninitialized();

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is FetchConfiguration) {
      // Await initial configuration
      if (currentState is ConfigurationUninitialized) {
        yield ConfigurationLoading();
      }

      RemoteConfiguration config;

      // Load remote configuration
      try {
        config = await settingsRepository.fetchRemoteConfig();
      }
      // Default to existing or default configuration
      catch (exception) {
        _log.warning('Unable to fetch remote config. Cached or default values will be used');
        _log.fine(exception);

        config = currentState is ConfigurationLoaded
        ? (currentState as ConfigurationLoaded).configuration
        : RemoteConfiguration();
      }
      // Update current configuration
      finally {
        yield ConfigurationLoaded((b) => b
          ..configuration = config.toBuilder()
        );
      }

      _log.info("${config == null || config.defaultConfiguration ? "default": "remote"} config loaded");
      _log.fine("data: $config");
    }
  }
}



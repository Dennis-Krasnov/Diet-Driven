import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart' show FetchThrottledException;
import 'dart:async';

import 'package:diet_driven/blocs/configuration/configuration.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

/// Fetches and manages app-wide configuration.
/// [ConfigurationBloc] shows splash page until loaded.
class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final Logger _log = new Logger("configuration bloc");
  final UserRepository userRepository;

  ConfigurationBloc({this.userRepository}) {
    assert(userRepository != null);

    // Fetch initial configuration
    dispatch(FetchConfiguration());

    // TODO: timer that fetches config on a timer?
  }

  @override
  ConfigurationState get initialState => ConfigurationUninitialized();

  @override
  Stream<ConfigurationState> transform(Stream<ConfigurationEvent> events, Stream<ConfigurationState> Function(ConfigurationEvent event) next) {
    return super.transform(
      (events as Observable<ConfigurationEvent>).distinct(),
      next,
    );
  }

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is FetchConfiguration) {
      // Await initial configuration
      if (currentState is ConfigurationUninitialized) {
        yield ConfigurationLoading();
      }

      RemoteConfiguration config;

      try {
//        throw Exception("remote config is broken"); // FIXME
//        // Load remote configuration
//        config = await userRepository.fetchRemoteConfig();
//
//        // Update current configuration
//        yield ConfigurationLoaded((b) => b
//          ..configuration = config.toBuilder()
//        );
//      }
//      on FetchThrottledException catch (error, trace) {
        _log.warning('Unable to fetch remote config. Cached or default values will be used');
//        _log.fine(error);

        // Default to existing or default configuration
        config = currentState is ConfigurationLoaded
          ? (currentState as ConfigurationLoaded).configuration.rebuild((b) => b..liveConfiguration = false)
          : RemoteConfiguration();

        yield ConfigurationLoaded((b) => b
          ..configuration = config.toBuilder()
        );
      }
      catch (error, trace) {
        yield ConfigurationFailed((b) => b
          ..error = error.toString()
          ..trace = trace.toString()
        );
      }

      _log.info("${config == null || !config.liveConfiguration ? "default": "live"} config loaded");
      _log.fine("data: $config");
    }
  }
}

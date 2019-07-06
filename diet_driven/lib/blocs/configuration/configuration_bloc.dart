import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/blocs.dart';

import 'package:diet_driven/blocs/configuration/configuration.dart';
import 'package:diet_driven/log_printer.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:package_info/package_info.dart';
//import 'package:package_info/package_info.dart' show PackageInfo; TODO


/// Fetches and manages app-wide configuration.
/// [ConfigurationBloc] shows splash page until loaded.
class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final logger = getLogger("configuration bloc");

  final ConfigurationRepository configurationRepository;

  StreamSubscription<ConfigurationEvent> _configurationEventSubscription;

  ConfigurationBloc({@required this.configurationRepository}) {
    assert(configurationRepository != null);

    final configurationEvent$ = Observable<ConfigurationEvent>(CombineLatestStream.combine2(
      // Return default configuration on failure
      // TODO: log failures, consider reusing last valid configuration if it exists (do in mapEventToState to get initialized currentState)
      Observable<RemoteConfiguration>.fromFuture(configurationRepository.fetchRemoteConfig()).onErrorReturn(RemoteConfiguration()),
      Observable<PackageInfo>.fromFuture(PackageInfo.fromPlatform()), // TODO: use repository
      (RemoteConfiguration remoteConfiguration, PackageInfo packageInfo) => RemoteConfigurationArrived((b) => b
        ..remoteConfiguration = remoteConfiguration.toBuilder()
        ..packageInfo = packageInfo
      ),
    )).distinct();
    // TODO: .sample this immediately and on userData.staleConfiguration == True, then update userData to indicate not stale config

    _configurationEventSubscription = configurationEvent$.listen(
      (configurationEvent) => dispatch(configurationEvent),
      onError: (Object error, Object trace) => dispatch(ConfigurationError((b) => b
        ..error = error.toString()
        ..trace = trace.toString()
      )),
    );
  }

  // Poll for fresh configurations every few hours
  // + .startWith
  // Observable<void>.periodic(Duration(seconds: 60)).switchMap<RemoteConfiguration>((_) =>)

  @override
  ConfigurationState get initialState => ConfigurationUninitialized();

  @override
  void dispose() {
    _configurationEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is RemoteConfigurationArrived) {
      yield ConfigurationLoaded((b) => b
        ..remoteConfiguration = event.remoteConfiguration.toBuilder()
        ..packageInfo = event.packageInfo
      );

      logger.i("loaded configuration");
    }

    if (event is ConfigurationError) {
      yield ConfigurationFailed((b) => b
        ..error = event.error
        ..trace = event.trace
      );

      logger.i("configuration failed");
    }
  }
}

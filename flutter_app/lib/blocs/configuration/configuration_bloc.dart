/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/configuration/configuration.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Aggregates and manages app-wide runtime configuration.
/// App shows skeleton navigation until [ConfigurationBloc] is loaded.
class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final ConfigurationRepository configurationRepository;

  StreamSubscription<ConfigurationEvent> _configurationEventSubscription;

  ConfigurationBloc({@required this.configurationRepository}) : assert(configurationRepository != null);

  @override
  ConfigurationState get initialState => ConfigurationUninitialized();

  @override
  void dispose() {
    _configurationEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is InitConfiguration) {
      if (currentState is! ConfigurationUninitialized) {
        dispatch(ConfigurationError((b) => b..error = StateError("Configuration bloc must be uninitialized")));
        return;
      }

      // Maintain single instance of stream subscription
      _configurationEventSubscription ??= Observable<ConfigurationEvent>(CombineLatestStream.combine3(
        Observable<RemoteConfiguration>.fromFuture(configurationRepository.fetchRemoteConfig())
          .doOnError((Object error, StackTrace trace) => LoggingBloc().expectedError("Default configuration used", error, trace))
          .onErrorReturn(RemoteConfiguration()),
        Observable<PackageInformation>.fromFuture(configurationRepository.fetchPackageInfo()),
        // FIXME: start with needed on ios for some reason...
        Observable<ConnectivityStatus>(configurationRepository.connectivity$()).startWith(ConnectivityStatus.disconnected), // TODO .doOnData((data) => "CONNECTIVITY ARRIVED: $data")
        (RemoteConfiguration remoteConfiguration, PackageInformation packageInfo, ConnectivityStatus connectivity) => IngressConfigurationArrived((b) => b
          ..remoteConfiguration = remoteConfiguration.toBuilder()
          ..packageInfo = packageInfo.toBuilder()
          ..connectivity = connectivity
        ),
      ))
      // Unrecoverable failure
      .onErrorReturnWith((dynamic error) => ConfigurationError((b) => b..error = error))
      .distinct()
      .listen(dispatch);
    }

    if (event is IngressConfigurationArrived) {
      yield ConfigurationLoaded((b) => b
        ..remoteConfiguration = event.remoteConfiguration.toBuilder()
        ..packageInfo = event.packageInfo.toBuilder()
        ..connectivity = event.connectivity
      );

      LoggingBloc().info("Configuration loaded");
    }

    if (event is ConfigurationError) {
      yield ConfigurationFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      LoggingBloc().unexpectedError("Configuration failed", event.error, event.stacktrace);
    }
  }
}

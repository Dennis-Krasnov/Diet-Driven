/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart' show ConnectivityResult;
import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart' show PackageInfo;
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
      assert(currentState is ConfigurationUninitialized);

      // Maintain single instance of stream subscriptions
      _configurationEventSubscription ??= Observable<ConfigurationEvent>(CombineLatestStream.combine3(
        Observable<RemoteConfiguration>.fromFuture(configurationRepository.fetchRemoteConfig())
          .doOnError((Object error, StackTrace trace) => LoggingBloc().expectedError("Default configuration used", error, trace))
          .onErrorReturn(RemoteConfiguration()),
        Observable<PackageInfo>.fromFuture(configurationRepository.fetchPackageInfo()),
        Observable<ConnectivityResult>(configurationRepository.connectivity$()),
        (RemoteConfiguration remoteConfiguration, PackageInfo packageInfo, ConnectivityResult connectivity) => RemoteConfigurationArrived((b) => b
          ..remoteConfiguration = remoteConfiguration.toBuilder()
          ..packageInfo = packageInfo
          ..connectivity = connectivity
        ),
      ))
      .distinct()
      // Unrecoverable failure
      .onErrorReturnWith((dynamic error) => ConfigurationError((b) => b..error = error))
      .listen(dispatch);
    }

    if (event is RemoteConfigurationArrived) {
      yield ConfigurationLoaded((b) => b
        ..remoteConfiguration = event.remoteConfiguration.toBuilder()
        ..packageInfo = event.packageInfo
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

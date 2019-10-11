/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  ConfigurationBloc sut;
  
  /// Mocks
  ConfigurationRepository configurationRepository;

  /// Data
  final defaultConfig = RemoteConfiguration();
  final remoteConfig = RemoteConfiguration((b) => b
    ..liveConfiguration = true
    ..bonus = 35
  );

  final packageInfo = PackageInformation((b) => b
    ..appName = "Diet Driven"
    ..packageName = "diet_driven"
    ..version = "1.2.3"
    ..buildNumber = "14"
  );

  final connectivityList = [
    ConnectivityStatus.disconnected,
    ConnectivityStatus.wifi,
    ConnectivityStatus.mobile,
  ];

  /// Configuration
  setUp(() {
    configurationRepository = MockConfigurationRepository();

    sut = ConfigurationBloc(configurationRepository: configurationRepository);
  });

  tearDown(() {
    sut?.dispose();
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialState, ConfigurationUninitialized());
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid streams", () {
      when(configurationRepository.fetchRemoteConfig()).thenAnswer((_) async => remoteConfig);
      when(configurationRepository.fetchPackageInfo()).thenAnswer((_) async => packageInfo);
      when(configurationRepository.connectivity$()).thenAnswer((_) => Stream.fromIterable(connectivityList));

      expectLater(
        sut.state,
        emitsInOrder(<ConfigurationState>[
          ConfigurationUninitialized(),
          for (var conn in connectivityList)
            ConfigurationLoaded((b) => b
              ..remoteConfiguration = remoteConfig.toBuilder()
              ..packageInfo = packageInfo.toBuilder()
              ..connectivity = conn
            ),
        ])
      );

      sut.dispatch(InitConfiguration());
    });

    test("Yield fallback loaded state on errorous remote config future", () {
      when(configurationRepository.fetchRemoteConfig()).thenAnswer((_) async => throw eventFailedException);
      when(configurationRepository.fetchPackageInfo()).thenAnswer((_) async => packageInfo);
      when(configurationRepository.connectivity$()).thenAnswer((_) => Stream.fromIterable(connectivityList));

      expectLater(
        sut.state,
        emitsInOrder(<ConfigurationState>[
          ConfigurationUninitialized(),
          for (var conn in connectivityList)
            ConfigurationLoaded((b) => b
              ..remoteConfiguration = defaultConfig.toBuilder()
              ..packageInfo = packageInfo.toBuilder()
              ..connectivity = conn
            ),
        ])
      );

      sut.dispatch(InitConfiguration());
    });

    test("Yield error state on errorous package info future", () {
      when(configurationRepository.fetchRemoteConfig()).thenAnswer((_) async => remoteConfig);
      when(configurationRepository.fetchPackageInfo()).thenAnswer((_) async => throw Exception("Package info failed"));
      when(configurationRepository.connectivity$()).thenAnswer((_) => Stream.fromIterable(connectivityList));

      expectLater(
        sut.state,
        emitsInOrder(<dynamic>[ // <ConfigurationState>
          ConfigurationUninitialized(),
          BuiltErrorMatcher("Package info failed"),
        ])
      );

      sut.dispatch(InitConfiguration());
    });

    test("Yield error state on errorous connectivity stream", () {
      when(configurationRepository.fetchRemoteConfig()).thenAnswer((_) async => remoteConfig);
      when(configurationRepository.fetchPackageInfo()).thenAnswer((_) async => packageInfo);
      when(configurationRepository.connectivity$()).thenAnswer((_) async* {
        throw Exception("Connectivity failed");
      });

      expectLater(
        sut.state,
        emitsInOrder(<dynamic>[ // <ConfigurationState>
          ConfigurationUninitialized(),
          ConfigurationLoaded((b) => b
            ..remoteConfiguration = remoteConfig.toBuilder()
            ..packageInfo = packageInfo.toBuilder()
            ..connectivity = ConnectivityStatus.disconnected
          ),
          BuiltErrorMatcher("Connectivity failed"),
        ])
      );

      sut.dispatch(InitConfiguration());
    });
  });
}


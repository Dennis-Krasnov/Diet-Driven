/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../utils/utils.dart';

void main() {
  ConfigurationBloc sut;
  
  /// Mocks
  ConfigurationRepository configurationRepository;

  /// Configuration
  setUp(() {
    configurationRepository = MockConfigurationRepository();

    sut = ConfigurationBloc(configurationRepository: configurationRepository);
  });

  /// Tests
  test("Start with initial state", () {
    expect(sut.initialState, ConfigurationUninitialized());
  });

  group("Reactive ingress streams", () {
    test("Yield loaded state for valid streams", () async {
      when(configurationRepository.fetchRemoteConfig()).future(remoteConfig);
      when(configurationRepository.fetchPackageInfo()).future(packageInfo);
      when(configurationRepository.connectivity$()).stream(connectivityList);

      sut.add(InitConfiguration());

      sut.expectEmits(<ConfigurationState>[
        ConfigurationUninitialized(),
        for (var conn in connectivityList)
          ConfigurationLoaded((b) => b
            ..remoteConfiguration = remoteConfig.toBuilder()
            ..packageInfo = packageInfo.toBuilder()
            ..connectivity = conn
          ),
      ]);
    });

    test("Yield fallback loaded state on errorous remote config future", () {
      when(configurationRepository.fetchRemoteConfig()).thenAnswer((_) async => throw eventFailedException);
      when(configurationRepository.fetchPackageInfo()).future(packageInfo);
      when(configurationRepository.connectivity$()).stream(connectivityList);

      sut.add(InitConfiguration());

      sut.expectEmits(<ConfigurationState>[
        ConfigurationUninitialized(),
        for (var conn in connectivityList)
          ConfigurationLoaded((b) => b
            ..remoteConfiguration = defaultRemoteConfig.toBuilder()
            ..packageInfo = packageInfo.toBuilder()
            ..connectivity = conn
          ),
      ]);
    });

    test("Yield error state on errorous package info future", () {
      when(configurationRepository.fetchRemoteConfig()).future(remoteConfig);
      when(configurationRepository.fetchPackageInfo()).thenAnswer((_) async => throw Exception("Package info failed"));
      when(configurationRepository.connectivity$()).stream(connectivityList);

      sut.add(InitConfiguration());

      sut.expectEmits([
        ConfigurationUninitialized(),
        BuiltErrorMatcher("Package info failed"),
      ]);
    });

    test("Yield error state on errorous connectivity stream", () {
      when(configurationRepository.fetchRemoteConfig()).future(remoteConfig);
      when(configurationRepository.fetchPackageInfo()).future(packageInfo);
      when(configurationRepository.connectivity$()).thenAnswer((_) async* {
        throw Exception("Connectivity failed");
      });

      sut.add(InitConfiguration());

      sut.expectEmits([
        ConfigurationUninitialized(),
        BuiltErrorMatcher("Connectivity failed"),
      ]);
    });
  });
}


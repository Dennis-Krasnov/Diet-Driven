import 'package:built_value/built_value.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';

import '../test_utils.dart';

void main() {
  ConfigurationBloc configurationBloc;
  
  /// Mocks
  SettingsRepository settingsRepository;

  /// Data
  final RemoteConfiguration defaultConfig = RemoteConfiguration();
  final RemoteConfiguration remoteConfig = RemoteConfiguration((b) => b
    ..bonus = 2
    ..liveConfiguration = true
  );

  setUp(() {
    settingsRepository = MockSettingsRepository();
    configurationBloc = ConfigurationBloc(settingsRepository: settingsRepository);
  });
  
  test("Initialize properly", () {
    expect(configurationBloc.initialState, ConfigurationUninitialized());
  });
  
  test("Fetch remote configuration on success", () {
    when(settingsRepository.fetchRemoteConfig()).thenAnswer((_) =>
      Future.value(remoteConfig)
    );

    expectLater(
      configurationBloc.state,
      emitsInOrder([
        ConfigurationUninitialized(),
        ConfigurationLoading(),
        ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()),
      ])
    );

    configurationBloc.dispatch(FetchConfiguration());  
  });
  
  test("Fetch default configuration on failure", () {
    when(settingsRepository.fetchRemoteConfig()).thenThrow(BuiltValueNullFieldError('RemoteConfiguration', 'bonus'));

    expectLater(
      configurationBloc.state,
      emitsInOrder([
        ConfigurationUninitialized(),
        ConfigurationLoading(),
        ConfigurationLoaded((b) => b..configuration = defaultConfig.toBuilder()),
      ])
    );

    configurationBloc.dispatch(FetchConfiguration());  
  });

  test("Fetch existing configuration on success then failure", () {
    // fetchRemoteConfig first returning a value, then failing.
    bool firstTime = true;
    when(settingsRepository.fetchRemoteConfig()).thenAnswer((_) {
      if (firstTime) {
        firstTime = false;
        return Future.value(remoteConfig);
      }

      return Future.error("fail :(");
    });

    expectLater(
      configurationBloc.state,
      emitsInOrder([
        ConfigurationUninitialized(),
        ConfigurationLoading(),
        ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()),
        ConfigurationLoaded((b) => b..configuration = remoteConfig.rebuild((b) => b..liveConfiguration = false).toBuilder()),
      ])
    );

    configurationBloc.dispatch(FetchConfiguration());
    configurationBloc.dispatch(FetchConfiguration());
  });
}

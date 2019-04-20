import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';

import '../test_utils.dart';

void main() {
  ConfigurationBloc configurationBloc;
  
  // Mocks
  SettingsRepository settingsRepository;

  final RemoteConfiguration defaultConfig = RemoteConfiguration();

  setUp(() {
    settingsRepository = MockSettingsRepository();

//    userDataBloc = new UserDataBloc(settingsRepository: settingsRepository, userRepository: userRepository);
    configurationBloc = ConfigurationBloc(settingsRepository: settingsRepository);
  });
  
  test("Initialize properly", () {
    expect(configurationBloc.initialState, ConfigurationUninitialized());
  });
  
  test("Fetch remote configuration on success", () {
    RemoteConfiguration remoteConfig = RemoteConfiguration((b) => b
      ..bonus = 2
      ..defaultConfiguration = false
    );
    
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
    logInvocations([settingsRepository as MockSettingsRepository]);

    RemoteConfiguration remoteConfig = RemoteConfiguration((b) => b
      ..bonus = 2
      ..defaultConfiguration = false
    );

    when(settingsRepository.fetchRemoteConfig()).thenAnswer((_) =>
      Future.value(remoteConfig)
    );

    expectLater(
      configurationBloc.state,
      emitsInOrder([
        ConfigurationUninitialized(),
        ConfigurationLoading(),
        ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()),
        ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()),
//        emitsDone
      ])
    );

    configurationBloc.dispatch(FetchConfiguration());

//    reset(settingsRepository);
//    when(settingsRepository.fetchRemoteConfig()).thenThrow(BuiltValueNullFieldError('RemoteConfiguration', 'bonus'));

    configurationBloc.dispatch(FetchConfiguration());
  });
}

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
  UserRepository userRepository;

  /// Data
  final RemoteConfiguration defaultConfig = RemoteConfiguration();
  final RemoteConfiguration remoteConfig = RemoteConfiguration((b) => b
    ..bonus = 2
    ..liveConfiguration = true
  );

  setUp(() {
    userRepository = MockUserRepository();
    configurationBloc = ConfigurationBloc(userRepository: userRepository);
  });
  
  test("Initialize properly", () {
    expect(configurationBloc.initialState, ConfigurationUninitialized());
  });
  
  test("Fetch remote configuration on success", () {
    when(userRepository.fetchRemoteConfig()).thenAnswer((_) =>
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
    when(userRepository.fetchRemoteConfig()).thenThrow(BuiltValueNullFieldError('RemoteConfiguration', 'bonus'));

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

  test("Fetch existing configuration on success then failure", () async {
    // fetchRemoteConfig first returning a value, then failing.
    bool firstTime = true;
    when(userRepository.fetchRemoteConfig()).thenAnswer((_) {
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
        ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()), // initial configuration
        ConfigurationLoaded((b) => b..configuration = remoteConfig.rebuild((b) => b..liveConfiguration = false).toBuilder()),
      ])
    );

    // Need time for asynchronous default page event to run
    await Future.delayed(Duration(milliseconds: 10)); // FIXME: this broke because I moved initial fetch to constructor instead of main.
    configurationBloc.dispatch(FetchConfiguration());
//    configurationBloc.dispatch(FetchConfiguration());
  });
}

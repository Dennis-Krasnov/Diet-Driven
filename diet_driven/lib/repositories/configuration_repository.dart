import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';

/// Data access object for global configuration.
class ConfigurationRepository {
  final _remoteConfigProvider = RemoteConfigProvider();

  /// Fetches [Observable] of [RemoteConfiguration].
  /// `remoteConfigStream()` is called from [ConfigurationBloc].
  ///
  /// Throws [FetchThrottledException] or [Exception] if failed to fetch live Firebase Remote Config data.
  /// Throws [BuiltValueNullFieldError] if remote config is missing parameters.
  Future<RemoteConfiguration> fetchRemoteConfig() {
      return _remoteConfigProvider.fetchRemoteConfig();
  }
}

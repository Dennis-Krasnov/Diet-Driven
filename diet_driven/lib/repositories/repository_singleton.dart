library repository;

import 'package:diet_driven/repositories/repositories.dart';

/// Repositories singleton for simplified repository injection across app.
/// Blocs still take repositories as parameters for ease of testing.
/// A new instance of [Repository] is lazily created on first use.
///
/// https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart
/// http://gameprogrammingpatterns.com/singleton.html
class Repository {
  static final Repository _singleton = Repository._internal();

  final analytics = AnalyticsRepository();
  final config = ConfigurationRepository();
  final diary = DiaryRepository();
  final food = FoodRepository();
  final settings = SettingsRepository();
  final user = UserRepository();

  factory Repository() {
    return _singleton;
  }

//  factory Repository.mock({UserRepository user, DiaryRepository diary, FoodRepository food, AnalyticsRepository analytics}) {
//    // FIXME: mock factory/constructor for widget testing
//    // TODO: instead of factories, make Repository.mock(...) initialization method, singleton accesses in same way across app
//    // Defaults to normal repositories
//    return _singleton;
//  }

  Repository._internal();
}

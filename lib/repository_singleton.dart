library repository;

import 'package:diet_driven/repositories/repositories.dart';

/// Repositories singleton for simplified repository injection across app.
/// Blocs still take repositories as parameters for ease of testing.
/// A new instance of [Repository] is lazily created on first use.
class Repository {
  static final Repository _singleton = new Repository._internal();

  final UserRepository user = UserRepository();
  final DiaryRepository diary = DiaryRepository();
  final FoodRepository food = FoodRepository();
  final AnalyticsRepository analytics = AnalyticsRepository();

  factory Repository() {
    return _singleton;
  }

  factory Repository.mock({UserRepository user, DiaryRepository diary, FoodRepository food, AnalyticsRepository analytics}) {
    // FIXME: mock factory/constructor for widget testing
    // TODO: instead of factories, make Repository.mock(...) initialization method, singleton accesses in same way across app
    // Defaults to normal repositories
    return _singleton;
  }

  Repository._internal();
}

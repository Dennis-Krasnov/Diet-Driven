import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

/// Firebase Analytics logging interface.
class AnalyticsRepository {
  final _analytics = FirebaseAnalytics();

  // TODO: log custom event (similar to bloc transition) for every analytics log (special filter in logging tab)
  // TODO: bloc tests ensure proper analytics event was called
  // TODO: https://medium.com/flutterpub/using-firebase-analytics-in-flutter-2da5be205e4

  /// ... using `firebase_analytics` library.
  Future<void> startOnboarding() => _analytics.logTutorialBegin();

  /// ... using `firebase_analytics` library.
  Future<void> finishOnboarding() => _analytics.logTutorialComplete();

  /// ... using `firebase_analytics` library.
  Future<void> updateUser(FirebaseUser user) async {
    assert(user != null);

//    _analytics.logEvent(name: null, parameters: {})
    await _analytics.setUserId(user.uid);
    return await _analytics.setUserProperty(name: "auth_type", value: user.isAnonymous ? "anonymous" : "authenticated");
  }

  /// ... using `firebase_analytics` library.
  Future<void> signUp(String signUpMethod) {
    assert(signUpMethod != null);

    return _analytics.logSignUp(signUpMethod: signUpMethod);
  }

  /// ... using `firebase_analytics` library.
  Future<void> login(String loginMethod) {
    assert(loginMethod != null);

    return _analytics.logLogin(loginMethod: loginMethod);
  }

  /// ... using `firebase_analytics` library.
  /// TODO: include deep link
  Future<void> goToPage(String pageName) {
    assert(pageName != null);

    return _analytics.setCurrentScreen(screenName: pageName);
  }

  /// ... using `firebase_analytics` library.
  Future<void> openFoodRecord(String foodId) {
    assert(foodId != null);

    return _analytics.logEvent(name: "edit_food_record", parameters: <String, dynamic>{
      "food_id": foodId,
    });
  }

  /// ... using `firebase_analytics` library.
  Future<void> saveFoodRecord(String foodId) {
    assert(foodId != null);

    return _analytics.logEvent(name: "save_food_record", parameters: <String, dynamic>{
      "food_id": foodId,
    });
  }

  /// ... using `firebase_analytics` library.
  Future<void> viewFoodDiaryDay(int deltaDays) {
    assert(deltaDays != null);

    return _analytics.logEvent(name: "view_food_diary_day", parameters: <String, dynamic>{
      "delta_days": deltaDays,
    });
  }

  ///
  // TODO: search
  // TODO: deep links
  // TODO: setting/report viewed

}

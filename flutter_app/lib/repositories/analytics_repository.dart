/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

/// Firebase Analytics logging interface using `firebase_analytics` library.
class AnalyticsRepository {
  final FirebaseAnalytics _analytics;

  // Dependency injection
  AnalyticsRepository({FirebaseAnalytics analytics}) : _analytics = analytics ?? FirebaseAnalytics();

  // TODO: log custom event (similar to bloc transition) for every analytics log (special filter in logging tab)
  // TODO: bloc tests ensure proper analytics event was called
  // TODO: https://medium.com/flutterpub/using-firebase-analytics-in-flutter-2da5be205e4

  /// ... .
  Future<void> startOnboarding() => _analytics.logTutorialBegin();

  /// ... .
  Future<void> finishOnboarding() => _analytics.logTutorialComplete();

  /// ... .
  Future<void> updateUser(FirebaseUser user) async {
    assert(user != null);

//    _analytics.logEvent(name: null, parameters: {})
    await _analytics.setUserId(user.uid);
    return await _analytics.setUserProperty(name: "auth_type", value: user.isAnonymous ? "anonymous" : "authenticated");
  }

  /// ...
  Future<void> signUp(String signUpMethod) {
    assert(signUpMethod != null);

    return _analytics.logSignUp(signUpMethod: signUpMethod);
  }

  /// ...
  Future<void> login(String loginMethod) {
    assert(loginMethod != null);

    return _analytics.logLogin(loginMethod: loginMethod);
  }

  /// ...
  /// TODO: include deep link
  Future<void> currentScreen(String pageName) {
    assert(pageName != null);

    // TODO: type of severity for analytics, rewrite threshold level to a white/black list!
    BlocLogger().fine("Analtytics - current screen: $pageName");
    return _analytics.setCurrentScreen(screenName: pageName);
  }

  /// ...
  Future<void> openFoodRecord(String foodId) {
    assert(foodId != null);

    return _analytics.logEvent(name: "edit_food_record", parameters: <String, dynamic>{
      "food_id": foodId,
    });
  }

  /// ...
  Future<void> saveFoodRecord(String foodId) {
    assert(foodId != null);

    return _analytics.logEvent(name: "save_food_record", parameters: <String, dynamic>{
      "food_id": foodId,
    });
  }

  /// ...
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

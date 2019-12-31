/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logger.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

/// Firebase Analytics logging interface using `firebase_analytics` library.
class AnalyticsRepository {
  final FirebaseAnalytics _analytics;

  // Dependency injection
  AnalyticsRepository({FirebaseAnalytics analytics}) : _analytics = analytics ?? FirebaseAnalytics();

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
  Future<void> currentScreen(List<DeepLink> route) {
    assert(route != null);

    // TODO: type of severity for analytics, rewrite threshold level to a white/black list!
    BlocLogger().fine("Analtytics - current screen: $route");
    return _analytics.setCurrentScreen(screenName: route.join("/"));
  }
}

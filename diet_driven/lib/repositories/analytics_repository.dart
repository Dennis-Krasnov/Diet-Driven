//import 'package:diet_driven/log_printer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:logger/logger.dart';

/// Wrapper for Firebase Analytics tracking.
class AnalyticsRepository {
//  final logger = getLogger("analytics repository");
  FirebaseAnalytics _analytics = FirebaseAnalytics();

  // TODO: call analytics from user data bloc/login bloc (doOnAction side effects)

  /// Logs start of anonymous user session.
  void anonymousSession(String userId) {
    _analytics.setUserId(userId);
    _analytics.logEvent(
      name: "anonymous_login"
    );
//    logger.v("anonymous session $userId");
  }

  /// Logs sign up event with [signUpMethod].
  void signUp(String signUpMethod) {
    _analytics.logSignUp(signUpMethod: signUpMethod);
//    logger.v("user signed up with $signUpMethod");
  }

  /// Logs sign in event and updates [userId].
  void signIn(String userId) {
    _analytics.setUserId(userId);
    _analytics.logLogin();
//    logger.v("login $userId");
  }

  /// Logs sign out event.
  void signOut() {
    // FIXME
//    logger.v("sign out");
  }

  /// Logs navigation to [screenName].
  void navigateToScreen(String screenName) {
    _analytics.setCurrentScreen(screenName: screenName);
//    logger.v("navigated to $screenName");
  }

}

// TODO:
//view_search_results

//Future<void> setCurrentScreen ({
//@required String screenName,
//String screenClassOverride: 'Flutter'
//})

//Future<void> logEvent ({
//  @required String name,
//  Map<String, dynamic> parameters
//})

// EVENTS
// tutorial_start
// tutorial_end

// view_food_diary_day(int delta) // int day
// view_food_record(String id)
// open_food_bottom_sheet(screen)
// log_food(Enum entryType, int numberOfFoods, DateTime delta (estimated, based on day, meal) - to see whether people track before or after
// search_food(String query)

// selections!!
// start selection
// end selection?
// copies
// other operations...

// opened_dynamic_link(url, page, params)
// wrote_rfid_tag (...)

// viewed_settings(page) // TODO: make go to screen capture this! (tabs + navigator observer)
// changed_settings (to filter for advanced users)

// view_body_record(String type)
// track_body_record(String type, delta) // deltaTime - can see in analytics!
// body_record_filter

// reports_filter
//

// USER PROPERTIES (up to 25)
//Future<void> setUserProperty ({
//@required String name,
//@required String value
//})

// weight_goal: gain/lose/maintain
//

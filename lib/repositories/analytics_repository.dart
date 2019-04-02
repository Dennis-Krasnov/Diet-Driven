import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logging/logging.dart';

class AnalyticsRepository {
  final Logger _log = new Logger("authentication bloc");
  FirebaseAnalytics _analytics = FirebaseAnalytics();

  void anonymousSession(String userId) {
    _analytics.setUserId(userId);
    _analytics.logEvent(
      name: "anonymous_login"
    );
    _log.finest("anonymous session $userId");
  }
  
  void signUp(String signUpMethod) {
    _analytics.logSignUp(signUpMethod: signUpMethod);
    _log.finest("user signed up with $signUpMethod");
  }

  void signIn(String userId) {
    _analytics.setUserId(userId);
    _analytics.logLogin();
    _log.finest("login $userId");
  }

  void signOut() {
    _log.finest("sign out");
  }

  void navigatePage(String screenName) {
    _analytics.setCurrentScreen(screenName: screenName);
    _log.finest("navigated to $screenName");
  }

}
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


  // TODO: call these from login bloc/account switcher! (at explicit action)
//  @override // TODO: verify events are dispatched!
//  void onTransition(Transition<AuthenticationEvent, AuthenticationState> transition) {
//    // Login
//    if ((transition.currentState is AuthUninitialized ||
//         transition.currentState is AuthAuthenticated) &&
//         transition.nextState is AuthAuthenticated) {
//      FirebaseUser user = (transition.nextState as AuthAuthenticated).user;
//
//      if (user.isAnonymous) {
//        analyticsRepository.signUp("anonymous");
//      }
//      else {
//        analyticsRepository.signIn("email"); // TODO: call from login bloc!
//      }
//    }
//    // Sign out
//    else if (transition.nextState is AuthUnauthenticated) {
//      analyticsRepository.signOut();
//    }
//    //
//    else if (transition.nextState is AuthAuthenticated) {
//      FirebaseUser pastUser = (transition.currentState as AuthAuthenticated).user;
//      FirebaseUser futureUser = (transition.nextState as AuthAuthenticated).user;
//
//      // User switch
//      if (pastUser.uid != futureUser.uid) {
//        analyticsRepository.signIn(futureUser.uid);
//      }
//      // Anonymous => signed in
//      else if (pastUser.isAnonymous && !futureUser.isAnonymous) {
//        analyticsRepository.signUp("email"); // TODO: call from login bloc!
//      }
//    }
//  }

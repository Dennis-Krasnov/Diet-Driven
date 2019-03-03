library main;

import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/util/subscriptions.dart';
import 'package:diet_driven/widgets/home_screen.dart';
import 'package:diet_driven/wrappers/remote_config.dart';
import 'package:diet_driven/wrappers/subscriber.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logging/logging.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/middleware/epics.dart';
import 'package:diet_driven/middleware/middleware.dart';
import 'package:diet_driven/data/page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/reducers/reducers.dart';
import 'package:diet_driven/models/app_state.dart';

import 'package:built_redux/built_redux.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

void main() => runApp(DDApp());

///
class DDApp extends StatefulWidget {
  // Used for navigation middleware
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //
  static FirebaseAnalytics analytics = FirebaseAnalytics();
//  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  //
  static RemoteConfig remoteConfig = RemoteConfig();

  //
  static Subscriptions subscriptions = Subscriptions();

  // Map routes to pages
  static Map<String, WidgetBuilder> routes = Map<String, WidgetBuilder>.fromIterable(
      Page.values,
      key: (page) => page.toString(),
      value: (page) => (context) => PageFactory.toPage(page)
  )..addAll({
    "/": (context) => HomeScreen()
  });

  @override
  State<StatefulWidget> createState() => _DDAppState();
}

class _DDAppState extends State<DDApp> {
  final store = new Store(
    getBaseReducer(),
    new AppState(),
    new Actions(),
    middleware: [
      createMiddleware(FirebaseAuth.instance, DDApp.subscriptions), // TODO: pass remoteConfig?!, subscriptions!?
      createEpicMiddleware(createEpicBuilder()),
    ],
  );

  @override
  void initState() {
    super.initState();

    // Configure logger
    Logger.root.level = Level.FINE;
    Logger.root.onRecord.listen((LogRecord rec) {
      print("${rec.loggerName} ~ ${rec.level.name} ~ ${rec.time} ~ ${rec.message}");
    });
    // TODO: upload to google cloud stack driver??
    store.actions.initApp();
  }


  @override
  void dispose() {
    store.actions.disposeApp();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return new ReduxProvider(
      store: store,
        child: RemoteConfigLoader(builder: (BuildContext context) {
          return MaterialApp(
            navigatorKey: DDApp.navigatorKey,
            title: "Diet Driven",
            theme: ThemeData(fontFamily: 'FiraSans'), // TODO: store.state.theme,
            routes: DDApp.routes,
            initialRoute: "/",
  //          onUnknownRoute: (settings) => settings.name, // TODO
          );
//        });
      }),
    );
  }
}



//    var navigationSettings = Subscription(
//      store.actions.firestore.navigationSettingsReceived,
//      print,
////      NavigationStateDocument() // implicit userId
//      NavigationStateDocument((b) => b
//        ..userId = store.state.user.authUser?.uid // If exists (doesn't at start)
//      )
//    );

// GOAL: avoid 2 loading animations, combine into one!
//
// Settings listen (through callback) => settingsArrived => reducer changes page (non-breaking - falls back to default)

// TODO: manual subscription call! , autoSubscribe: false, call init first, get userId, then retrieve default page, navigation, then go to default page!!

// Subscriber must go before RemoteConfigLoader as it depends on subscription to arrive (doesn't matter, it's subscribed from init!)
// TODO: store subscriptions on a static object instead of toying with props!!! (hard define, just built value, no redux)
// or just place subscriptions object into store (dirty but probably easiest!!!) - contains hardcoded subscriptions!! (later support for dynamic)
// only use subscriber for simple and unique subscriptions within app
//      child: Subscriber(hashCode, [navigationSettings], autoSubscribe: store.state.loadSettings, builder: (BuildContext context) {

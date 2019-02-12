library main;

import 'package:logging/logging.dart';
import 'package:diet_driven/built_redux_rx-master/lib/built_redux_rx.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/middleware/epics.dart';
import 'package:diet_driven/middleware/middleware.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/presentation/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/reducers/reducers.dart';
import 'package:diet_driven/models/app_state.dart';

import 'package:built_redux/built_redux.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

void main() => runApp(new DDApp());

///
class DDApp extends StatefulWidget {
  // Used for navigation middleware
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<StatefulWidget> createState() => _DDAppState();
}

class _DDAppState extends State<DDApp> {

  final store = new Store(
//    reducerBuilder.build(),
    getBaseReducer(),
    new AppState(),
    new Actions(),
    middleware: [
//      createEpicMiddleware([goToEpic]),
      createMiddleware(FirebaseAuth.instance),
      createEpicMiddleware(createEpicBuilder()),
//      createEpicMiddleware([goToEpic])
    ],
  );


  @override
  void initState() {
    super.initState();

    // Configure logger
    // TODO: upload to google cloud stack driver??
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print("${rec.loggerName} ~ ${rec.level.name} ~ ${rec.time} ~ ${rec.message}");
    });

    store.actions.initApp();
  }


  @override
  void dispose() {
    store.actions.disposeApp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Map routes to pages
    Map<String, WidgetBuilder> routes = Map<String, WidgetBuilder>.fromIterable(
      Page.values,
      key: (page) => page.toString(),
      value: (page) => (context) => PageFactory.toPage(page)
    );

    routes.addAll({
      "/": (context) => HomeScreen()
    });

    return new ReduxProvider(
        store: store,
        child: new MaterialApp(
          navigatorKey: DDApp.navigatorKey,
          title: "Diet Driven",
//          theme:, // TODO
            routes: routes,
          initialRoute: "/",
//          onUnknownRoute: (settings) => settings.name, // TODO
        ),
    );
  }
}

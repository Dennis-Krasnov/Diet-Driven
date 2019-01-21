library main;

//import 'package:built_redux_rx/built_redux_rx.dart';
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

class DDApp extends StatefulWidget {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<StatefulWidget> createState() => _DDAppState();
}

class _DDAppState extends State<DDApp> {

  final store = new Store(
    reducerBuilder.build(),
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
    print("before");
    store.actions.initApp();
    print("after");
  }

  // TODO: close store on dispose?!

  @override
  Widget build(BuildContext context) {
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
//          theme:,
            routes: routes,
          initialRoute: "/",
//          onUnknownRoute: (settings) => settings.name,
        ),
    );
  }
}

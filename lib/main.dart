library main;

import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/presentation/home_screen.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/reducers/reducers.dart';
import 'package:diet_driven/models/app_state.dart';

import 'package:built_redux/built_redux.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

void main() => runApp(new DDApp());

class DDApp extends StatefulWidget {

  static final GlobalKey<_DDAppState> ddAppKey = GlobalKey<_DDAppState>();

  @override
  Key get key => ddAppKey;

  @override
  State<StatefulWidget> createState() => _DDAppState();
}

class _DDAppState extends State<DDApp> {

  final store = new Store(
    reducerBuilder.build(),
    new AppState(),
    new Actions(),
  );

  @override
  void initState() {
    super.initState();
    // TODO: load in default page
    store.actions.goTo(store.state.defaultPage);

  }

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
          title: "Diet Driven",
//          theme:,
            routes: routes,
        ),
    );
  }
}

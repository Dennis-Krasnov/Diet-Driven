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

void main() {
  final store = new Store(
    reducerBuilder.build(),
    new AppState(),
    new Actions(),
  );

  runApp(new DDApp(store));
}

class DDApp extends StatelessWidget {
  final Store<AppState, AppStateBuilder, Actions> store;
  final GlobalKey storeKey = GlobalKey();


  DDApp(this.store);

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


//    store.actionStream(ActionsNames.reorderBottomNavigation).

//    (storeKey.currentWidget as ReduxProvider).store.

    return new ReduxProvider(
        key: storeKey,
        store: store,
        child: new MaterialApp(
          title: "Diet Driven",
//          theme:,
            routes: routes,
        ),
    );
  }
}

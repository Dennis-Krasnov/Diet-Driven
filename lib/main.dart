library main;

import 'package:diet_driven/presentation/home_screen.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/reducers/reducers.dart';
import 'package:diet_driven/models/app_state.dart';

import 'package:built_redux/built_redux.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

//part 'main.g.dart';

void main() {
  final store = new Store(
    reducerBuilder.build(),
    new AppState(),
    new Actions(),
  );

  runApp(new ConnectorExample(store));
}

class ConnectorExample extends StatelessWidget {
  final Store<AppState, AppStateBuilder, Actions> store;

  ConnectorExample(this.store);

  @override
  Widget build(BuildContext context) {
    return new ReduxProvider(
        store: store,
        child: new MaterialApp(
          title: "Diet Driven",
//          theme:,
          routes: {
            "/": (context) => HomeScreen(),
//            "/log":
//            "/track":
          },
        ),
    );
//    return new MaterialApp(
//      title: 'flutter_built_redux_test',
//      home: new ReduxProvider(
//        store: store,
//        child: new CounterWidget(),
//      ),
//    );
  }
}

/// [CounterWidget] impelments [StoreConnector] manually
class CounterWidget extends StoreConnector<AppState, Actions, int> {
  CounterWidget();

  @override
  int connect(AppState state) => state.count;

  @override
  Widget build(BuildContext context, int count, Actions actions) =>
      new Scaffold(
        body: new Row(
          children: <Widget>[
            new RaisedButton(
              onPressed: null, //actions.increment,
              child: new Text('Increment!'),
            ),
            new Text('Count: $count'),
          ],
        ),
      );
}

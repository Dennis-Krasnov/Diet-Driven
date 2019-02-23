import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:flutter/material.dart';

///
class Connector extends StatefulWidget {
  final Actions actions;
  final FS connection;
  final Widget Function(BuildContext context) builder;

  Connector(this.actions, this.connection, {@required this.builder});

  @override
  State<StatefulWidget> createState() => new ConnectorState();
}

/// Higher order component subscribes to Firestore with given connector
/*
class DiaryPage extends StoreConnector<AppState, Actions, int> {

  @override
  DiaryPageVM connect(AppState state) {
    return state.some_number;
  }

  @override
  Widget build(BuildContext context, int some_number, Actions actions) {
    var diary = new FoodDiaryCollection((b) => b
      ..userId = some_number;
    );

    return Connector(actions, diary, builder: (BuildContext context) {
      return Text("now vm has updated data");
    });
  }
}
 */
class ConnectorState extends State<Connector> {

  @override
  void initState() {
    super.initState();
    widget.actions.firestore.subscribe(FSPath(widget.connection, [widget.hashCode])); // FIXME: takes the connector, not widget itself, pass a hashcode/id!
  }

  @override
  void dispose() {
    widget.actions.firestore.unsubscribe(FSPath(widget.connection, [widget.hashCode])); // TODO: just pass hashcode, unsubscribe to all
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
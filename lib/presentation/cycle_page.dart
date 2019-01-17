library cycle_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'cycle_page.g.dart';

class CyclePage extends StoreConnector<AppState, Actions, CyclePageVM> {
  @override
  CyclePageVM connect(AppState state) {
//    return CyclePageVM((b) => b..subscriptions = state.subscriptions.toBuilder());
    return CyclePageVM((b) => b
      ..subscriptions = state.subscriptions.toMap()
      ..widgets = state.widgets.toBuilder()
    );
  }

  @override
  Widget build(BuildContext context, CyclePageVM vm, Actions actions) {
    var keys = vm.subscriptions.keys.toList();

    return Scaffold(
        body: Container(
            child: Center(
          child: Column(children: [
            RaisedButton(
//              onPressed: () => actions.startSettingsListen(this.hashCode),
              onPressed: () => actions.startDiaryListen(this.hashCode),
              child: Text("ADD SETTINGS SUBSCRIPTION (${vm.subscriptions.length})"),
            ),
            RaisedButton(
//              onPressed: () => actions.stopSettingsListen(this.hashCode),
              onPressed: () {
//                print(vm.widgets);
//                actions.stopSettingsListen(this.hashCode);
                actions.stopDiaryListen(this.hashCode);
//                print(vm.widgets); // this doesn't work, must rebuild to update state!
              },
              child: Text("STOP SETTINGS SUBSCRIPTION"),
            ),
//            Text(vm.subscriptions.toString()),
            Text(vm.widgets.toString()),
//            Column(children: vm.subscriptions.map((conn, lst) => ListTile()).)
            ListView.builder(
                shrinkWrap: true,
                itemCount: vm.subscriptions.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      title: Text(keys[index].toString()),
                      subtitle: Text(vm.subscriptions[keys[index]].toString()),
                    )
            ),
          ]),
        )),
      );
  }
}

//class CyclePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: DrawerNavButton(),
//        title: Text(PageFactory.toText(Page.cycle)),
//      ),
//      body: Container(
//        color: Colors.orangeAccent,
//        child: FlatButton(
//          onPressed: () async {
////            Map<String, dynamic>
////            dynamic resp = await CloudFunctions.instance.call(functionName: 'function-1', parameters: {"message": "boop boop!"});
////            print(resp);
//          },
//          child: Text("Click here for cloud functions!"),
//        ),
//      ),
//    );
//  }
//}

abstract class CyclePageVM implements Built<CyclePageVM, CyclePageVMBuilder> {
//  BuiltMap<Connection, List<int>> get subscriptions;
  Map<Connection, List<int>> get subscriptions;
  BuiltList<int> get widgets;

  CyclePageVM._();

  factory CyclePageVM([updates(CyclePageVMBuilder b)]) = _$CyclePageVM;
}

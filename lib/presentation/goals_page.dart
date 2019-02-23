library goals_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;

import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'goals_page.g.dart';

class GoalsPage extends StoreConnector<AppState, Actions, GoalsPageVM> {
  @override
  GoalsPageVM connect(AppState state) {
    return GoalsPageVM((b) => b
      ..subscriptions = state.subscriptions.toBuilder()
//      ..diaryRecords = state.diaryRecords.toBuilder()
    );
  }

  @override
  Widget build(BuildContext context, GoalsPageVM vm, Actions actions) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerNavButton(),
        title: Text(PageFactory.toText(Page.goals)),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            Text(vm.subscriptions.toString()),

//            ListView.builder(
//              shrinkWrap: true,
//              itemCount: vm.subscriptions.length,
//              itemBuilder: (BuildContext context, int index) {
//                var r = vm.subscriptions.keys.toList()[index];
//                return ListTile(
//  //                  title: Text((r as FSDiary).docRef.path),
//  //                  subtitle: Text((r as FSDiary).diaryRecordId),//r.listeners.toString()),
//  //                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => actions.stopDiaryListen(r)),
//  //                  title: Text(r.path.generate()),
//                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => actions.firestore.unsubscribe(FSPath(r, vm.subscriptions[r].toList()))),
//                  onTap: () => print(r),
//                );
//              }
//            ),
//            vm.diaryRecords.isEmpty ? CircularProgressIndicator() :
//            ListView.builder(
//              shrinkWrap: true,
//              itemCount: vm.diaryRecords.length,
//              itemBuilder: (BuildContext context, int index) {
//                var r = vm.diaryRecords[index];
//                return ListTile(
//                  title: Text(r.foodName),
//                  subtitle: Text(r.grams.toString()),
//                  onTap: () => print("pressed"),
//                );
//              }
//            )
          ]
          ),
        )
      ),
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

abstract class GoalsPageVM implements Built<GoalsPageVM, GoalsPageVMBuilder> {
  BuiltSetMultimap<FS, int> get subscriptions;
//  BuiltList<FoodRecord> get diaryRecords;

  GoalsPageVM._();

  factory GoalsPageVM([updates(GoalsPageVMBuilder b)]) = _$GoalsPageVM;
}

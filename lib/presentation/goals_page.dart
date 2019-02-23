library goals_page;

import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/uncertainty.dart';
import 'package:flutter/material.dart' hide Builder;

import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'goals_page.g.dart';

class GoalsPage extends StoreConnector<AppState, Actions, GoalsPageVM> {
  @override
  GoalsPageVM connect(AppState state) {
    print("CYCLE!!!");
    print(state.subscriptions);
    return GoalsPageVM((b) => b
//      ..subscriptions = state.subscriptions.toBuilder()
//      ..subscriptions = state.subscriptions.toMap()
      ..subscriptions = state.subscriptions.toBuilder()
      ..diaryRecords = state.diaryRecords.toBuilder()

//      ..widgets = state.widgets.toBuilder()
    );
  }

  @override
  Widget build(BuildContext context, GoalsPageVM vm, Actions actions) {
//    var keys = vm.subscriptions.keys.toList();

//    new FSDocument with Diary();

//    var fsDiary = new FSDocument<FoodRecord>((b) => b
//      ..path = new DiaryRecordPath((b) => b
//        ..userId = "0WjbQ1XzVCe1zvwHgE4aluu4FiC3"
//        ..diaryRecordId = new Random().nextInt(1).toString()
//      )
//      ..listeners = ListBuilder([new Random().nextInt(10)])
//    );

    return Scaffold(
        appBar: AppBar(
          leading: DrawerNavButton(),
          title: Text(PageFactory.toText(Page.goals)),
        ),
        body: Container(
            child: Center(
          child: Column(children: [
            RaisedButton(
              // TODO: give the FSDIARY the list of who's listening!!! just keep track of a list of connections instead!!!
//                onPressed: () => actions.firestore.subscribe(fsDiary),
//                onPressed: () => actions.startDiaryListen(Tuple2(new FSDiary((b) => b..userId = "0WjbQ1XzVCe1zvwHgE4aluu4FiC3" ..diaryRecordId = new Random().nextInt(5000).toString()), [4224])),
//              onPressed: () => actions.startDiaryListen(this.hashCode),
              child: Text("ADD DIARY SUBSCRIPTION"),
            ),
            Text(vm.subscriptions.toString()),


            // TODO: call this from middleware!!! (add line to setmultimap if it didn't exist, else remove it!) - key does the syncing!
            // TODO: it calls reducer that saves it in the SetMultimap<FSDOC, int>

            RaisedButton(
              child: Text("UPDATE"),
              onPressed: () {
//                var fs = new FSDiary((b) => b..userId = "0WjbQ1XzVCe1zvwHgE4aluu4FiC3" ..diaryRecordId = "424222");
//                var fsDiaryRecord = new FSDocument<FoodRecord>((b) => b
//                  ..path = new DiaryRecordPath((b) => b
//                    ..userId = "0WjbQ1XzVCe1zvwHgE4aluu4FiC3"
//                    ..diaryRecordId = "424222"
//                  )
//                );
                // TODO: call this from middleware!!! (add line to setmultimap if it didn't exist, else remove it!) - key does the syncing!
                // TODO: it calls reducer that saves it in the SetMultimap<FSDOC, int>
//                print(fs);

                var food = ["Apple", "Orange", "Pear"];
                food.shuffle();
                var temp = FoodRecord((b) => b
                  ..foodName = food[0]
                  ..grams = new Random().nextDouble() * 100
                  ..uncertainty = Uncertainty.accurate
                  ..sodium = new Random().nextDouble() * 20
                );

//                fsDiaryRecord.update(temp);
              },
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: vm.subscriptions.length,
              itemBuilder: (BuildContext context, int index) {
                var r = vm.subscriptions.keys.toList()[index];
                return ListTile(
//                  title: Text((r as FSDiary).docRef.path),
//                  subtitle: Text((r as FSDiary).diaryRecordId),//r.listeners.toString()),
//                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => actions.stopDiaryListen(r)),
//                  title: Text(r.path.generate()),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => actions.firestore.unsubscribe(FSPath(r, vm.subscriptions[r].toList()))),
                  onTap: () => print(r),
                );
              }
            ),
            vm.diaryRecords.isEmpty ? CircularProgressIndicator() :
            ListView.builder(
              shrinkWrap: true,
              itemCount: vm.diaryRecords.length,
              itemBuilder: (BuildContext context, int index) {
                var r = vm.diaryRecords[index];
                return ListTile(
                  title: Text(r.foodName),
                  subtitle: Text(r.grams.toString()),
                  onTap: () => print("pressed"),
                );
              }
            )

//            Divider(height: 10,),

//            RaisedButton(
//            onPressed: () => actions.startSettingsListen(this.hashCode),
////            child: Text("ADD SETTINGS SUBSCRIPTION (${vm.subscriptions.length})"),
//            ),
//            RaisedButton(
//            onPressed: () => actions.stopSettingsListen(this.hashCode),
//            child: Text("STOP SETTINGS SUBSCRIPTION"),
//            ),
//            Text(vm.subscriptions.toString()),

//            ListView.builder(
//                shrinkWrap: true,
//                itemCount: vm.subscriptions.length,
//                itemBuilder: (context, index) =>
//                    ListTile(
//                      title: Text(keys[index].toString()),
//                      subtitle: Text(vm.subscriptions[keys[index]].toString()),
//                    )
//            ),
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

abstract class GoalsPageVM implements Built<GoalsPageVM, GoalsPageVMBuilder> {
//  BuiltMap<Connection, List<int>> get subscriptions;
  BuiltList<int> get widgets;
//  BuiltSetMultimap<FSDocument, int> get subscriptions;
//  BuiltList<FS> get subscriptions;
//  BuiltList<Built> get subscriptions;
//  BuiltList<FSDocument> get subscriptions;
  BuiltSetMultimap<FS, int> get subscriptions;
  BuiltList<FoodRecord> get diaryRecords;

  GoalsPageVM._();

  factory GoalsPageVM([updates(GoalsPageVMBuilder b)]) = _$GoalsPageVM;
}

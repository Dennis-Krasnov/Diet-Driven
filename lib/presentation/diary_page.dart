library diary_page;

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

part 'diary_page.g.dart';

class DiaryPage extends StoreConnector<AppState, Actions, DiaryPageVM> {
  @override
  DiaryPageVM connect(AppState state) {
    return DiaryPageVM((b) => b
      ..diaryRecords = state.diaryRecords.toBuilder()
      ..userId = state.user.authUser.uid
    );
  }

  @override
  Widget build(BuildContext context, DiaryPageVM vm, Actions actions) {

    var fsDiary = new FSCollection<FoodRecord>((b) => b
      ..path = new DiaryRecordCollectionPath((b) => b
        ..userId = vm.userId
      )
      ..listeners = ListBuilder([hashCode])
    );

    return Connector(actions, fsDiary, builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: DrawerNavButton(),
          title: Text(PageFactory.toText(Page.diary)),
        ),
        body: ListView(
          children: vm.diaryRecords.map((fr) =>
            ListTile(
              title: Text(fr.foodName),
              subtitle: Text(fr.grams.toString()),
              leading: null,
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => print("DELETE")
              ),
              // TODO: CREATE FSCOLLECTION<FOODRECORD>, WITH DIARY_RECORD_PATH (LISTEN TO ALL DAYS FOR NOW)
            )
          ).toList()//<Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // TODO: actions.navigation.goTo(editPage) with an empty food
            var fsDiaryRecord = new FSDocument<FoodRecord>((b) => b
              ..path = new DiaryRecordPath((b) => b
                ..userId = vm.userId
                ..diaryRecordId = (new Random().nextInt(1000)).toString() // TODO: allow nullable ID, to be generated!!!
              )
              ..listeners = ListBuilder([5235])
            );

            FoodRecord fr = new FoodRecord((b) => b
                ..foodName = "Oola oola ${(new Random().nextInt(1000)).toString()}"
                ..grams = new Random().nextInt(100).toDouble()
                ..uncertainty = Uncertainty.accurate
            );

            fsDiaryRecord.save(fr);
          }
        ),
      );
    });

  }
}

// Use as a (generic) stateful HOC with subscription!!! (generic extends FS)
class Connector extends StatefulWidget {
  final Actions actions;
  final FS connection;
  final Widget Function(BuildContext context) builder;

  Connector(this.actions, this.connection, {@required this.builder});

  @override
  State<StatefulWidget> createState() => new ConnectorState();
}

class ConnectorState extends State<Connector> {

  @override
  void initState() {
    super.initState();
    widget.actions.firestore.subscribe(widget.connection);
  }

  @override
  void dispose() {
    widget.actions.firestore.unsubscribe(widget.connection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

}

abstract class DiaryPageVM implements Built<DiaryPageVM, DiaryPageVMBuilder> {
  BuiltList<FoodRecord> get diaryRecords;
  String get userId;

  DiaryPageVM._();
  factory DiaryPageVM([updates(DiaryPageVMBuilder b)]) = _$DiaryPageVM;
}


//class DiaryPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: DrawerNavButton(),
//        title: Text(PageFactory.toText(Page.diary)),
//      ),
//      body: Container(
//        color: Colors.limeAccent,
//        child: _buildBody(context),
//      ),
//    );
//  }
//}

//Widget _buildBody(BuildContext context) {
//  return StreamBuilder<QuerySnapshot>(
//    stream: Firestore.instance.collection('users').snapshots(),
//    builder: (context, snapshot) {
//      if (!snapshot.hasData) return LinearProgressIndicator();
//
////      return _buildList(context, snapshot.data.documents);
//
//
//      List<Widget> children = snapshot.data.documents
//          .map((record) =>
////          assert(map['name'] != null)
//              SwitchListTile(
//                title: Text("Sex is male"),
//                subtitle: Text(record.reference.path),
//                value: record.data["sex"] == "m",
////                onChanged: (v) => doc.reference.updateData({'sex': v ? "m" : "f"}),
//                onChanged: (v) => Firestore.instance.runTransaction((tx) async {
//                  final freshSnapshot = await tx.get(record.reference);
////                  final fresh = Record.fromSnapshot(freshSnapshot);
//
//                  await tx.update(record.reference, {
//                    'sex': freshSnapshot.data["sex"] == "m" ? "f" : "m"
//                  });
//                }),
//              ))
//          .toList();
//
//      return ListView(
//        children: children,
//        padding: const EdgeInsets.only(top: 20.0),
//      );
//    },
//  );
//}

//final DocumentReference postRef = Firestore.instance.document('posts/123');
  //Firestore.instance.runTransaction((Transaction tx) async {
  //DocumentSnapshot postSnapshot = await tx.get(postRef);
  //if (postSnapshot.exists) {
    //await tx.update(postRef, <String, dynamic>{'likesCount': postSnapshot.data['likesCount'] + 1});
  //}
//});

import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerNavButton(),
        title: Text(PageFactory.toText(Page.diary)),
      ),
      body: Container(
        color: Colors.limeAccent,
        child: _buildBody(context),
      ),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

//      return _buildList(context, snapshot.data.documents);

      List<Widget> children = snapshot.data.documents
          .map((record) =>
//          assert(map['name'] != null)
              SwitchListTile(
                title: Text("Sex is male"),
                subtitle: Text(record.reference.path),
                value: record.data["sex"] == "m",
//                onChanged: (v) => doc.reference.updateData({'sex': v ? "m" : "f"}),
                onChanged: (v) => Firestore.instance.runTransaction((tx) async {
                  final freshSnapshot = await tx.get(record.reference);
//                  final fresh = Record.fromSnapshot(freshSnapshot);

                  await tx.update(record.reference, {
                    'sex': freshSnapshot.data["sex"] == "m" ? "f" : "m"
                  });
                }),
              ))
          .toList();

      return ListView(
        children: children,
        padding: const EdgeInsets.only(top: 20.0),
      );
    },
  );
}

//final DocumentReference postRef = Firestore.instance.document('posts/123');
  //Firestore.instance.runTransaction((Transaction tx) async {
  //DocumentSnapshot postSnapshot = await tx.get(postRef);
  //if (postSnapshot.exists) {
    //await tx.update(postRef, <String, dynamic>{'likesCount': postSnapshot.data['likesCount'] + 1});
  //}
//});

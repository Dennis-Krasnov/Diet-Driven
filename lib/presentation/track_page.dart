library track_page;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'track_page.g.dart';

class TrackPage extends StoreConnector<AppState, Actions, TrackPageVM> {
  TrackPage();

  @override
  TrackPageVM connect(AppState state) => TrackPageVM((b) => b
    ..auth = state.user.authUser
  );

  @override
  Widget build(BuildContext context, TrackPageVM vm, Actions actions) =>
    Scaffold(
      appBar: AppBar(
        leading: GlobalDrawerNavButton(),
        title: Text(PageFactory.toText(Page.track)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: null, // TODO: anonymous by default
              child: Text("Log in as Dennis Krasnov"),
            ),
            Text("uid: ${vm.auth.uid}"),
            Text("email: ${vm.auth.email}"),
            Text("display name: ${vm.auth.displayName}"),
            FlatButton(
              onPressed: () => actions.user.logout(),
              child: Text("Log out"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
//          child: Icon(Icons.edit),
        icon: Icon(Icons.edit),
        label: Text("HELLO"),
//          heroTag: "ANIMATE_FAB",
        onPressed: () {
        }
      ),
    );
}

abstract class TrackPageVM implements Built<TrackPageVM, TrackPageVMBuilder> {
  @nullable
  FirebaseUser get auth;

  TrackPageVM._();

  factory TrackPageVM([updates(TrackPageVMBuilder b)]) = _$TrackPageVM;
}

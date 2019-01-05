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

//  @override
//  FirebaseUser connect(AppState state) => state.user;

  @override
  TrackPageVM connect(AppState state) => TrackPageVM((b) => b
//    ..loading = state.loading
    ..user = state.user);

  // OLD FORMAT:
//  @override
//  TrackPageVM connect(AppState state) {
//    return TrackPageVM((b) => b
//      ..loading = state.loading
//      ..user = state.user
//    );
//  }

  @override
  Widget build(BuildContext context, TrackPageVM vm, Actions actions) =>
      Scaffold(
        appBar: AppBar(
          leading: DrawerNavButton(),
          title: Text(PageFactory.toText(Page.track)),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: null, // TODO: anonymous by default
                child: Text("Log in as Dennis Krasnov"),
              ),
              Text("uid: ${vm.user.uid}"),
              Text("email: ${vm.user.email}"),
              Text("display name: ${vm.user.displayName}"),
              FlatButton(
                onPressed: () => actions.logout(),
                child: Text("Log out"),
              )
            ],
          ),
        ),
      );
}

abstract class TrackPageVM implements Built<TrackPageVM, TrackPageVMBuilder> {
//  bool get loading;

  @nullable
  FirebaseUser get user;

  TrackPageVM._();

  factory TrackPageVM([updates(TrackPageVMBuilder b)]) = _$TrackPageVM;
}
//class TrackPage extends StatelessWidget {
//
////  Future<FirebaseUser> _handleSignIn() async {
////    FirebaseUser user = await _auth.signInWithEmailAndPassword(email: "dennis.krasnov@gmail.com", password: "bobobo");
////    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
////    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
////    FirebaseUser user = await _auth.signInWithGoogle(
////      accessToken: googleAuth.accessToken,
////      idToken: googleAuth.idToken,
////    );
////    print("signed in " + user.displayName);
////    return user;
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: DrawerNavButton(),
//        title: Text(PageFactory.toText(Page.track)),
//      ),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            RaisedButton(
//              onPressed: () async {
////                FirebaseUser user = await _auth.signInWithEmailAndPassword(email: "dennis.krasnov@gmail.com", password: "bobobo")
////                    .catchError((e) => print(e));
////                print("signed in as ${user.displayName}");
////                print("${user.uid}");
////                print("${user.email}");
////                _auth.currentUser().then((u) => u.)
////                .then((FirebaseUser user) => print(user))
////                .catchError((e) => print(e));
//              },
//              child: Text("Log in as Dennis Krasnov"),
//            ),
//            Text("uid: ..."),
//            Text("email: ..."),
//            Text("display name: ..."),
//            FlatButton(
//              onPressed: () async {
////                await _auth.signOut();
//              },
//              child: Text("Log out"),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

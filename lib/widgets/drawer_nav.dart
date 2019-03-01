library drawer_nav;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/wrappers/active_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'drawer_nav.g.dart';

///
class DrawerNav extends StoreConnector<AppState, Actions, DrawerNavigationVM> {

  @override
  DrawerNavigationVM connect(AppState state) {
    return DrawerNavigationVM((b) => b
        ..pages = state.navigation.bottomNavigation.toBuilder()
        ..auth = state.user.authUser
    );
  }

  // TODO: clean up
  @override
  Widget build(BuildContext context, DrawerNavigationVM vm, Actions actions) =>
    ActivePage(builder: (BuildContext context, Page activePage) {
      return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.network("https://denniskrasnov.com/img/dk/logo-72.png"),
              otherAccountsPictures: <Widget>[
  //                  GestureDetector(
  //                    onTap: () => print("GO TO WORKOUT DRIVEN"),
  //                    child: Image.network("https://denniskrasnov.com/img/dk/logo-72.png"),
  //                  ),
              ],
              accountName: Text(
                vm.auth.isAnonymous ? "Anonymous user": vm.auth.email,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                ),
              ),
  //                accountName: Text("Dennis Krasnov"),
              accountEmail: Text(
                vm.auth.uid,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                ),
              ),
  //                accountEmail: Text("dennis.krasnov@gmail.com"),
  //                onDetailsPressed: () => print("details clicked"),
            ),
            // TODO: SingleChildScrollView
            Column(
              children: Page.inApp.map((page) =>
                ListTile(
                  leading: PageFactory.toIcon(page),
                  title: Text(
                    PageFactory.toText(page),
                    style: TextStyle(
                      fontFamily: "SourceSansPro",
                      fontSize: 16
                    ),
                  ),
                  selected: page == activePage,
                  onTap: () => actions.navigation.goTo(page),
                )
              ).toList(),
            ),
          ],
        ),
      );
    });
}

abstract class DrawerNavigationVM implements Built<DrawerNavigationVM, DrawerNavigationVMBuilder> {
  BuiltList<Page> get pages;
  FirebaseUser get auth;

  DrawerNavigationVM._();

  factory DrawerNavigationVM([updates(DrawerNavigationVMBuilder b)]) =
      _$DrawerNavigationVM;
}


library drawer_nav;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/active_page.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'drawer_nav.g.dart';

class DrawerNav extends StoreConnector<AppState, Actions, DrawerNavigationVM> {

  @override
  DrawerNavigationVM connect(AppState state) {
    return DrawerNavigationVM((b) => b
      ..pages = state.bottomNavigation
    );
  }

  @override
  Widget build(BuildContext context, DrawerNavigationVM vm, Actions actions) =>
      ActivePage(builder: (BuildContext context, Page activePage) {
        return Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Image.network("https://www.w3schools.com/w3images/avatar2.png"),
                otherAccountsPictures: <Widget>[
                  GestureDetector(
                    onTap: () => print("Image 1"),
                    child: Image.network("https://www.w3schools.com/howto/img_avatar.png"),
                  ),
                  GestureDetector(
                    onTap: () => print("Image 2"),
                    child: Image.network("https://www.w3schools.com/w3images/avatar6.png"),
                  ),
                  GestureDetector(
                    onTap: () => print("Image 3"),
                    child: Image.network("https://www.w3schools.com/w3images/avatar4.png",),
                  ),
                ],
                accountName: Text("Dennis Krasnov"),
                accountEmail: Text("dennis.krasnov@gmail.com"),
                onDetailsPressed: () => print("details clicked"),
              ),
              Column(
                children: Page.inApp.map((page) =>
                    ListTile(
                      leading: PageFactory.toIcon(page),
                      title: Text(PageFactory.toText(page)),
                      selected: page == activePage,
                      onTap: () => actions.goTo(page),
                    )
                ).toList(),
              ),
            ],
          ),
        );
      });
}

abstract class DrawerNavigationVM
    implements Built<DrawerNavigationVM, DrawerNavigationVMBuilder> {
  List<Page> get pages;

  DrawerNavigationVM._();

  factory DrawerNavigationVM([updates(DrawerNavigationVMBuilder b)]) =
      _$DrawerNavigationVM;
}


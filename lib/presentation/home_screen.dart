import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/bottom_nav.dart';
import 'package:diet_driven/containers/bottom_navigation_page.dart';
import 'package:diet_driven/containers/drawer_nav.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/main.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNav(),
      body: BottomNavPage(
          builder: (BuildContext context, Page bottomNavigationPage) {
            return PageFactory.toPage(bottomNavigationPage);
          }),
      bottomNavigationBar: BottomNav(),
      primary: false,
    );
  }

  @override
  void initState() {
    super.initState();

    DDApp.ddAppKey.currentState.store..actionStream(ActionsNames.goTo).listen((change) {
      if (change.prev.bottomNavigation.contains(change.action.payload)) {
        Navigator.popUntil(context, ModalRoute.withName("/"));
      }
      else {
        Navigator.popAndPushNamed(context, change.action.payload.toString());
      }

      print('Previous: ${change.prev.activePage}');
      print('Next: ${change.next.activePage}');
      print('Action: ${change.action.name}');
      print("");
    });

    // TODO: attempt to get context of app instead, put this into DDApp
    DDApp.ddAppKey.currentState.store..actionStream(ActionsNames.reorderBottomNavigation).listen((change) {
      // Open same page in nested page
      if (change.prev.bottomNavigation.contains(change.prev.activePage) && !change.next.bottomNavigation.contains(change.prev.activePage)) {
        Navigator.pushNamed(context, change.prev.activePage.toString());
      } // Open same page in bottom navigation
      else if (!change.prev.bottomNavigation.contains(change.prev.activePage) && change.next.bottomNavigation.contains(change.prev.activePage)) {
        Navigator.popUntil(context, ModalRoute.withName("/"));
      }

      print('Previous: ${change.prev.bottomNavigation}');
      print('Next: ${change.next.bottomNavigation}');
      print('Action: ${change.action.name}');
      print("");
    });
  }

}
//class HomeScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer: DrawerNav(),
//      body: BottomNavPage(
//          builder: (BuildContext context, Page bottomNavigationPage) {
//        return PageFactory.toPage(bottomNavigationPage);
//      }),
//      bottomNavigationBar: BottomNav(),
//      primary: false,
//    );
//  }
//}
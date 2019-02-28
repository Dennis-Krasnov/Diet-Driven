import 'package:diet_driven/containers/bottom_nav.dart';
import 'package:diet_driven/containers/bottom_navigation_page.dart';
import 'package:diet_driven/containers/drawer_nav.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

///
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNav(),
      body: BottomNavPage(builder: (BuildContext context, Page bottomNavigationPage) =>
        PageFactory.toPage(bottomNavigationPage)),
      bottomNavigationBar: BottomNav(),
      primary: false,
    );
  }
}
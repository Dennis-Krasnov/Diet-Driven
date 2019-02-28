import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/widgets/bottom_nav.dart';
import 'package:diet_driven/widgets/drawer_nav.dart';
import 'package:diet_driven/wrappers/bottom_navigation_page.dart';
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
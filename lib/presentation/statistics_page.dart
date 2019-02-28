import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GlobalDrawerNavButton(),
        title: Text(PageFactory.toText(Page.statistics)),
      ),
      body: Container(
        color: Colors.indigoAccent,
      ),
    );
  }
}

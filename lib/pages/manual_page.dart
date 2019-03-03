import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/wrappers/drawer_nav_button.dart';
import 'package:flutter/material.dart';

class ManualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GlobalDrawerNavButton(),
        title: Text(PageFactory.toText(Page.manual)),
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.close),
        label: Text("sign out"),
        onPressed: () {

        },
      ),
    );
  }
}

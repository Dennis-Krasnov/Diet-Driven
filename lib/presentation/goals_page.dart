library goals_page;

import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GlobalDrawerNavButton(),
        title: Text(PageFactory.toText(Page.goals)),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: FlatButton(
          onPressed: () async {
//            Map<String, dynamic>
//            dynamic resp = await CloudFunctions.instance.call(functionName: 'function-1', parameters: {"message": "boop boop!"});
//            print(resp);
          },
          child: Text("Click here for cloud functions!"),
        ),
      ),
    );
  }
}

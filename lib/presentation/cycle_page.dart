import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

import 'package:cloud_functions/cloud_functions.dart';

class CyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerNavButton(),
        title: Text(PageFactory.toText(Page.cycle)),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: FlatButton(
          onPressed: () async {
//            Map<String, dynamic>
            dynamic resp = await CloudFunctions.instance.call(functionName: 'function-1', parameters: {"message": "Ola!"});
            print(resp);
          },
          child: Text("Click here for cloud functions!"),
        ),
      ),
    );
  }
}

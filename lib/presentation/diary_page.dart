import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PageFactory.toText(Page.diary)),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: Page.values.map((page) =>
            RaisedButton(
              child: Text(PageFactory.toText(page)),
              onPressed: () => Navigator.pushNamed(context, page.toString()),
            )
          ).toList(),
        ),
      ),
    );
  }

}
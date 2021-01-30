import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DiaryScreen build");
    return Scaffold(
      appBar: AppBar(title: Text("Diary ...")),
      body: Center(child: Container(width: 100, height: 100, color: Colors.red)),
    );
  }
}

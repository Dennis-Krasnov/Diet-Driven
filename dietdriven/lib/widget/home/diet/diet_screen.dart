import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DietScreen build");
    return Scaffold(
      appBar: AppBar(title: Text("Diet")),
      body: Center(child: Container(width: 100, height: 100, color: Colors.orange)),
    );
  }
}

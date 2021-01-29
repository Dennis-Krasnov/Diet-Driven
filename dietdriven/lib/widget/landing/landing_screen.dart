import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  final LandingDeepLink deepLink;

  const LandingScreen({Key key, this.deepLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("landing screen - $deepLink")));
  }
}
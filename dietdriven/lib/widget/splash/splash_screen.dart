import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final SplashDeepLink deepLink;

  const SplashScreen({Key key, this.deepLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("splash screen - $deepLink")));
  }
}
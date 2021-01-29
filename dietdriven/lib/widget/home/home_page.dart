import 'package:dietdriven/navigation/deep_link/home/home_deep_link.dart';
import 'package:dietdriven/widget/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends Page<void> {
  final HomeDeepLink deepLink;

  HomePage({this.deepLink}) : super(key: ValueKey(deepLink));

  @override
  Route<void> createRoute(BuildContext context) {
    print("home deep link is ${deepLink.currentPage}");
    return MaterialPageRoute(
      builder: (context) => HomeScreen(deepLink: deepLink),
      settings: this,
    );
  }
}
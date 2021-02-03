import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends Page<void> {
  HomePage() : super(key: Key("Home page"));

  @override
  Route<void> createRoute(BuildContext context) {
    buildLog.v("HomePage - createRoute");
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
      settings: this,
    );
  }
}
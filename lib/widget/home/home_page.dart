import 'package:dietdriven/widget/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends Page<void> {
  HomePage() : super(key: Key("Home Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("home page create route");
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
      settings: this,
    );
  }
}
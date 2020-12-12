import 'package:dietdriven/widget/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends Page<void> {
  HomePage() : super(key: Key("Home page"));

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
      settings: this,
    );
  }
}
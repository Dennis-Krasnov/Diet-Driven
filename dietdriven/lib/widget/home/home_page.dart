import 'package:dietdriven/widget/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends Page<void> {
  const HomePage({LocalKey key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
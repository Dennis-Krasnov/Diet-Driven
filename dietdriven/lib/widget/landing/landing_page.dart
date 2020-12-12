import 'package:dietdriven/widget/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends Page<void> {
  LandingPage() : super(key: Key("Landing page"));

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => LandingScreen(),
      settings: this,
    );
  }
}

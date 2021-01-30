import 'package:dietdriven/widget/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends Page<void> {
  LandingPage() : super(key: Key("Landing Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("landing page create route");
    return MaterialPageRoute(
      builder: (context) => LandingScreen(),
      settings: this,
    );
  }
}

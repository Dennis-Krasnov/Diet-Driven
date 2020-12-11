import 'package:dietdriven/widget/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends Page<void> {
  const LandingPage({LocalKey key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(builder: (context) => LandingScreen());
  }
}

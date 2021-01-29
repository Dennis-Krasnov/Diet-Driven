import 'package:dietdriven/navigation/deep_link/landing/landing_deep_link.dart';
import 'package:dietdriven/widget/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends Page<void> {
  final LandingDeepLink deepLink;

  LandingPage({this.deepLink}) : super(key: ValueKey(deepLink));

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => LandingScreen(deepLink: deepLink),
      settings: this,
    );
  }
}

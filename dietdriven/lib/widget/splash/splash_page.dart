import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:dietdriven/widget/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends Page<void> {
  final SplashDeepLink deepLink;

  SplashPage({this.deepLink}) : super(key: ValueKey(deepLink));

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => SplashScreen(deepLink: deepLink),
      settings: this,
    );
  }
}

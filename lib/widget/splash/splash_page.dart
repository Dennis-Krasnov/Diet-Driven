import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends Page<void> {
  SplashPage() : super(key: Key("Splash page"));

  @override
  Route<void> createRoute(BuildContext context) {
    buildLog.v("SplashPage - createRoute");
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
      settings: this,
    );
  }
}

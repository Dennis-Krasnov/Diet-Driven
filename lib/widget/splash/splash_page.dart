import 'package:dietdriven/widget/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends Page<void> {
  SplashPage() : super(key: Key("Splash Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("splash page create route");
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
      settings: this,
    );
  }
}

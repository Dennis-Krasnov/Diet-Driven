import 'package:dietdriven/widget/build_logger.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildLog.v("SplashScreen - rebuild");
    return Scaffold(backgroundColor: Colors.white);
  }
}
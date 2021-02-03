import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_screen.dart';
import 'package:flutter/material.dart';

class UnrecoverableFailurePage extends Page<void> {
  UnrecoverableFailurePage() : super(key: Key("Unrecoverable failure page"));

  @override
  Route<void> createRoute(BuildContext context) {
    buildLog.v("UnrecoverableFailurePage - createRoute");
    return MaterialPageRoute(
      builder: (context) => UnrecoverableFailureScreen(),
      settings: this,
    );
  }
}
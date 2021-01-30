import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_screen.dart';
import 'package:flutter/material.dart';

class UnrecoverableFailurePage extends Page<void> {
  UnrecoverableFailurePage() : super(key: Key("Unrecoverable Failure Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("unrecoverable failure page create route");
    return MaterialPageRoute(
      builder: (context) => UnrecoverableFailureScreen(error: "TEMPORARY", stackTrace: null), // FIXME deepLink.error
      settings: this,
    );
  }
}
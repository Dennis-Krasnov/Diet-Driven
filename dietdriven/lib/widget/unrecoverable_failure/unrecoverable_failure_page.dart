import 'package:dietdriven/navigation/deep_link/failure/failure_deep_link.dart';
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_screen.dart';
import 'package:flutter/material.dart';

class UnrecoverableFailurePage extends Page<void> {
  final FailureDeepLink deepLink;

  UnrecoverableFailurePage({this.deepLink}) : super(key: ValueKey(deepLink));

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => UnrecoverableFailureScreen(error: deepLink.error, stackTrace: null), // FIXME
      settings: this,
    );
  }
}
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_screen.dart';
import 'package:flutter/material.dart';

class UnrecoverableFailurePage extends Page<void> {
  final String error;
  final String stackTrace;

  UnrecoverableFailurePage({this.error, this.stackTrace}) : super(key: Key("Unrecoverable failure page"));

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => UnrecoverableFailureScreen(error: error, stackTrace: stackTrace),
      settings: this,
    );
  }
}
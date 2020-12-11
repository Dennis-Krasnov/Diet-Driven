import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_screen.dart';
import 'package:flutter/material.dart';

class UnrecoverableFailurePage extends Page<void> {
  const UnrecoverableFailurePage({LocalKey key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(builder: (context) => UnrecoverableFailureScreen());
  }
}
import 'package:flutter/material.dart';

class UnrecoverableFailureScreen extends StatelessWidget {
  final String error;
  final String stackTrace;

  const UnrecoverableFailureScreen({Key key, this.error, this.stackTrace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(error)));
    // TODO: restart app
     // https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
  }
}

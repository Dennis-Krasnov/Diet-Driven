import 'package:flutter/material.dart';

class SuccessFailIcon extends StatelessWidget {
  final bool isSuccess;

  const SuccessFailIcon({Key key, this.isSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final successIcon = Icon(Icons.check, color: Colors.green);
    final failureIcon = Icon(Icons.error, color: Colors.red);
    return isSuccess ? successIcon : failureIcon;
  }
}

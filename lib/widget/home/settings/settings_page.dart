import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsPage extends Page<void> {
  SettingsPage() : super(key: Key("Settings page"));

  @override
  Route<void> createRoute(BuildContext context) {
    buildLog.v("SettingsPage - createRoute");
    return MaterialPageRoute(
      builder: (context) => SettingsScreen(),
      settings: this,
    );
  }
}
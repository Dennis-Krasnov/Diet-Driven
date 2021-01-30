import 'package:dietdriven/widget/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsPage extends Page<void> {
  SettingsPage() : super(key: Key("Settings page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("settings page create route");
    return MaterialPageRoute(
      builder: (context) => SettingsScreen(),
      settings: this,
    );
  }
}
import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:dietdriven/widget/home/diet/diet_screen.dart';
import 'package:flutter/material.dart';

class DietPage extends Page<void> {
  DietPage() : super(key: Key("diet page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("diet create route");
    return MaterialPageRoute(
      builder: (context) => DietScreen(),
      settings: this,
    );
  }
}
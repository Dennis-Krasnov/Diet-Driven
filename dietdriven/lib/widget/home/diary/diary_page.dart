import 'package:dietdriven/navigation/deep_link/home/home_deep_link.dart';
import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:dietdriven/widget/home/diary/diary_screen.dart';
import 'package:dietdriven/widget/home/home_screen.dart';
import 'package:flutter/material.dart';

class DiaryPage extends Page<void> {
  DiaryPage() : super(key: Key("Diary page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("diary create route");
    return MaterialPageRoute(
      builder: (context) => DiaryScreen(),
      settings: this,
    );
  }
}
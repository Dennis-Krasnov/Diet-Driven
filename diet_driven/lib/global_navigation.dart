library global_navigation;

import 'package:flutter/material.dart';

import 'models/models.dart';

/// ...
/// A new instance of [GlobalNavigation] is lazily created on first use.
///
/// https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart
/// http://gameprogrammingpatterns.com/singleton.html
class GlobalNavigation {
//  / Configures routes as well
//  static final GlobalNavigation _singleton = new GlobalNavigation._internal()..configureRoutes();
  static final GlobalNavigation _singleton = new GlobalNavigation._internal();

  // FIXME: these don't work in a switch statement

  ///
  static final String homePage = "/";

  ///
  static final String manualFoodRecordEditor = "/manual_food_record_edit";

  ///
  static final String liveFoodRecordEditor = "/live_food_record_edit";

  ///
  static final String foodLogging = "/food_logging";

  /// Also used as confirmation for RFID logging
  static final String selectionInformation = "/food_logging";

  factory GlobalNavigation() {
    return _singleton;
  }

  GlobalNavigation._internal();
}

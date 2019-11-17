///*
// * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
// * Use of this source code is governed by the MIT license that can be found
// * in the LICENSE file.
// */
//
//import 'package:bloc_logging/bloc_logger.dart';
//import 'package:diet_driven/widgets/navigation_pop_observer.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:rest_router/parser.dart';
//import 'package:rest_router/rest_navigator.dart';
//
//import 'package:diet_driven/widgets/settings/settings.dart';
//import 'package:diet_driven/blocs/blocs.dart';
//
/////
//class SettingsPage extends StatefulWidget {
//  @override
//  _SettingsPageState createState() => _SettingsPageState();
//}
//
//class _SettingsPageState extends State<SettingsPage> {
//  /// Persists navigation across tabs.
//  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: "settings globay key"); // FIXME: pass into here!?
//
//  /// Profile page's navigator routes.
//  final router = Router({
//    SettingsDeepLink().toString(): (BuildContext context, parameters) => MainSettingsPage(),
//    [SettingsDeepLink(), DiarySettingsDeepLink()].join("/"): (BuildContext context, parameters) => DiarySettingsPage(),
////    "${SettingsDL()}/${Routes.generalSettings}": (BuildContext context, parameters) => GeneralSettingsPage(),
////    "${Routes.settings}/${Routes.diarySettings}": (BuildContext context, parameters) => DiarySettingsPage(),
////    "${SettingsDeepLink()}/${ThemeSettingsDeepLink()}": (BuildContext context, parameters) => BlocProvider.value(
//    [SettingsDeepLink(), ThemeSettingsDeepLink()].join("/"): (BuildContext context, parameters) => Scaffold(appBar: AppBar(title: Text("THEME!!"),), body: Center(child: RaisedButton(child: Text("dialog"), onPressed: () async {
////      showDialog<void>(context: context, builder: (BuildContext context) => AlertDialog(
////        title: const Text("My Super title"),
////        content: const Text("Hello World"),
////      )
//          int res = await showDialog<int>(
//          context: context,
//          builder: (BuildContext context) {
//            return SimpleDialog(
//              title: const Text('Select'),
//              children: <Widget>[
//                SimpleDialogOption(
//                  onPressed: () { Navigator.pop(context, 1); },
//                  child: const Text('test 1'),
//                ),
//                SimpleDialogOption(
//                  onPressed: () { Navigator.pop(context, 2); },
//                  child: const Text('test 1'),
//                ),
//              ],
//            );
//          }
//      );
//          print(res);
//
//          Navigator.of(context).pop(res);
//
////      );
//    },),),),
//  }, onUnknownRouteHandler: (BuildContext context, parameters) => Scaffold(body: Center(child: Text("404 route not found: ${parameters[urlPathKey].first}"))),
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    // Need to specify custom back button behaviour
//    return WillPopScope(
//      // Navigator vetoes a pop if they're the first route in the history
//      // This behavior prevents the user from popping the first route off the history and being stranded at a blank screen
//      onWillPop: () async => !await navigatorKey.currentState.maybePop(),
//      child: Navigator(
//        key: navigatorKey,
//        observers: [NavigationPopObserver(BlocProvider.of<NavigationBloc>(context))],
//        initialRoute: SettingsDeepLink().toString(),
//        onGenerateRoute: router.generator,
//      ),
//    );
//  }
//}
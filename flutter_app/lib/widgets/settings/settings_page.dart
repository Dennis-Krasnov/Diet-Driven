/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_router/parser.dart';
import 'package:rest_router/rest_navigator.dart';

import 'package:diet_driven/widgets/settings/settings.dart';
import 'package:diet_driven/blocs/blocs.dart';

///
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  /// Persists navigation across tabs.
  final navigatorKey = GlobalKey<NavigatorState>();

  /// Profile page's navigator routes.
  final router = Router({
    Routes.settings: (BuildContext context, parameters) => MainSettingsPage(),
    "${Routes.settings}/${Routes.generalSettings}": (BuildContext context, parameters) => GeneralSettingsPage(),
    "${Routes.settings}/${Routes.diarySettings}": (BuildContext context, parameters) => DiarySettingsPage(),
    "${Routes.settings}/${Routes.themeSettings}": (BuildContext context, parameters) => BlocProvider.value(
      value: BlocProvider.of<UserDataBloc>(context),
      child: ThemeSettingsPage(),
    ),
    // TODO: handle unknown route gracefully, don't push an arbitrary number of invalid deep link pages on top of each other...
  }, onUnknownRouteHandler: (BuildContext context, parameters) => throw Exception('Invalid deep link: ${parameters[urlPathKey]}'));

  @override
  Widget build(BuildContext context) {
    // Need to specify custom back button behaviour
    return WillPopScope(
      // Navigator vetoes a pop if they're the first route in the history
      // This behavior prevents the user from popping the first route off the history and being stranded at a blank screen
      onWillPop: () async => !await navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: navigatorKey,
        observers: [SettingsPopObserver(BlocProvider.of<NavigationBloc>(context))],
        initialRoute: Routes.settings,
        onGenerateRoute: router.generator,
      ),
    );
  }
}

/// Removes settings's last deep link on navigator pop.
class SettingsPopObserver extends NavigatorObserver {
  final NavigationBloc navigationBloc;

  SettingsPopObserver(this.navigationBloc);

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) => navigationBloc.dispatch(NavigateToSettings((b) => b
    // The [deepLink] list must not be empty
    ..deepLink = navigationBloc.currentState.deepLink?.rebuild((b) => b..removeLast())?.toBuilder()
  ));
}
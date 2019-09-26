/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/widgets/settings/settings.dart';
import 'package:diet_driven/blocs/blocs.dart';

/// must be ...
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  /// Persists navigation across tabs.
  final navigatorKey = GlobalKey<NavigatorState>();

  ///
//  PopObserver navigatorObserver;

  @override
  Widget build(BuildContext context) {
    // Need to specify custom back button behaviour
    return WillPopScope(
      // Navigator vetoes a pop if they're the first route in the history
      // This behavior prevents the user from popping the first route off the history and being stranded at a blank screen
      onWillPop: () async => !await navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: navigatorKey,
        observers: [PopObserver(BlocProvider.of<NavigationBloc>(context))],
        initialRoute: Routes.settings,
        onGenerateRoute: (RouteSettings settings) => generateRoute(context, settings),
      ),
    );
  }

  /// Profile page's navigator routes.
  Route generateRoute(BuildContext context, RouteSettings settings) {
    final bool withAnimation = settings?.arguments ?? true;
    LoggingBloc().verbose(withAnimation.toString());

    WidgetBuilder builder;
    switch (settings.name) {
      case Routes.settings:
        builder = (BuildContext _) => MainSettingsPage();
        break;
      case "${Routes.settings}/${Routes.generalSettings}":
        builder = (BuildContext _) => GeneralSettingsPage();
        break;
      case "${Routes.settings}/${Routes.diarySettings}":
        builder = (BuildContext _) => DiarySettingsPage();
        break;
        // ,,,
      case "${Routes.settings}/${Routes.themeSettings}":
        builder = (BuildContext _) => BlocProvider.value(
          value: BlocProvider.of<UserDataBloc>(context),
          child: ThemeSettingsPage(),
        );
        break;
        // ,,,
      default:
        throw Exception('Invalid deep link: ${settings.name}');
    }

    // TODO: make global navigator follow this builder pattern as well

    if (withAnimation) {
      return MaterialPageRoute<void>(builder: builder, settings: settings);
    }
    else {
      return NoAnimationMaterialPageRoute<void>(builder: builder, settings: settings);
    }
    // TODO: debug back button!! - unmute breakpoints, document all these decisions!
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
      builder: builder,
      maintainState: maintainState,
      settings: settings,
      fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class PopObserver extends NavigatorObserver {
  final NavigationBloc navigationBloc;

  PopObserver(this.navigationBloc);

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) => navigationBloc.dispatch(NavigateToSettings((b) => b
    ..deepLink = navigationBloc.currentState.deepLink?.rebuild((b) => b..removeLast())?.toBuilder()
  ));
}
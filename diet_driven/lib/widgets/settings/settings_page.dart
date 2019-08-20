/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/widgets/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class SettingsPage extends StatelessWidget {
  // Persists navigation across tabs
  final GlobalKey<NavigatorState> navigationKey;

  const SettingsPage({Key key, @required this.navigationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      initialRoute: 'settings',
      onGenerateRoute: (RouteSettings settings) => generateRoute(context, settings),
    );
  }

  /// Profile page's navigator routes.
  Route generateRoute(BuildContext context, RouteSettings settings) {
    final userId = (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid;
    final bool withAnimation = settings?.arguments ?? true;

    WidgetBuilder builder;
    switch (settings.name) {
      case 'settings':
        builder = (BuildContext _) => MainSettingsPage();
        break;
      case 'settings/general':
        builder = (BuildContext _) => GeneralSettingsPage();
        break;
      case 'settings/profile':
        builder = (BuildContext _) => GeneralSettingsPage();
        break;
      case 'settings/diary':
        builder = (BuildContext _) => DiarySettingsPage();
        break;
        // ,,,
      case 'settings/theme':
        // TODO: own bloc if very complex logic!
//        builder = (BuildContext _) => BlocProvider<SettingsEditBloc>(
//          builder: (BuildContext context) => SettingsEditBloc(
//            userId: userId,
//            settingsRepository: RepositoryProvider.of<SettingsRepository>(context)
//          ),
//          child: ThemeSettingsPage()
//        );

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

    // Animate only if coming from same page
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

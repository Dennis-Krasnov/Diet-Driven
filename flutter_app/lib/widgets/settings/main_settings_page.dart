/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logger.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/blocs.dart' as prefix0;
import 'package:diet_driven/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// TODO: move to utils
class MalformedDeepLink implements Exception {
  String path;
  MalformedDeepLink(this.path);

  @override
  String toString() => "Invalid route: $path";
}

void pushIfNecessary(BuildContext context, {@required String path, bool animate = false, Object arguments}) {
  if (!ModalRoute.of(context).settings.name.startsWith(path)) {
//    if (animate) {
      Navigator.of(context).pushNamed(path, arguments: arguments);
//    }
//    else {
      // TODO
//    }
  }
}

class MainSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      condition: (NavigationState previous, NavigationState current) =>
        previous is NavigationRoute && current is NavigationRoute
        && current.page == Page.settings
        // Avoid firing deep link logic on pops
        && !(previous.page == Page.settings && current.currentDeepLinks().length - previous.currentDeepLinks().length < 0),
        listener: (BuildContext context, NavigationState navigationState) {
        final routeState = navigationState as NavigationRoute;

        // Pop to most lowest common ancestor
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).popUntil((route) => routeState.currentPath().startsWith(route.settings.name));
        }

        //
        final deepLinkIterator = routeState.currentDeepLinks().iterator..moveNext();

        try {
          final settingsDL = deepLinkIterator.current as SettingsDeepLink;
          BlocLogger().fine("Halding settings deep link: $settingsDL");

//          if (!ModalRoute.of(context).settings.name.startsWith("/diary")) {
//            // pageController.animateToPage(...)
//          }

          if (!deepLinkIterator.moveNext()) {
            return;
          }

          if (deepLinkIterator.current is DiarySettingsDeepLink) {
            final diarySettingsDL = deepLinkIterator.current as DiarySettingsDeepLink;
            BlocLogger().fine("Halding diary settings deep link: $diarySettingsDL");

            pushIfNecessary(context, path: "settings/diary", animate: routeState.shouldAnimatePush);
          }
          else if (deepLinkIterator.current is ThemeSettingsDeepLink) {
            final themeSettingsDL = deepLinkIterator.current as ThemeSettingsDeepLink;
            BlocLogger().fine("Halding theme settings deep link: $themeSettingsDL");

            pushIfNecessary(context, path: "settings/theme", animate: routeState.shouldAnimatePush);

            // update iterator (with cast)
            // todo: nested if __ is nested...
          }
          else {
            throw MalformedDeepLink(routeState.currentPath());
          }
        } on MalformedDeepLink catch (e) {
          // Pop to root
          while (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }

          // Go to non-existing page (404 error screen)
          Navigator.of(context).pushNamed(routeState.currentPath());

          BlocLogger().unexpectedError(null, e);
        }
      },
        // TODO: remove unused bloc builder!?
      child: BlocBuilder<UserDataBloc, UserDataState>(
//        condition: (previous, current) => true,
        builder: (BuildContext context, UserDataState userDataState) {
//          if (userDataState is UserDataLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  SettingsListTile(
//                      iconData: FaRegular(0xf013),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "General",
                    subtitleText: "Language, Units, Time",
                    navigationEvent: null,//Push((b) => b..deepLink = null),
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf007),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Account",
                    subtitleText: "Profile, Subscriptions, Import/Export data",
                  ),

                  SettingsListTile(
//                      iconData: const FaRegular(0xf5d1),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Diary",
                    subtitleText: "Calories, Nutrients, Meals, Logging",
                    navigationEvent: Push((b) => b..deepLink = DiarySettingsDeepLink()),
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf496),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Track",
                    subtitleText: "Measurements, Goals",
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf201),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Reports",
                    subtitleText: "Time intervals, ",
                  ),

                  SettingsListTile(
//                      iconData: const FaRegular(0xf53f),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Theme",  // TODO: rename bloc, from theme to visuals?
                    subtitleText: "Navigation, Dark mode, Colour scheme",
                    navigationEvent: Push((b) => b..deepLink = ThemeSettingsDeepLink()),
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf021),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Integrations",
                    subtitleText: "Google Fit, Fitbit",
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf0f3),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Notifications",
                    subtitleText: "Google Fit, Fitbit",
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf460),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "Coaching",
                    subtitleText: "None",
                  ),

                  const SettingsListTile(
//                      iconData: FaRegular(0xf059),
                    iconData: FontAwesomeIcons.gamepad,
                    titleText: "About",
                    subtitleText: "Help, MIT license, Feedback",
                  ),

                  BlocBuilder<ConfigurationBloc, ConfigurationState>(
                    condition: (previous, current) => true,
                    builder: (BuildContext context, ConfigurationState configurationState) {
                      final packageInfo = (configurationState as ConfigurationLoaded).packageInfo;
                      return Text("${packageInfo.appName} ${packageInfo.version}+${packageInfo.buildNumber}; bonus is ${(configurationState as ConfigurationLoaded).remoteConfiguration.bonus}");
                    }
                  )
                ],
              )
            )
          );
//          }
        }
      )
    );
  }
}


class SettingsListTile extends StatelessWidget {
  final IconData iconData;
  final String titleText;
  final String subtitleText;
//  final String chipText; this.chipText,
  final NavigationEvent navigationEvent;

  const SettingsListTile({Key key, @required this.iconData, @required this.titleText, this.subtitleText, this.navigationEvent})
      : assert(iconData != null), assert(titleText != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconData != null ? CircleAvatar(
        child: Icon(iconData), 
        backgroundColor: Colors.transparent, 
        foregroundColor: Theme.of(context).unselectedWidgetColor // OPTIMIZE
      ) : null,
      title: Text(titleText, style: Theme.of(context).textTheme.body2),
      subtitle: subtitleText != null ? Text(subtitleText, style: Theme.of(context).textTheme.body1) : null,
      onTap: navigationEvent != null ? () => BlocProvider.of<NavigationBloc>(context).dispatch(navigationEvent) : null,
//      trailing: chipText != null ? Transform(
//        transform: Matrix4.identity()..scale(0.75),
//        child: Chip(
//          label: Text(chipText),
//          labelStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.5),
//          shape: BeveledRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(2))),
//          backgroundColor: Theme.of(context).primaryColorDark,
//          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
//        ),
//      ) : null,
    );
  }
}

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);

    return BlocListener<NavigationEvent, NavigationState>(
      bloc: navigationBloc,
      listener: (BuildContext context, NavigationState state) {
        // Settings deep link handler
        if (state is SettingsTab && state.deepLink != null) {
          // Guarantee root page of settings navigation
          Navigator.of(context).popUntil(ModalRoute.withName('settings')); // TODO: without animation

          if (state.deepLink is ProfileDeepLink) {

          }

          if (state.deepLink is DiarySettingsDeepLink) {
            Navigator.of(context).pushNamed("settings/diary", arguments: false); // FIXME state is SettingsTab doesn't work as already in settings TODO pass as argument in deep link!!
          }

          if (state.deepLink is ThemeDeepLink) {
            Navigator.of(context).pushNamed("settings/theme", arguments: false);
          }

          // Ensuring deep link is used exactly once
          navigationBloc.dispatch(ClearDeepLink());
        }
      },
      child: BlocBuilder<UserDataEvent, UserDataState>(
        bloc: _userDataBloc,
        condition: (previous, current) => true,
        builder: (BuildContext context, UserDataState userDataState) {
          if (userDataState is UserDataLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Settings"),
              ),
              body: SafeArea(
                child: ListView(
                  children: <Widget>[
                    const SettingsListTile(
                      iconData: FaRegular(0xf013),
                      titleText: "General",
                      subtitleText: "Language, Units, Time",
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf007),
                      titleText: "Account",
                      subtitleText: "Profile, Subscriptions, Import/Export data",
                    ),
                    
                    SettingsListTile(
                      iconData: const FaRegular(0xf5d1),
                      titleText: "Diary",
                      subtitleText: "Calories, Nutrients, Meals, Logging",
                      navigationEvent: NavigateToSettings((b) => b..deepLink = DiarySettingsDeepLink()),
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf496),
                      titleText: "Track",
                      subtitleText: "Measurements, Goals",
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf201),
                      titleText: "Reports",
                      subtitleText: "Time intervals, ",
                    ),
                    
                    SettingsListTile(
                      iconData: const FaRegular(0xf53f),
                      titleText: "Theme",  // TODO: rename bloc, from theme to visuals?
                      subtitleText: "Navigation, Dark mode, Colour scheme",
                      chipText: "NEW",
                      navigationEvent: NavigateToSettings((b) => b..deepLink = ThemeDeepLink()),
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf021),
                      titleText: "Integrations",
                      subtitleText: "Google Fit, Fitbit",
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf0f3),
                      titleText: "Notifications",
                      subtitleText: "Google Fit, Fitbit",
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf460),
                      titleText: "Coaching",
                      subtitleText: "None",
                    ),
                    
                    const SettingsListTile(
                      iconData: FaRegular(0xf059),
                      titleText: "About",
                      subtitleText: "Help, MIT license, Feedback",
                    ),

                    BlocBuilder<ConfigurationEvent, ConfigurationState>(
                      bloc: BlocProvider.of<ConfigurationBloc>(context),
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
          }
        }
      )
    );
  }
}


class SettingsListTile extends StatelessWidget {
  final IconData iconData;
  final String titleText;
  final String subtitleText;
  final String chipText;
  final NavigationEvent navigationEvent;

  const SettingsListTile({Key key, @required this.iconData, @required this.titleText, this.subtitleText, this.chipText, this.navigationEvent})
      : assert(iconData != null), assert(titleText != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconData != null ? CircleAvatar(
        child: Icon(iconData), 
        backgroundColor: Colors.transparent, 
        foregroundColor: Theme.of(context).unselectedWidgetColor
      ) : null,
      title: Text(titleText, style: Theme.of(context).textTheme.body2),
      subtitle: subtitleText != null ? Text(subtitleText, style: Theme.of(context).textTheme.body1) : null,
      onTap: navigationEvent != null ? () => BlocProvider.of<NavigationBloc>(context).dispatch(navigationEvent) : null,
      trailing: chipText != null ? Transform(
        transform: Matrix4.identity()..scale(0.75),
        child: Chip(
          label: const Text("NEW"),
          labelStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.5),
          shape: BeveledRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(2))),
          backgroundColor: Theme.of(context).primaryColorDark,
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        ),
      ) : null,
    );
  }
}

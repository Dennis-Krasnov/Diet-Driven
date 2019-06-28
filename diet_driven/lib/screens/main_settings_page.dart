import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/screens/tabbed_navigation.dart';
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
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf013)), backgroundColor: Colors.white,), //, foregroundColor: Colors.green
                      title: Text("General", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Language, Units, Time", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf007)), backgroundColor: Colors.white,),
                      title: Text("Account", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Profile, Subscriptions, Import/Export data", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf5d1)), backgroundColor: Colors.white,),
                      title: const Text("Diary"),
                      subtitle: const Text("Calories, Nutrients, Meals, Logging"),
                      onTap: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                        ..deepLink = DiarySettingsDeepLink()
                      )),
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf496)), backgroundColor: Colors.white,),
                      title: Text("Track", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Measurements, Goals", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf201)), backgroundColor: Colors.white,),
                      title: Text("Reports", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Time intervals, ", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf53f)), backgroundColor: Colors.white,),
                      title: Text("Theme", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Navigation, Dark mode, Colour scheme", style: Theme.of(context).textTheme.body1),
                      onTap: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                        ..deepLink = ThemeDeepLink() // TODO: rename bloc, from theme to visuals?
                      )),
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf021)), backgroundColor: Colors.white,),
                      title: Text("Integrations", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Google Fit, Fitbit", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf0f3)), backgroundColor: Colors.white,),
                      title: Text("Notifications", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Google Fit, Fitbit", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf460)), backgroundColor: Colors.white,),
                      title: Text("Coaching", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("None", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(FaRegular(0xf059)), backgroundColor: Colors.white,),
                      title: Text("About", style: Theme.of(context).textTheme.body2),
                      subtitle: Text("Help, MIT license, Feedback", style: Theme.of(context).textTheme.body1),
                      onTap: () => null,
                      enabled: false,
                    ),
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

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
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
              appBar: AppBar(),
              body: SafeArea(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/settings.png"),
                      title: const Text("General"),
                      subtitle: const Text("Language, Units, Time"),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/profile.png"),
                      title: const Text("Account"),
                      subtitle: const Text("Profile, Subscriptions, Import/Export data"),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: Image.asset("assets/food.png"),
                      title: const Text("Diary"),
                      subtitle: const Text("Calories, Nutrients, Meals, Logging"),
                      onTap: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                        ..deepLink = DiarySettingsDeepLink()
                      )),
                    ),
                    ListTile(
                      leading: Image.asset("assets/track.png"),
                      title: const Text("Track"),
                      subtitle: const Text("Measurements, Goals"),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: Image.asset("assets/graph.png"),
                      title: const Text("Reports"),
                      subtitle: const Text("Time intervals, "),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: Image.asset("assets/colour.png"),
                      title: const Text("Theme"), // TODO: rename bloc, from theme to visuals?
                      subtitle: const Text("Navigation, Dark mode, Colour scheme"),
                      onTap: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                        ..deepLink = ThemeDeepLink()
                      )),
                    ),
                    ListTile(
                      leading: Image.asset("assets/sync.png"),
                      title: const Text("Integrations"),
                      subtitle: const Text("Google Fit, Fitbit"),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: Image.asset("assets/mail.png"),
                      title: const Text("Notifications"),
                      subtitle: const Text("None"),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: Image.asset("assets/track.png"),
                      title: const Text("Coaching"),
                      subtitle: const Text("None"),
                      onTap: () => null,
                      enabled: false,
                    ),
                    ListTile(
                      leading: Image.asset("assets/cart.png"),
                      title: const Text("About"),
                      subtitle: const Text("Help, MIT license, Feedback"),
                      onTap: () => null,
                      enabled: false,
                    ),
                    // TODO: notifications
                    // TODO: coaching
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

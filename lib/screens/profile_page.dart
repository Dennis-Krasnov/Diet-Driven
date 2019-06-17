import 'dart:math';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class ProfilePage extends StatelessWidget {
  // Persists navigation across tabs
  final GlobalKey<NavigatorState> navigationKey;

  const ProfilePage({Key key, @required this.navigationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      initialRoute: 'profile',
      onGenerateRoute: (RouteSettings settings) => generateRoute(context, settings),
    );

    // FIXME: doesn't solve the issue!!, wrapping element with provider + builder also doesn't solve
//    return BlocProvider<SettingsEditBloc>(
//      builder: (BuildContext context) => SettingsEditBloc(userDataBloc: BlocProvider.of<UserDataBloc>(context), userRepository: Repository().user),
//      dispose: (BuildContext context, SettingsEditBloc settingsEditBloc) => settingsEditBloc.dispose(),
//      child: Navigator(
//        key: navigationKey,
//        initialRoute: 'profile',
//        onGenerateRoute: (RouteSettings settings) => generateRoute(context, settings),
//      ),
//    );
  }

  /// Profile page navigator's routes.
  Route generateRoute(BuildContext context, RouteSettings settings) {
    final arguments = settings.arguments;

    WidgetBuilder builder;
    switch (settings.name) {
      case 'profile':
        builder = (BuildContext _) => ProfileInfo();
        break;
      case 'profile/settings':
        builder = (BuildContext _) => BlocProvider<SettingsEditBloc>(
          builder: (BuildContext context) => SettingsEditBloc(userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", userRepository: Repository().user), // FIXME
          dispose: (BuildContext context, SettingsEditBloc settingsEditBloc) => settingsEditBloc.dispose(),
          child: SettingsPage()
        );
        break;
      default:
        throw Exception('Invalid deep link: ${settings.name}');
    }

    // TODO: make global navigator follow this builder pattern as well
    return MaterialPageRoute<void>(builder: builder, settings: settings);
  }
}


class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocListener<NavigationEvent, NavigationState>(
      bloc: BlocProvider.of<NavigationBloc>(context),
      listener: (BuildContext context, NavigationState state) {
        // Deep link handler
        if (state is ProfileTab && state.setting != null) {
          print("SETTING IS ${state.setting}");
          if (Navigator.of(context).canPop())
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          Navigator.of(context).pushNamed("profile/settings");
        }
      },
      child: BlocBuilder<UserDataEvent, UserDataState>(
        bloc: _userDataBloc,
        condition: (previous, current) => true,
        builder: (BuildContext context, UserDataState userDataState) {
          if (userDataState is UserDataLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(userDataState.settings.themeSettings.darkMode.toString()),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context).pushNamed("profile/settings");
                    }
                  ),
                ],
              ),
              body: SafeArea(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        userDataState.authentication.uid,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "subscription: ${userDataState.userDocument.currentSubscription}",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    RaisedButton(
                      child: const Text("go to settings parameterized"),
                      onPressed: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToProfile((b) => b
                        ..setting = Random().nextInt(10000).toString()
                      )),
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

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final SettingsEditBloc settingsEditBloc = BlocProvider.of<SettingsEditBloc>(context);

    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      builder: (BuildContext context, UserDataState userDataState) {
        return Scaffold(
          appBar: AppBar(title: Text((BlocProvider.of<NavigationBloc>(context).currentState is ProfileTab ? ((BlocProvider.of<NavigationBloc>(context).currentState as ProfileTab)?.setting ?? "no deep link specified"): "") )),
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Theme",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                SwitchListTile(
                  title: const Text('Dark mode'),
                  value: (userDataState as UserDataLoaded).settings.themeSettings.darkMode, // TODO: entire settings edit state is just Settings object!!! - null when not ready
                  // TODO bloc method that does this specific thing
                  onChanged: (bool value) => settingsEditBloc.dispatch(UpdateDarkMode((b) => b..darkMode = value)),
                  secondary: const Icon(Icons.lightbulb_outline),
                ),

                TextField(onChanged: (value) => print(value)),
              ],
            )
          )
        );
      }
    );
  }
}

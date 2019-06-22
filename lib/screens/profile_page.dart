import 'dart:math';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocListener<NavigationEvent, NavigationState>(
      bloc: BlocProvider.of<NavigationBloc>(context),
      listener: (BuildContext context, NavigationState state) {
        // Deep link handler
        if (state is ProfileTab) {
          if (state.setting != null) {
            print("SETTING IS ${state.setting}");
            // TODO: make this a reusable method!!!
            if (Navigator.of(context).canPop())
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            Navigator.of(context).pushNamed("profile/settings");
          }
          if (state.subscriptionType != null) {
            print("SUBSCRIPTION IS ${state.subscriptionType}");
            if (Navigator.of(context).canPop())
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            // TODO: await push, then clear navigation so I can press it again!
            Navigator.of(context).pushNamed("profile/subscription");
          }
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
                      // TODO: dispatch event in order to clear previous deep links!!!
//                      Navigator.of(context).pushNamed("profile/settings");
                      BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToProfile((b) => b
                        ..setting = "none" // FIXME: moving between tabs causes 'no deep link behaviour' - inconsistent (solution: make null and "none" as equivalents)
                      ));
                    }
                  ),
                  IconButton(
                    icon: const Icon(Icons.monetization_on),
                    onPressed: () {
                      BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToProfile((b) => b
                        ..subscriptionType = SubscriptionType.diet_driven_yearly
                      ));
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
      case 'profile/subscription':
        builder = (BuildContext _) => BlocProvider<SubscriptionEditBloc>(
          builder: (BuildContext context) => SubscriptionEditBloc(userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", userRepository: Repository().user), // FIXME
          dispose: (BuildContext context, SubscriptionEditBloc subscriptionEditBloc) => subscriptionEditBloc.dispose(),
          child: SubscriptionPage()
        );
        break;
      default:
        throw Exception('Invalid deep link: ${settings.name}');
    }

    // TODO: make global navigator follow this builder pattern as well
    return MaterialPageRoute<void>(builder: builder, settings: settings);
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
                  onChanged: (bool value) => settingsEditBloc.dispatch(UpdateDarkMode((b) => b
                    ..darkMode = value
                    ..completer = infoSnackBarCompleter(context, "dark mode ${value ? "enabled" : "disabled"}")
                  )),
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

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SubscriptionEditBloc subscriptionEditBloc = BlocProvider.of<SubscriptionEditBloc>(context);

    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      builder: (BuildContext context, UserDataState userDataState) {
        return Scaffold(
          appBar: AppBar(title: Text((BlocProvider.of<NavigationBloc>(context).currentState is ProfileTab ? ((BlocProvider.of<NavigationBloc>(context).currentState as ProfileTab)?.subscriptionType.toString() ?? "no deep link specified"): "") )),
//          appBar: AppBar(title: Text((BlocProvider.of<NavigationBloc>(context).currentState is ProfileTab ? ((BlocProvider.of<NavigationBloc>(context).currentState as ProfileTab)?.setting ?? "no deep link specified"): "") )),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Text((userDataState as UserDataLoaded).userDocument.currentSubscription.toString()),
                DropdownButton<SubscriptionType>(
                  items: [
                    for (var sub in SubscriptionType.values)
                      DropdownMenuItem(
                        value: sub,
                        child: Text(sub.toString()),
                      )
                  ],
                  onChanged: (SubscriptionType newValue) => subscriptionEditBloc.dispatch(Subscribe((b) => b
                    ..subscriptionType = newValue
                    ..completer = infoSnackBarCompleter(context, "subscribed to $newValue") // TODO: welcome to pro / sorry to see you go screen
                  )),
                  value: (userDataState as UserDataLoaded).userDocument.currentSubscription,
                )
              ],
            )
          )
        );
      }
    );
  }
}

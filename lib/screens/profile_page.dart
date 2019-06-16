import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigationKey;

  const ProfilePage({Key key, @required this.navigationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      initialRoute: 'profile',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'profile':
            builder = (BuildContext _) => ProfileInfo();
            break;
          case 'profile/settings':
            builder = (BuildContext _) => SettingsPage();
            break;
          default:
            throw Exception('Invalid deep link: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}


class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocListener<NavigationEvent, NavigationState>(
      bloc: BlocProvider.of<NavigationBloc>(context),
      listener: (BuildContext context, NavigationState state) {
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
                        ..onlyIfUninitialized = false
                        ..setting = Random().nextInt(10000).toString()
                      )),
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

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: _userDataBloc,
      builder: (BuildContext context, UserDataState userDataState) {
        if (userDataState is UserDataLoaded) {
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
                  SwitchListTile( // TODO: move to settings page, create its own bloc
                    // TODO: create branch, attempt to make proper navigation! - subnavigation!
                    title: const Text('Dark mode'),
                    value: userDataState.settings.themeSettings.darkMode,
                    // TODO bloc method that does this specific thing
                    onChanged: (bool value) => _userDataBloc.dispatch(UpdateSettings((b) => b..darkMode = value)),
                    secondary: const Icon(Icons.lightbulb_outline),
                  ),

                  TextField(

                    onChanged: (value) => print(value),
                  )
                ],
              )
            )
          );
        }
      }
    );
  }
}

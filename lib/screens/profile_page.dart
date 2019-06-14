import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);

    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: _userDataBloc,
      builder: (BuildContext context, UserDataState userDataState) {
        if (userDataState is UserDataLoaded) {
          return Scaffold(
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
                  ListTile(
                    title: Text(
                      "Theme",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                  SwitchListTile( // TODO: move to settings page, create its own bloc
                    title: const Text('Dark mode'),
                    value: userDataState.settings.themeSettings.darkMode,
                    // TODO bloc method that does this specific thing
                    onChanged: (bool value) => _userDataBloc.dispatch(UpdateSettings((b) => b..darkMode = value)),
                    secondary: const Icon(Icons.lightbulb_outline),
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

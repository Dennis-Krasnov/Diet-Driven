import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/completer.dart';

class ThemeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingsEditBloc settingsEditBloc = BlocProvider.of<SettingsEditBloc>(context);

    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      builder: (BuildContext context, UserDataState userDataState) {
        return Scaffold(
          appBar: AppBar(title: const Text("Theme Settings")),
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Dark mode'),
                  secondary: const Icon(Icons.brightness_2),
                  value: (userDataState as UserDataLoaded).settings.themeSettings.darkMode,
                  onChanged: (bool value) => settingsEditBloc.dispatch(UpdateDarkMode((b) => b
                    ..darkMode = value
                    ..completer = infoSnackBarCompleter(context, "Dark mode ${value ? "enabled" : "disabled"}")
                  )),
                ),
              ],
            )
          )
        );
      }
    );
  }
}

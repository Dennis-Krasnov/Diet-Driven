import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/completer.dart';

class ThemeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingsEditBloc settingsEditBloc = BlocProvider.of<SettingsEditBloc>(context);

    // User data builder
    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      builder: (BuildContext context, UserDataState userDataState) {
        // Settings edit builder
        return BlocBuilder<SettingsEditEvent, SettingsEditState>(
          bloc: settingsEditBloc,
          builder: (BuildContext context, SettingsEditState settingsEditState) {
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
                      ))
                    ),
                  ],
                )
              )
            );
          }
        );
      }
    );
  }
}

//if (settingsEditState.updateDarkModeState == "loading")
//Shimmer.fromColors(
//child: SwitchListTile(
//title: const Text('Dark mode'),
//secondary: const Icon(Icons.brightness_2),
//value: (userDataState as UserDataLoaded).settings.themeSettings.darkMode,
////                      selected: (userDataState as UserDataLoaded).settings.themeSettings.darkMode,
//),
//baseColor: Colors.grey[300], highlightColor: Colors.grey[100],
//)
////                      const Align(child: CircularProgressIndicator(), alignment: FractionalOffset.center,)
//else
//SwitchListTile(
//title: const Text('Dark mode'),
//secondary: const Icon(Icons.brightness_2),
//value: (userDataState as UserDataLoaded).settings.themeSettings.darkMode,
//onChanged: (bool value) => settingsEditBloc.dispatch(UpdateDarkMode((b) => b
//..darkMode = value
//..completer = infoSnackBarCompleter(context, "Dark mode ${value ? "enabled" : "disabled"}")
//)),
////                      selected: (userDataState as UserDataLoaded).settings.themeSettings.darkMode,
//),

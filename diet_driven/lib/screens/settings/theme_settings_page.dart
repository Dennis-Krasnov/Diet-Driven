import 'package:diet_driven/screens/tabbed_navigation.dart';
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
              appBar: AppBar(
                title: const Text("Theme Settings"),
//                actions: <Widget>[
//                  IconButton(
//                    icon: const Icon(FaRegular(0xf0e2)),
//                    tooltip: "Reset to defaults",
//                    onPressed: () => null,
//                  )
//                ],
              ),
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
                      activeColor: Theme.of(context).primaryColor,
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8.0),
                      child: Text("Primary colour", style: Theme.of(context).textTheme.headline),
                    ),
                    for (var colour in ["Red", "Green", "Blue"])
                      RadioListTile<String>(
                        title: Text(colour),
                        value: colour,
                        groupValue: "Red", // current value from state
                        onChanged: (String value) => null,
                        activeColor: Theme.of(context).primaryColor,
                        secondary: Container(color: colour == "Red" ? Colors.red : colour == "Green" ? Colors.green : Colors.blue, height: 20, width: 20,),
                      ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8.0),
                      child: Text("Re-arrange navigation", style: Theme.of(context).textTheme.headline),
                    ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Text("Navigation", style: Theme.of(context).textTheme.headline),
//                          IconButton(
//                            icon: const Icon(FaRegular(0xf0e2)),
//                            tooltip: "Reset to defaults",
//                            onPressed: () => null,
//                            iconSize: 12,
//                          )
//                        ],
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      ),
//                    ),
                    Row(
                      children: <Widget>[
                        for (var page in (userDataState as UserDataLoaded).settings.navigationSettings.bottomNavigationPages)
                          CircleAvatar(child: Icon(FaRegular(page.toFontAwesomeIcon())), backgroundColor: Colors.white, foregroundColor: Colors.black,)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    FlatButton(
                      child: const Text("Shuffle"),
                      onPressed: () => (userDataState as UserDataLoaded).settings.navigationSettings.bottomNavigationPages.toList().shuffle(), // TODO: update firestore
                    ),
                    FlatButton(
                      child: const Text("Reset theme settings"),
                      onPressed: () => null, // TODO: delete theme settings document for user
                      // TODO: make icon button in app bar?
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

import 'package:diet_driven/widgets/core/core.dart';
import 'package:diet_driven/widgets/font_awesome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/completer.dart';

class ThemeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (BuildContext context, UserDataState userDataState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Theme Settings"),
            // TODO: reset to defaults
          ),
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Dark mode'),
                  secondary: const Icon(Icons.brightness_2),
                  value: (userDataState as UserDataLoaded).settings.themeSettings.darkMode,
                  /// TODO: make food diary follow similar pattern!
                  onChanged: (bool value) => BlocProvider.of<UserDataBloc>(context).dispatch(UpdateDarkMode((b) => b
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
                MaterialColorPicker(
                  allowShades: false,
                  onMainColorChange: (ColorSwatch colour) {
                    BlocProvider.of<UserDataBloc>(context).dispatch(UpdatePrimaryColour((b) => b
                      ..colourValue = colour.value
                    ));
                  },
                  selectedColor: Color((userDataState as UserDataLoaded).settings.themeSettings.primaryColourValue),
                  colors: [
                    Colors.red,
                    Colors.deepOrange,
                    Colors.yellow,
                    Colors.lightGreen
                  ],
                ),
//                for (var colour in [Colors.red, Colors.green, Colors.blue])
//                  RadioListTile<String>(
//                    title: Text(colour.value.toString()),
//                    value: colour.value.toString(),
////                    selected: colourNameToCode(colour) == (userDataState as UserDataLoaded).settings.themeSettings.primaryColour,
//                    groupValue: (userDataState as UserDataLoaded).settings.themeSettings.primaryColour,
//                    onChanged: (String value) => BlocProvider.of<UserDataBloc>(context).dispatch(UpdatePrimaryColour((b) => b
//                      ..colourValue = colour.value
//                    )),
//                    activeColor: Theme.of(context).primaryColor,
//                    secondary: SizedBox(child: Container(color: colour), height: 24, width: 24,),
//                  ),
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
                      CircleAvatar(child: Icon(FaRegular(page.toFontAwesomeCode())), backgroundColor: Colors.white, foregroundColor: Colors.black,)
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
}

//String colourNameToCode(String colourName) {
//  if (colourName == "Red") {
//    return "0xFFFF5722";
//  }
//  if (colourName == "Green") {
//    return "0xFF008000";
//  }
//  if (colourName == "Blue") {
//    return "0xFF00a8dd";
//  }
//}

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

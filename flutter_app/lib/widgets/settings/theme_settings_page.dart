/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/completer.dart';

enum ThemeSettingsPageOverflowActions { resetSettings }

class ThemeSettingsPage extends StatelessWidget {
  /// Primary colour options.
  final primaryColourOptions = const <Color>[
    Color(0xff76333c),
    Color(0xffb76b01),
    Color(0xff013901),
    Color(0xff1a4350),
//    Colors.red[500],
//    Colors.deepOrange[500],
//    Colors.yellow[500],
    // TODO
  ].map(colourToColourSwatch);

  /// 'flutter_material_color_picker' library exclusives uses colour swatches.
  static ColorSwatch<dynamic> colourToColourSwatch(Color colour) => ColorSwatch<dynamic>(colour.value, <dynamic, Color>{500: colour});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (BuildContext context, UserDataState userDataState) {
        // User's current primary colour
        final primaryColour = Color((userDataState as UserDataLoaded).settings.theme.primaryColourValue);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Theme Settings"),
            actions: <Widget>[
              PopupMenuButton<ThemeSettingsPageOverflowActions>(
                onSelected: (ThemeSettingsPageOverflowActions result) {
                  if (result == ThemeSettingsPageOverflowActions.resetSettings) {
                    // TODO
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeSettingsPageOverflowActions>>[
                  const PopupMenuItem<ThemeSettingsPageOverflowActions>(
                    value: ThemeSettingsPageOverflowActions.resetSettings,
                    child: Text('Reset theme settings'),
                  ),
                ]
              )
            ],
            // TODO: reset to defaults
          ),
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Dark mode'),
                  secondary: const Icon(Icons.brightness_2),
                  value: (userDataState as UserDataLoaded).settings.theme.darkMode,
                  /// TODO: make food diary follow similar pattern!
                  onChanged: (bool value) => BlocProvider.of<UserDataBloc>(context).add(UpdateDarkMode((b) => b
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
                  onMainColorChange: (ColorSwatch colour) => BlocProvider.of<UserDataBloc>(context).add(UpdatePrimaryColour((b) => b
                    ..colourValue = colour.value
                  )),
                  selectedColor: primaryColour,
                  colors: [
                    // Active colour isn't one of options
                    if (!primaryColourOptions.any((colour) => colour.value == primaryColour.value))
                      colourToColourSwatch(primaryColour),
                    // Default colour options
                    ...primaryColourOptions
                  ],
                ),
              ],
            )
          )
        );
      }
    );
  }
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/core/core.dart';
import 'package:diet_driven/widgets/message/message.dart';

/// Globally rebuilds app based on configuration and theme settings.
/// Configures global theme and navigation routes.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fixme: called twice....
    LoggingBloc().verbose("");
    LoggingBloc().verbose("======================");
    LoggingBloc().verbose("App started");

    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (BuildContext context, ConfigurationState configurationState) {
        LoggingBloc().verbose("Configuration rebuild");

        return BlocBuilder<UserDataBloc, UserDataState>(
            condition: (previous, current) {
              // Unconditional rebuild
              if (previous is! UserDataLoaded || current is! UserDataLoaded)
                return true;

              // Rebuild only if theme settings changed
              return (previous as UserDataLoaded).settings.themeSettings != (current as UserDataLoaded).settings.themeSettings;
            },
            builder: (BuildContext context, UserDataState userDataState) {
              LoggingBloc().verbose("Theme rebuild");

              return MaterialApp(
                home: ConfigurationSettingsDecision(configurationState: configurationState, userDataState: userDataState),
                // Use default theme while user data is loading
                theme: generateThemeSettings(userDataState is UserDataLoaded ? userDataState.settings.themeSettings : null),
                onUnknownRoute: (RouteSettings setting) => MaterialPageRoute<dynamic>(builder: (BuildContext context) => ErrorPage(error: "${setting.name} route not found")),
                debugShowCheckedModeBanner: false,
              );
            }
        );
      }
    );
  }


  /// Creates Flutter theme data from theme settings.
  ThemeData generateThemeSettings(ThemeSettings themeSettings) {

    // Primary colour
    final Color defaultPrimaryColour = Colors.deepOrange;
    Color primaryColour;

    try {
      primaryColour = Color(num.tryParse(themeSettings?.primaryColour) ?? defaultPrimaryColour.value);
    } catch (e) {
      primaryColour = defaultPrimaryColour;
    }

    // TODO: polish

    return ThemeData(
//      brightness: themeSettings.darkMode ? Brightness.dark : Brightness.light,

      // APP BAR
      appBarTheme: AppBarTheme(
//        brightness: themeSettings.darkMode ? Brightness.dark : Brightness.light,
        color: Colors.white, // TODO: ternary on dark mode!?
        elevation: 1.5,
        textTheme: TextTheme(
          title: TextStyle(
              fontSize: 18, // 20
              color: Colors.black87,
              fontWeight: FontWeight.w600 // FontWeight.w400
          ),
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
      ),

      // TYPOGRAPHY
//      disabledColor: Colors.red,
//      fontFamily: "Inter",
//      textTheme: ,
//        text

        fontFamily: "Inter",
//        textTheme: Typography.englishLike2018,
        textTheme: TextTheme(
//          display4   : TextStyle(debugLabel: 'Diet Driven display4 2018', fontSize: 96.0, fontWeight: FontWeight.w300, textBaseline: TextBaseline.alphabetic, letterSpacing: -1.5),
//          display3   : TextStyle(debugLabel: 'englishLike display3 2018', fontSize: 60.0, fontWeight: FontWeight.w300, textBaseline: TextBaseline.alphabetic, letterSpacing: -0.5),
//          display2   : TextStyle(debugLabel: 'englishLike display2 2018', fontSize: 48.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.0),
//          display1   : TextStyle(debugLabel: 'englishLike display1 2018', fontSize: 34.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.25),
          // Meal name heading??
//          headline   : TextStyle(debugLabel: 'Diet Driven headline', fontSize: 24, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.0),
          // Scaffold title
          title      : TextStyle(debugLabel: 'Diet Driven title',    fontSize: 18, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, color: const Color.fromRGBO(0, 0, 0, 0.9)),
//          subhead    : TextStyle(debugLabel: 'englishLike subhead 2018',  fontSize: 16.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.15),
          // Food record subtitle
          body2      : TextStyle(debugLabel: 'Diet Driven body2',    fontSize: 10, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, color: const Color.fromRGBO(0, 0, 0, 0.6)),
          // Food record title
          body1      : TextStyle(debugLabel: 'Diet Driven body1',    fontSize: 14, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, color: const Color.fromRGBO(0, 0, 0, 0.87)),
//          button     : TextStyle(debugLabel: 'englishLike button 2018',   fontSize: 14.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.75),
//          caption    : TextStyle(debugLabel: 'englishLike caption 2018',  fontSize: 12.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.4),
//          subtitle   : TextStyle(debugLabel: 'englishLike subtitle 2018', fontSize: 14.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.1),
          // see track headings
//          overline   : TextStyle(debugLabel: 'englishLike overline 2018', fontSize: 10.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 1.5),
        ),
//      englishLike2018
//      textTheme: TextTheme(
        // Heading
//          headline: TextStyle(
//            fontWeight: FontWeight.w600,
//            fontSize: 12,
//            color: Colors.black.withOpacity(0.6),
//          ),


          //  // FIXME: affects all built-in listtiles !! - MAKE THIS THE HEADER INSTEAD OF HEADER 2 and use everywhere, // TODO: find the style that naturally styles subtitle too!
//        subhead: TextStyle(
//          fontWeight: FontWeight.w600,
//          fontSize: 12,
//          color: Colors.black.withOpacity(0.2),
//        ),
          // List tile title
//          body2: TextStyle(
////          fontWeight: FontWeight.w600,
//              fontSize: 15,
////          color: Colors.black87
//              color: Colors.black.withOpacity(0.8)
//          ),
//
//          // List tile subtitle
//          body1: TextStyle(
//              fontSize: 12,
//              color: Colors.black54
////            color: Colors.black.withOpacity(60)
//          )

//        title: TextStyle(
////          fontWeight: FontWeight.w600,
//        ),
//        subtitle: TextStyle(
//
//        ),
//        caption: TextStyle(
//          fontSize: 14,
////          fontWeight: FontWeight.w600
//        )
//      ),

      // Colours
      primaryColor: primaryColour,
//      primaryColor: Colors.deepOrange,
      primaryColorDark: Colors.deepOrange,
//      colorScheme: ColorScheme.light(
//        primary: Colors.deepOrange,
//        primaryVariant: Colors.yellow,
//        onPrimary: Colors.pink
//      ),
//
//        display4   : TextStyle(debugLabel: 'englishLike display4 2018', fontSize: 96.0, fontWeight: FontWeight.w300, textBaseline: TextBaseline.alphabetic, letterSpacing: -1.5),
//    display3   : TextStyle(debugLabel: 'englishLike display3 2018', fontSize: 60.0, fontWeight: FontWeight.w300, textBaseline: TextBaseline.alphabetic, letterSpacing: -0.5),
//    display2   : TextStyle(debugLabel: 'englishLike display2 2018', fontSize: 48.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.0),
//    display1   : TextStyle(debugLabel: 'englishLike display1 2018', fontSize: 34.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.25),
//    headline   : TextStyle(debugLabel: 'englishLike headline 2018', fontSize: 24.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.0),
//    title      : TextStyle(debugLabel: 'englishLike title 2018',    fontSize: 20.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.15),
//    subhead    : TextStyle(debugLabel: 'englishLike subhead 2018',  fontSize: 16.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.15),
//    body2      : TextStyle(debugLabel: 'englishLike body2 2018',    fontSize: 14.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.25),
//    body1      : TextStyle(debugLabel: 'englishLike body1 2018',    fontSize: 16.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.5),
//    button     : TextStyle(debugLabel: 'englishLike button 2018',   fontSize: 14.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.75),
//    caption    : TextStyle(debugLabel: 'englishLike caption 2018',  fontSize: 12.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.4),
//    subtitle   : TextStyle(debugLabel: 'englishLike subtitle 2018', fontSize: 14.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.1),
//    overline   : TextStyle(debugLabel: 'englishLike overline 2018', fontSize: 10.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 1.5),


      // Colours
//      colorScheme: ColorScheme.fromSwatch(
//        primarySwatch: Colors.red,
////        accentColor: Colors.yellowAccent
//        errorColor: Colors.purple,
//        backgroundColor: Colors.lightGreen
//      )

//      colorScheme: ColorScheme(primary: null, primaryVariant: null, secondary: null, secondaryVariant: null, surface: null, background: null, error: null, onPrimary: null, onSecondary: null, onSurface: null, onBackground: null, onError: null, brightness: null)
//    floatingActionButtonTheme: FloatingActionButtonThemeData(

//    )
    );
  }
}

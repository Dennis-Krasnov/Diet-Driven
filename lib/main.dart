import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/screens/home_screen.dart';
import 'package:diet_driven/screens/loading_indicator.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/blocs/blocs.dart';


void main() {
  // Configure logger
  // Available levels: [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((LogRecord rec) {
    print("${rec.loggerName} ~ ${rec.level.name} ~ ${DateFormat("jms").format(rec.time)} ~ ${rec.message}");
  });

  // Logs every BLoC state transition
  BlocSupervisor().delegate = SimpleBlocDelegate();

  runApp(App());

  // TODO: create repository to manage system preferences, orientation, overlays (eg. for maximizing screen)
  //  on per-page basis
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //  statusBarColor:
  //  systemNavigationBarColor:
  //  systemNavigationBarIconBrightness:
//  ));

  // Lock to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final ConfigurationBloc configurationBloc = ConfigurationBloc(userRepository: Repository().user);
  final UserDataBloc userDataBloc = UserDataBloc(userRepository: Repository().user);

  @override
  Widget build(BuildContext context) {
    // Inject blocs into context
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<ConfigurationBloc>(bloc: configurationBloc),
        BlocProvider<UserDataBloc>(bloc: userDataBloc),
      ],
      // Configuration builder
      child: BlocBuilder<ConfigurationEvent, ConfigurationState>(
        bloc: configurationBloc,
        builder: (BuildContext context, ConfigurationState configurationState) {
          // User data builder
          return BlocBuilder<UserDataEvent, UserDataState>(
            bloc: userDataBloc,
            builder: (BuildContext context, UserDataState userDataState) {
              return MaterialApp(
                home: appLoadingLogic(configurationState, userDataState),
                theme: generateThemeSettings(userDataState is UserDataLoaded
                  ? userDataState.settings.themeSettings
                  : ThemeSettings() // Default settings
                ),
                // TODO: Fluro navigation
              );
            }
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    configurationBloc.dispose();
    userDataBloc.dispose();
    super.dispose();
  }

  /// ...
  Widget appLoadingLogic(ConfigurationState configurationState, UserDataState userDataState) {
    // Initial splash screen
    if (configurationState is ConfigurationUninitialized ||
        configurationState is ConfigurationLoading ||
        userDataState is UserDataUninitialized) {
      return SplashPage();
    }
    assert(configurationState is ConfigurationLoaded);

    // Onboarding / sign in / sign up
    if (userDataState is UserDataUnauthenticated) {
      return LoginPage(userRepository: Repository().user);
    }

    // Loading critical user settings
    if (userDataState is UserDataLoading) {
      return LoadingIndicator();
    }

    // Loading user data failed
    if (userDataState is UserDataFailed) {
      return ErrorPage(error: userDataState.error);
    }

    // Start application when user is loaded
    if (userDataState is UserDataLoaded) {
      return HomePage();
    }

    return ErrorPage(error: "Invalid user data state: $userDataState}");
  }

  /// ...
  ThemeData generateThemeSettings(ThemeSettings themeSettings) {
    return themeSettings.light ? ThemeData.light() : ThemeData.dark();
  }
}

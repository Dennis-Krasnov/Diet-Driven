import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/screens/food_logging.dart';
import 'package:diet_driven/screens/food_record_search.dart';
import 'package:diet_driven/screens/home_screen.dart';
import 'package:diet_driven/screens/loading_indicator.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/manual_food_record_edit.dart';
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
  Logger.root.level = Level.FINE; // [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
  Logger.root.onRecord.listen((LogRecord rec) {
    print("${rec.loggerName} ~ ${rec.level.name} ~ ${DateFormat("jms").format(rec.time)} ~ ${rec.message}");
  });

  // Logs every BLoC state transition
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    // Inject blocs into context
    BlocProviderTree(
      blocProviders: [
        BlocProvider<ConfigurationBloc>(
          builder: (BuildContext context) => ConfigurationBloc(userRepository: Repository().user),
          dispose: (BuildContext context, ConfigurationBloc configurationBloc) => configurationBloc.dispose(),
        ),
        BlocProvider<UserDataBloc>(
          builder: (BuildContext context) => UserDataBloc(userRepository: Repository().user),
          dispose: (BuildContext context, UserDataBloc userDataBloc) => userDataBloc.dispose(),
        ),
      ],
      child: App(),
    )
  );

  // Lock to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configuration builder
    return BlocBuilder<ConfigurationEvent, ConfigurationState>(
      bloc: BlocProvider.of<ConfigurationBloc>(context),
      builder: (BuildContext context, ConfigurationState configurationState) {
        // User data builder
        return BlocBuilder<UserDataEvent, UserDataState>(
          bloc: BlocProvider.of<UserDataBloc>(context),
          builder: (BuildContext context, UserDataState userDataState) {
            return MaterialApp(
              // Overrides `/` navigator route
              home: appLoadingLogic(configurationState, userDataState),
              // Use default settings while user data is being loaded
              theme: generateThemeSettings(userDataState is UserDataLoaded
                ? userDataState.settings.themeSettings
                : ThemeSettings()
              ),
              onGenerateRoute: (settings) => generateRoute(context, settings),
              onUnknownRoute: (RouteSettings setting) => MaterialPageRoute<dynamic>(builder: (BuildContext context) => ErrorPage(error: "${setting.name} route not found")),
            );
          }
        );
      }
    );
  }

  ///
  Route generateRoute(BuildContext context, RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) { // FIXME: use global constants
      case "/manual_food_record_edit":
        assert(arguments is FoodRecord);

        // Returns edited food record
        return MaterialPageRoute<FoodRecord>(
          builder: (context) => ManualFoodRecordEdit(
            foodRecord: arguments,
            deletable: true, // TODO: diary should have two paths - live and manual, both deletable
          ),
          maintainState: true,
        );
        break;
      case "/food_logging":
      // TODO: if arguments != null => assert they're a valid meal
        assert(arguments is FoodDiaryLoaded);

        // Returns list of food records to add
        return MaterialPageRoute<BuiltList<FoodRecord>>(
          builder: (context) => FoodLogging(
            foodDiaryLoaded: arguments,
          ),
          maintainState: true,
        );
        break;
      case "/logging_food_record_edit": // TODO: reuse similar configuration for custom food creation, but with empty food record
        assert(arguments is FoodRecord);

        // Returns edited food record
        return MaterialPageRoute<FoodRecord>(
          builder: (context) => ManualFoodRecordEdit(
            foodRecord: arguments,
            deletable: false,
          ),
          maintainState: true,
        );
        break;
      case "/food_search":
        assert(arguments is FoodLoggingState);

        // Returns food record search result
        return MaterialPageRoute<FoodRecord>(
          builder: (context) => FoodRecordSearch(
            foodLoggingState: arguments,
          ),
          maintainState: true,
        );
        break;
    }
    return null;
  }

  /// ...
  Widget appLoadingLogic(ConfigurationState configurationState, UserDataState userDataState) {
    // Initial splash screen
    if (configurationState is ConfigurationUninitialized ||
        configurationState is ConfigurationLoading ||
        userDataState is UserDataUninitialized) {
      return SplashPage();
    }

    // Loading configuration failed
    if (configurationState is ConfigurationFailed) {
      return ErrorPage(
        error: configurationState.error,
        trace: configurationState.trace
      );
    }

    assert(configurationState is ConfigurationLoaded);

    // Loading user data failed
    if (userDataState is UserDataFailed) {
      return ErrorPage(
        error: userDataState.error,
        trace: userDataState.trace
      );
    }

    // Onboarding / sign in / sign up
    if (userDataState is UserDataUnauthenticated) {
      return LoginPage(userRepository: Repository().user);
    }

    // Loading critical user settings
    if (userDataState is UserDataLoading) {
      return LoadingIndicator();
    }

    // Start application when user is loaded
    if (userDataState is UserDataLoaded) {
      return HomePage();
    }

    return ErrorPage(error: "Invalid user data state: $userDataState}");
  }

  /// ...
  ThemeData generateThemeSettings(ThemeSettings themeSettings) {
    return themeSettings.darkMode ? ThemeData.dark() : ThemeData.light();
  }
}

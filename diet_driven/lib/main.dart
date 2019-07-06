import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/log_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
//import 'package:logger/logger.dart';


import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repository_singleton.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/screens/food_logging.dart';
import 'package:diet_driven/screens/food_record_search.dart';
import 'package:diet_driven/screens/home_screen.dart';
import 'package:diet_driven/screens/loading_indicator.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/manual_food_record_edit.dart';
import 'package:diet_driven/screens/splash_screen.dart';
import 'package:logger/logger.dart';

void main() {
//  Logger.level = Level.info;
  // todo: clear past logs!!

  // Configure logger
//  Logger.root.level = Level.FINE; // [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
//  Logger.root.onRecord.listen((LogRecord rec) {
//    print("${rec.loggerName} ~ ${rec.level.name} ~ ${DateFormat("jms").format(rec.time)} ~ ${rec.message}");
//  });

  // Logs every BLoC event and state transition
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    // Inject global blocs into context
    BlocProviderTree(
      blocProviders: [
        BlocProvider<ConfigurationBloc>(
          builder: (BuildContext context) => ConfigurationBloc(configurationRepository: Repository().config),
          dispose: (BuildContext context, ConfigurationBloc configurationBloc) => configurationBloc.dispose(),
        ),
        BlocProvider<UserDataBloc>(
          builder: (BuildContext context) => UserDataBloc(userRepository: Repository().user, settingsRepository: Repository().settings),
          dispose: (BuildContext context, UserDataBloc userDataBloc) => userDataBloc.dispose(),
        ),
        // Used to dispose singleton logging bloc
//        BlocProvider<LoggingBloc>(
//          builder: (BuildContext context) => LoggingBloc(),
//          dispose: (BuildContext context, LoggingBloc loggingBloc) => loggingBloc.dispose(),
//        ),
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
  final logger = getLogger("app widget");

  // TODO: separate stless widget
  /// Reactively builds app based on user and configuration state.
  Widget appLoadingLogic(ConfigurationState configurationState, UserDataState userDataState) {
    // Initial splash screen while loading critical configuration and user data
    if (configurationState is ConfigurationUninitialized || userDataState is UserDataUninitialized) {
      return SplashPage();
    }

    // Loading configuration failed
    if (configurationState is ConfigurationFailed) {
      return ErrorPage(
        error: configurationState.error,
        trace: configurationState.trace
      );
    }

    // Configuration loaded from now on
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

    // Start application when user is loaded
    if (userDataState is UserDataLoaded) {
      // OPTIMIZE: AnimatedCrossFade from splash to home page
      return HomePage();
    }

    return ErrorPage(error: "Invalid user data state: $userDataState}");
  }

  @override
  Widget build(BuildContext context) {
    logger.wtf("app started");
    LoggingBloc().verbose("app started");

    // Configuration builder
    return BlocBuilder<ConfigurationEvent, ConfigurationState>(
      bloc: BlocProvider.of<ConfigurationBloc>(context),
      condition: (previous, current) => true,
      builder: (BuildContext context, ConfigurationState configurationState) {
        logger.i("configuration rebuild");

        // User data builder
        return BlocBuilder<UserDataEvent, UserDataState>(
          bloc: BlocProvider.of<UserDataBloc>(context),
          condition: (previous, current) {
            // Unconditionally build if state changed to/from loaded
            if (previous is! UserDataLoaded || current is! UserDataLoaded)
              return true;

            // Build only if theme settings changed
            // Type-safe cast due to catch above
            return (previous as UserDataLoaded).settings.themeSettings != (current as UserDataLoaded).settings.themeSettings;
          },
          builder: (BuildContext context, UserDataState userDataState) {
            logger.i("user data rebuild");

            return MaterialApp(
              // Overrides `/` navigator route
              home: appLoadingLogic(configurationState, userDataState),
              // Use default theme while user data is being loaded
              theme: generateThemeSettings(userDataState is UserDataLoaded ? userDataState.settings.themeSettings : null),
              onGenerateRoute: (settings) => generateRoute(context, settings),
              onUnknownRoute: (RouteSettings setting) => MaterialPageRoute<dynamic>(builder: (BuildContext context) => ErrorPage(error: "${setting.name} route not found")),
            );
          }
        );
      }
    );
  }

  // TODO: global navigator bloc!
  /// Global navigator routes.
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

  /// Creates Flutter theme data from theme settings.
  ThemeData generateThemeSettings(ThemeSettings themeSettings) {
//    return ThemeData.raw(brightness: null,
//        primaryColor: null,
//        primaryColorBrightness: null,
//        primaryColorLight: null,
//        primaryColorDark: null,
//        canvasColor: null,
//        accentColor: null,
//        accentColorBrightness: null,
//        scaffoldBackgroundColor: null,
//        bottomAppBarColor: null,
//        cardColor: null,
//        dividerColor: null,
//        highlightColor: null,
//        splashColor: null,
//        splashFactory: null,
//        selectedRowColor: null,
//        unselectedWidgetColor: null,
//        disabledColor: null,
//        buttonTheme: null,
//        buttonColor: null,
//        secondaryHeaderColor: null,
//        textSelectionColor: null,
//        cursorColor: null,
//        textSelectionHandleColor: null,
//        backgroundColor: null,
//        dialogBackgroundColor: null,
//        indicatorColor: null,
//        hintColor: null,
//        errorColor: null,
//        toggleableActiveColor: null,
//        textTheme: null,
//        primaryTextTheme: null,
//        accentTextTheme: null,
//        inputDecorationTheme: null,
//        iconTheme: null,
//        primaryIconTheme: null,
//        accentIconTheme: null,
//        sliderTheme: null,
//        tabBarTheme: null,
//        cardTheme: null,
//        chipTheme: null,
//        platform: null,
//        materialTapTargetSize: null,
//        pageTransitionsTheme: null,
//        appBarTheme: null,
//        bottomAppBarTheme: null,
//        colorScheme: null,
//        dialogTheme: null,
//        floatingActionButtonTheme: null,
//        typography: null,
//        cupertinoOverrideTheme: null
//    );
//    if (themeSettings.darkMode) {
//      return ThemeData.dark().copyWith(
//
//      );
//    }
//
//    return ThemeData.light().copyWith(
//
//    );

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
      textTheme: TextTheme(
        // Heading
        headline: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.black.withOpacity(0.6),
        ),
        //  // FIXME: affects all built-in listtiles !! - MAKE THIS THE HEADER INSTEAD OF HEADER 2 and use everywhere, // TODO: find the style that naturally styles subtitle too!
//        subhead: TextStyle(
//          fontWeight: FontWeight.w600,
//          fontSize: 12,
//          color: Colors.black.withOpacity(0.2),
//        ),
        // List tile title
        body2: TextStyle(
//          fontWeight: FontWeight.w600,
          fontSize: 15,
//          color: Colors.black87
          color: Colors.black.withOpacity(0.8)
        ),
        // List tile subtitle
        body1: TextStyle(
          fontSize: 12,
          color: Colors.black54
//            color: Colors.black.withOpacity(60)
        )
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
      ),

      // Colours
      primaryColor: Colors.deepOrange,
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

//    return ThemeData(
//      // Dark mode
//      brightness: themeSettings.darkMode ? Brightness.dark : Brightness.light,
//
//      // Typography
//      fontFamily: 'SourceSansPro',
//      // Define the default TextTheme. Use this to specify the default
//      // text styling for headlines, titles, bodies of text, and more.
////      textTheme: TextTheme(
////        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
////        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
////        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
////      ),
////
////      primarySwatch: Colors.red,
//////      primaryColor: Colors.lightGreen[800],
//////      primaryColorBrightness: themeSettings.darkMode ? Brightness.dark : Brightness.light,
//////      primaryColorLight: Colors.lightGreen[800],
//////      primaryColorDark: Colors.lightGreen[400],
//////      secondaryHeaderColor: Colors.lightGreenAccent
//////      accentColor: Colors.purple[600],
////    );
//    // TODO: custom font
////    return themeSettings.darkMode ? ThemeData.dark() : ThemeData.light();
//  }
}

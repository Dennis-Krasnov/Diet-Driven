import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/screens/home_screen.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/splash_screen.dart';
import 'package:diet_driven/screens/loading_indicator.dart';


void main() {
  // Configure logger
  // [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((LogRecord rec) {
    print("${rec.loggerName} ~ ${rec.level.name} ~ ${DateFormat("jms").format(rec.time)} ~ ${rec.message}");
  });

  // ...
  BlocSupervisor().delegate = SimpleBlocDelegate();

  // Inject repository (DAO) dependencies
  runApp(App(
    userRepository: UserRepository(),
    diaryRepository: DiaryRepository(),
    foodRepository: FoodRepository(),
    settingsRepository: SettingsRepository(),
    analyticsRepository: AnalyticsRepository(),
  ));

  // TODO: create repository to manage system preferences, orientation, overlays (eg. for maximizing screen) on per-page basis
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//  statusBarColor:
//  systemNavigationBarColor:
//  systemNavigationBarIconBrightness:
  ));

  // Lock to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}

class App extends StatefulWidget {
  final UserRepository userRepository;
  final DiaryRepository diaryRepository;
  final FoodRepository foodRepository;
  final SettingsRepository settingsRepository;
  final AnalyticsRepository analyticsRepository;

  App({
    @required this.userRepository,
    @required this.diaryRepository,
    @required this.foodRepository,
    @required this.settingsRepository,
    @required this.analyticsRepository
  });

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  ConfigurationBloc configurationBloc;
  UserDataBloc userDataBloc;
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  void initState() {
    super.initState();

    userDataBloc = UserDataBloc(
      settingsRepository: widget.settingsRepository,
      userRepository: widget.userRepository,
    );

    configurationBloc = ConfigurationBloc(
      settingsRepository: widget.settingsRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    // ...
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<ThemeBloc>(bloc: themeBloc),
        BlocProvider<ConfigurationBloc>(bloc: configurationBloc),
        BlocProvider<UserDataBloc>(bloc: userDataBloc),
      ],
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (_, ThemeData theme) {
          return MaterialApp(
            title: "Diet Driven",
            home: AppBlocBuilders(builder: (context, configurationState, userDataState) {
              // Initial splash screen
              if (configurationState is ConfigurationUninitialized ||
                  configurationState is ConfigurationLoading ||
                  userDataState is UserDataUninitialized) {
                return SplashPage();
              }
              assert(configurationState is ConfigurationLoaded);

              // Onboarding / sign in / sign up
              if (userDataState is UserDataUnauthenticated) {
                return LoginPage(userRepository: widget.userRepository);
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
                return HomePage(
                  diaryRepository: widget.diaryRepository,
                  foodRepository: widget.foodRepository,
                  settingsRepository: widget.settingsRepository,
                  analyticsRepository: widget.analyticsRepository,
                );
              }

              return ErrorPage(error: "Invalid user data state: $userDataState}");
            }),
            theme: theme,
            initialRoute: "/", // TODO: replace with fluro
          );
        }
      )
    );
  }

  @override
  void dispose() {
    configurationBloc.dispose();
    themeBloc.dispose();
    super.dispose();
  }
}

/// Higher order builder to hide bloc builder boilerplate
class AppBlocBuilders extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    ConfigurationState configurationState,
    UserDataState userDataState,
  ) builder;

  AppBlocBuilders({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    // Configuration
    return BlocBuilder<ConfigurationEvent, ConfigurationState>(
      bloc: _configurationBloc,
      builder: (BuildContext context, ConfigurationState configurationState) {
        // User data
        return BlocBuilder<UserDataEvent, UserDataState>(
          bloc: _userDataBloc,
          builder: (BuildContext context, UserDataState userDataState) {
            return builder(context, configurationState, userDataState);
          }
        );
      }
    );
  }
}

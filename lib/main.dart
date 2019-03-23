import 'dart:async';

import 'package:diet_driven/screens/penguin_animation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/home_screen.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/splash_screen.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/blocs/blocs.dart';


void main() {
  // Configure logger
  // const [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
  Logger.root.level = Level.FINE; //Level.INFO
  var format = new DateFormat("jms");
  Logger.root.onRecord.listen((LogRecord rec) {
    print("${rec.loggerName} ~ ${rec.level.name} ~ ${format.format(rec.time)} ~ ${rec.message}");
  });

  BlocSupervisor().delegate = SimpleBlocDelegate();

  //
  runApp(App(
    userRepository: AuthenticationRepository(),
    foodRepository: FoodRepository(),
    settingsRepository: SettingsRepository(),
  ));

  // TODO: create bloc to manage system preferences, orientation, overlays (eg. for maximizing screen) on per-page basis
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    statusBarColor:
//  systemNavigationBarColor:
//    systemNavigationBarIconBrightness:
  ));

  //
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}

class App extends StatefulWidget {
  final AuthenticationRepository userRepository;
  final FoodRepository foodRepository;
  final SettingsRepository settingsRepository;

  App({@required this.userRepository, @required this.foodRepository, @required this.settingsRepository});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationRepository get userRepository => widget.userRepository;
  FoodRepository get foodRepository => widget.foodRepository;
  SettingsRepository get settingsRepository => widget.settingsRepository;


  AuthenticationBloc authenticationBloc;
  SettingsBloc settingsBloc;
  UserDataBloc userDataBloc;
  ConfigurationBloc configurationBloc;
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  void initState() {
    super.initState();

    authenticationBloc = AuthenticationBloc(authRepository: userRepository);

    settingsBloc = SettingsBloc(
      settingsRepository: settingsRepository,
      authenticationBloc: authenticationBloc
    );

    userDataBloc = UserDataBloc(
      settingsRepository: settingsRepository,
      authenticationBloc: authenticationBloc
    );

    configurationBloc = ConfigurationBloc(
      settingsRepository: settingsRepository,
      userDataBloc: userDataBloc
    );

    // Initialize blocs
    configurationBloc.dispatch(FetchConfiguration());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthenticationBloc>(bloc: authenticationBloc),
        BlocProvider<SettingsBloc>(bloc: settingsBloc),
        BlocProvider<UserDataBloc>(bloc: userDataBloc),
        BlocProvider<ConfigurationBloc>(bloc: configurationBloc),
        BlocProvider<ThemeBloc>(bloc: themeBloc),
      ],
      // Theme
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (_, ThemeData theme) {
          return MaterialApp(
            title: "Diet Driven",
            home: AppBlocBuilders(builder: (context, configurationState, authenticationState, settingsState, userDataState) {
              // Loading
              if (configurationState is ConfigurationUninitialized ||
                  configurationState is ConfigurationLoading ||
                  authenticationState is AuthUninitialized) {
                return SplashPage();
              }

              // First time user
              if (authenticationState is AuthUnauthenticated) {
                return LoginPage(userRepository: userRepository);
              }

              // Authenticated from this point on
              if (authenticationState is AuthAuthenticated) {

                // Load critical user settings
                if (settingsState is SettingsUninitialized || userDataState is UserDataUninitialized) {
                  return LoadingIndicator();
                }

                // Show application
                return HomePage(foodRepository: foodRepository, settingsRepository: settingsRepository,);
              }
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
    authenticationBloc.dispose();
    settingsBloc.dispose();
    configurationBloc.dispose();
    themeBloc.dispose();
    super.dispose();
  }
}

// TODO: make animation loader
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SizedBox(child: PenguinAnimation(), height: 200, width: 200,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "loading...",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
        fit: StackFit.expand,
      )
    );
  }
}

class AppBlocBuilders extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    ConfigurationState configurationState,
    AuthenticationState authenticationState,
    SettingsState settingsState,
    UserDataState userDataState,
  ) builder;

  AppBlocBuilders({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);
    final AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final SettingsBloc _settingsBloc = BlocProvider.of<SettingsBloc>(context);
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    // Configuration
    return BlocBuilder<ConfigurationEvent, ConfigurationState>(
      bloc: _configurationBloc,
      builder: (BuildContext context, ConfigurationState configurationState) {
        // Authentication
        return BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState authenticationState) {
            // Settings
            return BlocBuilder<SettingsEvent, SettingsState>(
              bloc: _settingsBloc,
              builder: (BuildContext context, SettingsState settingsState) {
                // User data
                return BlocBuilder<UserDataEvent, UserDataState>(
                  bloc: _userDataBloc,
                  builder: (BuildContext context, UserDataState userDataState) {
                    return builder(context, configurationState, authenticationState, settingsState, userDataState);
                  }
                );
              }
            );
          }
        );
      }
    );
  }
}

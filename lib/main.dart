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
  Logger.root.level = Level.INFO; //Level.FINE
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
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  void initState() {
    super.initState();
    authenticationBloc = AuthenticationBloc(authRepository: userRepository);
    authenticationBloc.dispatch(AppStarted());
    // TODO: settingsBloc.dispatch(manually fetch remote config!)
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthenticationBloc>(bloc: authenticationBloc),
        BlocProvider<ThemeBloc>(bloc: themeBloc),
      ],
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (_, ThemeData theme) {
          return MaterialApp(
            title: "Diet Driven",
            home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthUninitialized) {
                  return SplashPage();
                }
                if (state is AuthAuthenticated) {
                  return HomePage(foodRepository: foodRepository, settingsRepository: settingsRepository,);
                }
                if (state is AuthUnauthenticated) {
                  return LoginPage(userRepository: userRepository);
                }
                if (state is AuthLoading) {
                  return LoadingIndicator();
                }
              },
            ),
            theme: theme,
            initialRoute: "/", // TODO: replace with fluro?
//            routes: ,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
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
//          FractionalTranslation(
//            translation: Offset(0.0, 0.5),
//            child: Text(
//              "Loading...",
//            )
//  //          child: new Container(
//  //            alignment: new FractionalOffset(0.0, 0.0),
//  //            decoration: new BoxDecoration(
//  //              border: new Border.all(
//  //                color: Colors.blue.withOpacity(0.5),
//  //                width: 50.0,
//  //              ),
//  //              shape: BoxShape.circle,
//  //            ),
//  //          )
//          )
        ],
        fit: StackFit.expand,
      )
    );
  }
}

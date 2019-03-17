import 'dart:async';

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
  runApp(App(
    userRepository: AuthenticationRepository(),
    foodRepository: FoodRepository(),
  ));
}

class App extends StatefulWidget {
  final AuthenticationRepository userRepository;
  final FoodRepository foodRepository;

  App({@required this.userRepository, @required this.foodRepository});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationRepository get userRepository => widget.userRepository;
  FoodRepository get foodRepository => widget.foodRepository;


  AuthenticationBloc authenticationBloc;
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  void initState() {
    super.initState();
    authenticationBloc = AuthenticationBloc(authRepository: userRepository);
    authenticationBloc.dispatch(AppStarted());
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
                  return HomePage(foodRepository: foodRepository);
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
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(),
  );
}
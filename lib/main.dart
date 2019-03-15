import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/blocs/blocs.dart';


void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final FoodDiaryBloc _foodDiaryBloc = FoodDiaryBloc();
  final ThemeBloc _themeBloc = ThemeBloc();
  final AuthenticationBloc _authenticationBloc = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<FoodDiaryBloc>(bloc: _foodDiaryBloc), // TODO: move this lower in hierarchy
        BlocProvider<ThemeBloc>(bloc: _themeBloc),
        BlocProvider<AuthenticationBloc>(bloc: _authenticationBloc),
      ],
      child: BlocBuilder(
        bloc: _themeBloc,
        builder: (_, ThemeData theme) {
          return MaterialApp(
            title: "Diet Driven",
            home: DiaryPage(), // TODO: replace with routes! (use fluro?)
            theme: theme,
            initialRoute: "/",
//            routes: ,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _foodDiaryBloc.dispose();
    _themeBloc.dispose();
    _authenticationBloc.dispose();
    super.dispose();
  }
}
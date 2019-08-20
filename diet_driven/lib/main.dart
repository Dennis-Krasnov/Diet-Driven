/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Configure global logger
  // TODO: set LoggingBloc() logging level

  // Logs every bloc event and state transition
  BlocSupervisor.delegate = LoggingBlocDelegate();

  // Locks to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run Flutter app
  runApp(
    // Inject global repositories into application
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AnalyticsRepository>(builder: (context) => AnalyticsRepository()),
        RepositoryProvider<ConfigurationRepository>(builder: (context) => ConfigurationRepository()),
        RepositoryProvider<DiaryRepository>(builder: (context) => DiaryRepository()),
        RepositoryProvider<FoodRepository>(builder: (context) => FoodRepository()),
        RepositoryProvider<SettingsRepository>(builder: (context) => SettingsRepository()),
        RepositoryProvider<UserRepository>(builder: (context) => UserRepository()),
      ],
      // Inject global blocs into application
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConfigurationBloc>(builder: (context) =>
            ConfigurationBloc(
              configurationRepository: RepositoryProvider.of<ConfigurationRepository>(context),
            )..dispatch(InitConfiguration())
          ),
          BlocProvider<UserDataBloc>(builder: (context) =>
            UserDataBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
              settingsRepository: RepositoryProvider.of<SettingsRepository>(context),
            )..dispatch(InitUserData())
          ),
        ],
        child: App(),
      )
    )
  );
}

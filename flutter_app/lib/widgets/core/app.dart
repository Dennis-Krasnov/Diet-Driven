/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/navigation/navigation.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/widgets/core/core.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';
import 'package:diet_driven/widgets/loading/loading.dart';
import 'package:diet_driven/widgets/user/user.dart';
import 'package:diet_driven/widgets/onboarding/onboarding.dart';

import 'bottom_navigation.dart';

/// Globally rebuilds app based on configuration and theme settings.
/// Configures global theme and navigation routes.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocLogger().fine("");
    BlocLogger().fine("======================");
    BlocLogger().fine("App started");

    return BlocBuilder<UserDataBloc, UserDataState>(
      condition: (previous, current) {
        // Unconditional rebuild
        if (previous is! UserDataLoaded || current is! UserDataLoaded)
          return true;

        // Rebuild only if theme settings changed
        return (previous as UserDataLoaded).settings.themeSettings != (current as UserDataLoaded).settings.themeSettings;
      },
      builder: (BuildContext context, UserDataState userDataState) {
        BlocLogger().ui("Theme rebuild");

        return DeepLinkMaterialApp(
          // Representation of deep link navigation hierarchy
          navigation: (context) => Dispatcher()
            // Route not found
            ..exception<RouteNotFound>((exception, path) => [RouteNotFoundDL(exception)])
            ..value<RouteNotFound, RouteNotFoundDL>((exception, path) => Scaffold(body: Container(color: Colors.yellow)))
            // ...
            // TODO: chunk these into static extension methods!
            ..path<LandingDL>(
              (path) => LandingPage(),
              subNavigation: (context) => Dispatcher()
                // Onboarding
                ..value<String, OnboardingGoalDL>(
                  (goal, path) => OnboardingGoalPage(goal: goal),
                  subNavigation: (context, goal) => Dispatcher()
                    ..value<bool, OnboardingSexDL>(
                      (isMale, path) => OnboardingSexPage(goal: goal, isMale: isMale),
                      subNavigation: (context, isMale) => Dispatcher()
                        ..value<double, OnboardingWeightDL>((kilos, path) => OnboardingWeightPage(goal: goal, isMale: isMale, kilos: kilos)),
                    ),
                )
                // Login
                ..path<LoginDL>(
                  (path) => Scaffold(),
                  subNavigation: (context) => Dispatcher()
                    ..path<ForgotPasswordDL>((path) => Scaffold()), // TODO: optional? email value
                ),
            )
            // FIXME: initialized every time!!! - figure out a way to access user data's user id from higher up!, yet maintain widget lifecycle
            ..value<int, DiaryDateDL>((date, path) => BlocProvider<FoodDiaryBloc>(
              builder: (BuildContext context) => FoodDiaryBloc(
                diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
                userId: BlocProvider.of<UserDataBloc>(context).userId,
              )..dispatch(InitFoodDiary()),
              child: FoodDiaryPage(initialDate: date),
            ))
            ..path<MeasureDL>((path) => Scaffold(body: Container(color: Colors.orange)))
            ..path<ReportsDL>((path) => Scaffold(body: Container(color: Colors.blue)))
            ..value<String, UserDL>((tab, path) => UserPage(tab: tab)),
          // Stay on splash screen until both [ConfigurationBloc] and [UserDataBloc] are loaded
          splashScreen: const SplashPage(),
          childBuilder: (BuildContext context, DeepLinkNavigator deepLinkNavigator, Widget child) => Scaffold(
            // Navigates to respective page on authentication status change
            // Only executes callbacks once configuration bloc is loaded
            body: AuthenticationChangeNotifier(
              configurationBloc: BlocProvider.of<ConfigurationBloc>(context),
              userDataBloc: BlocProvider.of<UserDataBloc>(context),
              // Navigate to user's default page
              onAuthenticated: (userDataLoaded) => deepLinkNavigator.navigateTo([DiaryDateDL.today()]), // TODO: take from user data loaded!
              // Navigate to onboarding
              onUnauthenticated: () => deepLinkNavigator.navigateTo([LandingDL()]),
              onException: print, // TODO (e) => ... navigateTo...
              child: child,
            ),
            // Don't show bottom navigation while [currentRoute] is null
            // Also don't show if any deep list is [FullScreen]
            bottomNavigationBar: deepLinkNavigator.currentRoute?.any((dl) => dl is FullScreen) ?? true ? null : BottomNavigation(
              deepLinkNavigator: deepLinkNavigator,
              bottomNavigationPages: BuiltList(<DeepLink>[DiaryDateDL.today(), UserDL("xyzTab")]) // TODO: from settings
            ),
          ),
          theme: generateThemeSettings(userDataState is UserDataLoaded ? userDataState.settings.themeSettings : null),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
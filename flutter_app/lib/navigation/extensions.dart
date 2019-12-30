/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/widgets/search/search.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/navigation/navigation.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';
import 'package:diet_driven/widgets/onboarding/onboarding.dart';
import 'package:diet_driven/widgets/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension RouteExtensions on List<DeepLink> {
  // TODO: remove path from base library
  /// ...
  String get path => join("/");

  // inline is more readable:
//  bool get isFullScreen => any((dl) => dl is FullScreen);
}

extension DeepLinkNavigationExtensions on Dispatcher {
  /// ...
  void landingNavigation() {
    path<LandingDL>(
      (path) => LandingPage(),
      subNavigation: Dispatcher()
        ..value<String, OnboardingGoalDL>(
          (goal, path) => OnboardingGoalPage(goal: goal),
          subNavigation: (goal) => Dispatcher()
            ..value<bool, OnboardingSexDL>(
              (isMale, path) => OnboardingSexPage(goal: goal, isMale: isMale),
              subNavigation: (isMale) => Dispatcher()
                ..value<double, OnboardingWeightDL>((kilos, path) => OnboardingWeightPage(goal: goal, isMale: isMale, kilos: kilos)),
            ),
        )
        ..path<LoginDL>(
          (path) => const Scaffold(),
          subNavigation: Dispatcher()
            ..path<ForgotPasswordDL>((path) => const Scaffold()), // TODO: optional? email value
        )
    );
  }

  /// ...
  void exceptionHandling() {
    exception<RouteNotFound>((exception, path) => [RouteNotFoundDL(exception)]);
    value<RouteNotFound, RouteNotFoundDL>((exception, path) => Scaffold(body: Container(color: Colors.yellow)));

    exception<SubscriptionRequired>((exception, path) => [RouteNotFoundDL(exception)]);
    // TODO subscriber only marketing page
  }

  /// ...
  void diaryNavigation() {
    value<int, DiaryDateDL>(
      (date, path) => FoodDiaryPage(initialDate: date),
      subNavigation: (date) => Dispatcher()
        ..value<String, SearchDL>((initialQuery, path) => BlocProvider<FoodSearchBloc>(create: (context) =>
          FoodSearchBloc(
            foodRepository: RepositoryProvider.of<FoodRepository>(context),
            userId: BlocProvider.of<UserDataBloc>(context).userId,
            initialQuery: initialQuery
          )..add(SuggestFoodRecords()),
          child: SearchPage(),
        )),
    );
  }

  /// ...
  void measureNavigation() {
    path<MeasureDL>((path) => Scaffold(body: Container(color: Colors.orange)));
  }

  /// ...
  void reportsNavigation() {
    path<ReportsDL>((path) => Scaffold(body: Container(color: Colors.blue)));
  }

  /// ...
  void userNavigation() {
    value<String, UserDL>((tab, path) => UserPage(tab: tab));
  }
}
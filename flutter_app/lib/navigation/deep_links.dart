/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/navigation/deep_link_mixins.dart';

// errors

class RouteNotFoundDL extends ValueDeepLink<RouteNotFound> with FullScreen {
  RouteNotFoundDL(RouteNotFound e) : super("route-not-found", e, toString: (e) => e.route.join("/"));
}

// onboarding and login

class LandingDL extends DeepLink with FullScreen {
  LandingDL() : super("landing");
}

class LoginDL extends DeepLink {
  LoginDL() : super("login");
}

class ForgotPasswordDL extends DeepLink {
  ForgotPasswordDL() : super("forgot-password");
}

// TODO: optional goal enum
class OnboardingGoalDL extends ValueDeepLink<String> {
  OnboardingGoalDL([String goal]) : super("goal", goal);
}

// TODO: optional sex enum
class OnboardingSexDL extends ValueDeepLink<bool> {
  OnboardingSexDL([bool isMale]) : super("sex", isMale);
}

class OnboardingWeightDL extends ValueDeepLink<double> {
  OnboardingWeightDL([double kilos]) : super("weight", kilos);
}

///   ########  ####    ###    ########  ##    ##
///   ##     ##  ##    ## ##   ##     ##  ##  ##
///   ##     ##  ##   ##   ##  ##     ##   ####
///   ##     ##  ##  ##     ## ########     ##
///   ##     ##  ##  ######### ##   ##      ##
///   ##     ##  ##  ##     ## ##    ##     ##
///   ########  #### ##     ## ##     ##    ##

class DiaryDateDL extends ValueDeepLink<int> {
  DiaryDateDL(int date) : super("diary", date);

  DiaryDateDL.today() : super("diary", DateTime.now().asInt);
}

class SearchDL extends ValueDeepLink<String> with FullScreen {
  SearchDL(String initialQuery) : super("search", initialQuery);
}

// TODO: custom built serializer for deep links!!!! - giant map both ways / use json serializer!?
// TODO: other large comments

class MeasureDL extends DeepLink {
  MeasureDL() : super("measure");
}

class ReportsDL extends DeepLink {
  ReportsDL() : super("reports");
}

// individual reports are: with SubscriberOnly

// TODO: enum
class UserDL extends ValueDeepLink<String> {
  UserDL(String page) : super("user", page);
}
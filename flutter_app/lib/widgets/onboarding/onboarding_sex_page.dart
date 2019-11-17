/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/navigation/navigation.dart';

class OnboardingSexPage extends StatelessWidget {
  final String goal;
  final bool isMale;

  const OnboardingSexPage({Key key, this.goal, this.isMale}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TODO: separate widget
          const Text("What's your sex?"),
          Text("Currently $isMale"),
          const SizedBox(height: 25),
          for (final isMale in [true, false])
          // TODO: separate widget
            RaisedButton(
              child: Text(isMale ? "Male" : "Female"),
              onPressed: () => DeepLinkNavigator.of(context).navigateTo([
                LandingDL(),
                OnboardingGoalDL(goal),
                OnboardingSexDL(isMale),
                OnboardingWeightDL(),
              ]),
            ),
        ],
      ),
    ),
  );
}

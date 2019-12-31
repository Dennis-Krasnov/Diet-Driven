/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/navigation/navigation.dart';

class OnboardingGoalPage extends StatelessWidget {
  final String goal;

  const OnboardingGoalPage({Key key, this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TODO: separate widget
          const Text("What's your goal?"),
          Text("Currently $goal"),
          const SizedBox(height: 25),
          for (final str in ["Muscle gain", "Maintenance", "Fat loss"])
            // TODO: separate widget
            RaisedButton(
              child: Text(str),
//              onPressed: () => DeepLinkNavigator.of(context).push(OnboardingSexDL()),
              onPressed: () => DeepLinkNavigator.of(context).navigateTo([
                LandingDL(),
                OnboardingGoalDL(str),
                OnboardingSexDL(),
              ]),
            ),
        ],
      ),
    ),
  );
}

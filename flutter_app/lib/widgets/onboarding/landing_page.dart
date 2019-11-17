/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/navigation/navigation.dart';
import 'package:diet_driven/repositories/repositories.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: const Text("Start in under 15 seconds"),
            onPressed: () => DeepLinkNavigator.of(context).push(OnboardingGoalDL()),
          ),
          MaterialButton(
            child: const Text("login"),
            onPressed: () => RepositoryProvider.of<UserRepository>(context).signInWithEmail(
              email: "dennis.krasnov@gmail.com",
              password: "123456",
            ),
          ),
        ],
      )
    );
  }
}

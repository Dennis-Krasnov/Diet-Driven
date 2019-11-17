/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/repositories/repositories.dart';

class OnboardingWeightPage extends StatelessWidget {
  final String goal;
  final bool isMale;
  final double kilos;

  const OnboardingWeightPage({Key key, this.goal, this.isMale, this.kilos}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TODO: separate widget
          const Text("What's your weight?"),
          Text("Currently $kilos"),
          const SizedBox(height: 25),
          Text("Goal: $goal"),
          Text("Is male: $isMale"),
          Text("kilos: $kilos"),
          // TODO: separate widget
          const SizedBox(height: 25),
          RaisedButton(
            child: const Text("Wait that's it?"),
            onPressed: () => RepositoryProvider.of<UserRepository>(context).signInAnonymously(),
          ),
        ],
      ),
    ),
  );
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  final String page;
  const UnderConstruction({Key key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$page is under development",
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.network(
                "https://cdn.pixabay.com/photo/2016/04/01/11/06/panda-1300187_960_720.png",
                fit: BoxFit.contain,
                width: 200,
                height: 200,
              )
            ],
          ),
        )
      ),
    );
  }
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class ErrorPage extends StatelessWidget {
  final String error; // TODO: take Object and StackTrace! - another widget for builtError!
  final String trace;
  // TODO: also take arbitary state!

  const ErrorPage({Key key, this.error, this.trace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    String name = _userDataBloc.currentState is UserDataLoaded
        ? (_userDataBloc.currentState as UserDataLoaded).authentication?.displayName
        : "mr. anonymous";

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Sorry, $name'),
              const SizedBox(height: 50,),
              const Divider(height: 10,),
              Text('Error: $error'),
              const SizedBox(height: 50,),
              Text('$trace'),
              const SizedBox(height: 50,),
              const Divider(height: 10,),
//              ...App.temporaryLogSink.map((s) => Padding(child: Text(s), padding: EdgeInsets.symmetric(vertical: 20),)) // FIXME
            ],
          )
        )
      ),
    );
  }
}

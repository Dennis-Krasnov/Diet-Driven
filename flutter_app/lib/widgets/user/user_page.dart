/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:diet_driven/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/repositories/repositories.dart';

/// ...
class UserPage extends StatelessWidget {
  /// ...
  final String tab;

  const UserPage({Key key, this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: RaisedButton(
          child: Text("Logout ${(BlocProvider.of<UserDataBloc>(context).state as UserDataLoaded).authentication?.email ?? "anonymous"}"),
          onPressed: () => RepositoryProvider.of<UserRepository>(context).signOut(),
        ),
      ),
    );
  }
}
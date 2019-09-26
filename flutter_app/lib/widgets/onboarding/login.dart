/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:diet_driven/widgets/onboarding/login_form.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
//  final UserRepository userRepository;
//
//  LoginPage({Key key, @required this.userRepository}): assert(userRepository != null), super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
//  AuthenticationBloc _authenticationBloc;

//  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
//    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    _loginBloc = LoginBloc(
      authenticationRepository: RepositoryProvider.of<UserRepository>(context),
//      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(
//        authenticationBloc: _authenticationBloc,
        loginBloc: _loginBloc,
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:diet_driven/blocs/blocs.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
//  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
//    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool autoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  LoginBloc get _loginBloc => widget.loginBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Form(
          key: _formKey,
          autovalidate: autoValidate,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email',
//                  errorText:
                ),
                validator: (value) {
                  if (!isValidEmail(value)) {
                    return 'Enter Valid Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              FlatButton(
                child: Text("Enter Dennis' cridentials", key: Key("cridentials_button"),),
                onPressed: () {
                  _emailController.text = "dennis.krasnov@gmail.com";
                  _passwordController.text = "123456";
                },
              ),
              RaisedButton(
                onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
                child: Text('Login'),
              ),
              Container(
                child: state is LoginLoading ? CircularProgressIndicator() : null,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onLoginButtonPressed() {
    if(_formKey.currentState.validate()) {
      _loginBloc.dispatch(PressLoginButton((b) => b
        ..username = _emailController.text
        ..password = _passwordController.text
      ));
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  bool isValidEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    String name = _authenticationBloc.currentState is AuthAuthenticated
        ? (_authenticationBloc.currentState as AuthAuthenticated).user.uid
        : "mr. nobody";

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Sorry, $name'),
            Text('$error'),
            Text('Try again later or contact customer support'),
          ],
        )
      ),
    );
  }
}

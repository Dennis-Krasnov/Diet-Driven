import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Splash Screen'),
            Text('Authentication: ${_authenticationBloc.currentState}'),
            Text('Configuration: ${_configurationBloc.currentState}'),
          ],
        )
      ),
    );
  }
}

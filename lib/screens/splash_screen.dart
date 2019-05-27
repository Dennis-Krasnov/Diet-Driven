import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);

    return Scaffold(
      body: SafeArea( // TODO:
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Splash Screen'),
              Text('User data: ${_userDataBloc.currentState}'),
              Text('Configuration: ${_configurationBloc.currentState}'),
            ],
          )
        ),
      ),
    );
  }
}

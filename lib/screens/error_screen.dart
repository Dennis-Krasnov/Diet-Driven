import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

import '../main.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  final String trace;

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
              SizedBox(height: 50,),
              Divider(height: 10,),
              Text('Error: $error'),
              SizedBox(height: 50,),
              Text('$trace'),
              SizedBox(height: 50,),
              Divider(height: 10,),
              ...App.temporaryLogSink.map((s) => Padding(child: Text(s), padding: EdgeInsets.symmetric(vertical: 20),))
            ],
          )
        )
      ),
    );
  }
}

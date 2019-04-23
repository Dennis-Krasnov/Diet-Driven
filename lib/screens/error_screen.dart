import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    String name = _userDataBloc.currentState is UserDataLoaded
        ? (_userDataBloc.currentState as UserDataLoaded).authentication?.displayName
          ?? (_userDataBloc.currentState as UserDataLoaded).authentication.uid
        : "mr. anonymous";

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Sorry, $name'),
            SizedBox(height: 50,),
            Text('$error'),
            SizedBox(height: 50,),
            Text('Try again later or contact customer support'),
          ],
        )
      ),
    );
  }
}

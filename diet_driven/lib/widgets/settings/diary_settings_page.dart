import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DiarySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      builder: (BuildContext context, UserDataState userDataState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Diary Settings"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.swap_horiz),
                onPressed: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToDiary()),
              )
            ],
          ),
          body: SafeArea(
            child: Container(),
          )
        );
      }
    );
  }
}

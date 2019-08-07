import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GeneralSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (BuildContext context, UserDataState userDataState) {
        return Scaffold(
          appBar: AppBar(title: const Text("General Settings")),
          body: SafeArea()
        );
      }
    );
  }
}

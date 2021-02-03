import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnrecoverableFailureScreen extends StatelessWidget {
  const UnrecoverableFailureScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rebuild only when the selected part of navigation state changes
    final error = context.select((NavigationCubit cubit) => cubit.state.deepLinkHistory.last?.landingDeepLink?.submittedEmail);

    buildLog.v("UnrecoverableFailureScreen - rebuild: error=$error");

    // Handle race condition between the navigator removing this page and the navigation state updating
    if (error == null) {
      return Container();
    }

    return Scaffold(appBar: AppBar(title: Text(error)));
    // TODO: restart app
     // https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
  }
}

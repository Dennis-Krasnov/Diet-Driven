import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/widget/home/home_page.dart';
import 'package:dietdriven/widget/landing/landing_page.dart';
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Starting point of visual application.
/// Handles extraneous navigation states.
class DietDrivenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Diet Driven",
      home: BlocBuilder<NavigationCubit, NavigationState>(
        // TODO
        // buildWhen: (previousState, state) {
        //   return true;
        // },
        builder: (context, state) {
          return Navigator(
            pages: [
              if (state is Unauthorized)
                LandingPage(),
              if (state is UnrecoverableFailure)
                UnrecoverableFailurePage(), // TODO: pass error
              if (state is Authorized)
                // TODO: handle deep links??
                HomePage(), // TODO: pass deep link (when it changes)
            ],
            onPopPage: (route, result) => route.didPop(result), // FIXME
          );
        }
      ),
    );
  }
}
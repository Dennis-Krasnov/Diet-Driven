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
        buildWhen: (previousState, state) {
          // Rebuild only on major navigation state changes
          return previousState.runtimeType != state.runtimeType;
        },
        builder: (context, state) {
          print("state is $state");
          return Navigator(
            pages: [
              if (state is Unauthorized)
                LandingPage(),
              if (state is UnrecoverableFailure)
                UnrecoverableFailurePage(error: state.error, stackTrace: state.stackTrace),
              if (state is Authorized)
                HomePage(),
            ],
            onPopPage: (route, result) {
              print("global on page pop, ${route.didPop(result)}, $route, $result");
              return route.didPop(result); // FIXME, document
            }
          // onPopPage: (route, result) => false,
          );
        },
      ),
    );
  }
}
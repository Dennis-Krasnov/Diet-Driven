import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Starting point of visual application.
/// Handles extraneous navigation states. TODO: move this description to delegate
class DietDrivenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildLog.v("DietDrivenApp - rebuild");

    final navigationCubit = Provider.of<NavigationCubit>(context, listen: false);

    return MaterialApp.router(
      routeInformationProvider: navigationCubit.platformRouteInformationProvider,
      routeInformationParser: DietDrivenRouteInformationParser(),
      routerDelegate: DietDrivenRouterDelegate(navigationCubit: navigationCubit),
      backButtonDispatcher: DietDrivenBackButtonDispatcher(navigationCubit: navigationCubit),
    );
  }
}
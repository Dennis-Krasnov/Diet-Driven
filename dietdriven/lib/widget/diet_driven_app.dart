import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Starting point of visual application.
/// Handles extraneous navigation states.
class DietDrivenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationCubit = Provider.of<NavigationCubit>(context, listen: false);
    return MaterialApp.router(
      routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: RouteInformation(location: "/")
      ),
      routeInformationParser: DietDrivenRouteInformationParser(),
      routerDelegate: DietDrivenRouterDelegate(navigationCubit: navigationCubit),
      backButtonDispatcher: DietDrivenBackButtonDispatcher(navigationCubit: navigationCubit),
    );
  }
}
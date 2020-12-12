import 'package:dietdriven/bloc/navigation/navigation_cubit.dart';
import 'package:dietdriven/bloc/navigation/navigation_state.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Manages bottom nav, deep links
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationCubit = Provider.of<NavigationCubit>(context, listen: false);
    print("before router");
    return Router(
      // routerDelegate: DietDrivenRouterDelegate(navigationCubit: context.watch<NavigationCubit>()),
      routerDelegate: DietDrivenRouterDelegate(navigationCubit: navigationCubit),
      // routeInformationProvider: DietDrivenRouteInformationProvider(),
      routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: RouteInformation(location: "/"))..routerReportsNewRouteInformation(RouteInformation(location: "/deep-link/2")),
      routeInformationParser: DietDrivenRouteInformationParser(),
      backButtonDispatcher: DietDrivenBackButtonDispatcher(navigationCubit: navigationCubit),
    );
  }
}


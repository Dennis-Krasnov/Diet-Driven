import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/diet_driven_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Responds to push route and pop route intent from the engine.
/// Indirectly notifies [DietDrivenNavigation] and other sub-widgets to rebuild.
class DietDrivenRouterDelegate extends RouterDelegate<DeepLink> with ChangeNotifier {
  final NavigationCubit navigationCubit;

  DietDrivenRouterDelegate({this.navigationCubit});

  static final Logger _log = Logger(printer: PrettyPrinter(printTime: true));

  /// Called by the [Router] at startup with the structure that the [RouteInformationParser] obtained from parsing the initial route.
  /// By default, this method forwards the [configuration] to [setNewRoutePath].
  // @override
  // Future<void> setInitialRoutePath(DeepLink configuration) async {
  //   print("DietDrivenRouterDelegate - setInitialRoutePath - $configuration");
  //   navigationCubit.replace(configuration);
  // }

  /// Called by the [Router] when the [Router.routeInformationProvider] reports that a new route has been pushed to the application by the operating system.
  @override
  Future<void> setNewRoutePath(DeepLink configuration) async {
    _log.i("DietDrivenRouterDelegate - setNewRoutePath: $configuration");
    navigationCubit.push(configuration);
  }

  /// Called by the [Router] when the [Router.backButtonDispatcher] responds to a pop route intent from the engine.
  /// Returns whether this delegate handles the request.
  /// Returning false will cause the entire app to be popped.
  @override
  Future<bool> popRoute() async {
    _log.i("DietDrivenRouterDelegate - popRoute");
    return navigationCubit.pop();
  }

  /// Called by the [Router] when it detects a route information may have changed as a result of rebuild.
  /// In web applications, the route information is used for populating browser history in order to support the forward and the backward buttons.
  /// At most one [Router] can opt in to route information reporting.
  @override
  DeepLink get currentConfiguration {
    _log.i("DietDrivenRouterDelegate - get currentConfiguration");
    return navigationCubit.state.deepLinkHistory.last;
  }

  /// Called by the [Router] to obtain the widget tree that represents the current state.
  /// Not relying on included [Listenable] interface to rebuild the [Router],
  /// Instead, calls to [NavigationCubit] may cause [DietDrivenNavigation] and other sub-widgets to rebuild.
  @override
  Widget build(BuildContext context) {
    return DietDrivenNavigation();
  }
}




import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DietDrivenRouteInformationParser extends RouteInformationParser<DeepLink> {
  static final Logger _log = Logger(printer: PrettyPrinter(printTime: true));

  /// Converts the given route information into parsed data to pass to a [RouterDelegate].
  /// Returns [SynchronousFuture] since deserialization can be done synchronously and the [Router]
  /// does not need to wait for the next microtask to pass the data to the [RouterDelegate].
  @override
  Future<DeepLink> parseRouteInformation(RouteInformation routeInformation) async {
    _log.i("DietDrivenRouteInformationParser - parseRouteInformation: ${routeInformation.location}");
    try {
      return SynchronousFuture(DeepLink.deserialize(routeInformation.location));
    } catch(e) { // TODO also specific exceptions: on A catch(e) {...}
      _log.i("DietDrivenRouteInformationParser - parseRouteInformation - failed deserialization", e);
      return SynchronousFuture(DeepLink.failure(FailureDeepLink(error: e.toString())));
    }
  }

  /// Restore the route information from the given configuration.
  /// Required for route information reporting which is used for updating browser history for the web application.
  @override
  RouteInformation restoreRouteInformation(DeepLink path) {
    _log.i("DietDrivenRouteInformationParser - restoreRouteInformation: $path");
    return RouteInformation(location: path.serialize());
  }
}
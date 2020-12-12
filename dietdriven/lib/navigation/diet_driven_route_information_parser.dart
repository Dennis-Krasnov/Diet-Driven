import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/material.dart';

// class DietDrivenRouteInformationParser implements RouteInformationParser<TempDeepLink> {
//   @override
//   Future<TempDeepLink> parseRouteInformation(RouteInformation routeInformation) {
//     print("parseRouteInformation ${routeInformation.location} ${routeInformation.state}");
//     return SynchronousFuture(TempDeepLink.diary);
//     // return Future.sync(() => TempDeepLink.diary);
//   }
//
//   @override
//   RouteInformation restoreRouteInformation(TempDeepLink configuration) {
//     print("restoreRouteInformation $configuration");
//     return RouteInformation(location: "/diary");
//     // TODO: use state instead???
//   }
// }

class DietDrivenRouteInformationParser extends RouteInformationParser<DeepLinkPayload> {
  @override
  Future<DeepLinkPayload> parseRouteInformation(RouteInformation routeInformation) async {
    print("parseRouteInformation: ${routeInformation.location}");
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return DeepLinkPayload.details(int.tryParse(remaining));
    } else {
      return DeepLinkPayload.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(DeepLinkPayload path) {
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return null;
  }
}

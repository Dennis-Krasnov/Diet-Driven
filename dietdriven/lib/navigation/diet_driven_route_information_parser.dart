import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/material.dart';

class DietDrivenRouteInformationParser extends RouteInformationParser<DeepLink> {
  final test1 = DeepLink(
    currentPage: DeepLinkPage.home,
    homeDeepLink: HomeDeepLink(
      currentPage: HomeDeepLinkPage.diary,
      diaryDeepLink: DiaryDeepLink(date: 123, userId: "Dennis"),
    ),
  );

  final test2 = DeepLink(
    currentPage: DeepLinkPage.home,
    homeDeepLink: HomeDeepLink(
      currentPage: HomeDeepLinkPage.diet,
      dietDeepLink: DietDeepLink(),
    ),
  );

  final test3 = DeepLink(
    currentPage: DeepLinkPage.landing,
    landingDeepLink: LandingDeepLink(),
  );

  final test4 = DeepLink(
    currentPage: DeepLinkPage.failure,
    failureDeepLink: FailureDeepLink(error: "test4 failure"),
  );

  final test5 = DeepLink(
    currentPage: DeepLinkPage.splash,
    splashDeepLink: SplashDeepLink()
  );

  // TODO: implement parsing both ways in an extension in /lib/navigation/deep_link

  @override
  Future<DeepLink> parseRouteInformation(RouteInformation routeInformation) async {
    print("DietDrivenRouteInformationParser - parseRouteInformation - ${routeInformation.location}");

    if (routeInformation.location == "/") {
      return test5;
    }
    if (routeInformation.location == "test1") {
      return test1;
    }
    if (routeInformation.location == "test2") {
      return test2;
    }
    if (routeInformation.location == "test3") {
      return test3;
    }
    if (routeInformation.location == "test4") {
      return test4;
    }

    throw UnimplementedError();
  }

  @override
  RouteInformation restoreRouteInformation(DeepLink path) {
    print("DietDrivenRouteInformationParser - restoreRouteInformation - $path");

    if (path == test1) {
      return RouteInformation(location: "test1");
    }
    if (path == test2) {
      return RouteInformation(location: "test2");
    }
    if (path == test3) {
      return RouteInformation(location: "test3");
    }
    if (path == test4) {
      return RouteInformation(location: "test4");
    }
    if (path == test5) {
      return RouteInformation(location: "/");
    }

    throw UnimplementedError();
  }
}

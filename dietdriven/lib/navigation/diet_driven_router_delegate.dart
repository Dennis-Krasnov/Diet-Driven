import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/home/home_page.dart';
import 'package:dietdriven/widget/landing/landing_page.dart';
import 'package:dietdriven/widget/splash/splash_page.dart';
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietDrivenRouterDelegate extends RouterDelegate<DeepLink> with ChangeNotifier {
  final NavigationCubit navigationCubit;

  DietDrivenRouterDelegate({this.navigationCubit});

  /// for web ...
  @override
  Future<void> setInitialRoutePath(DeepLink configuration) async {
    print("DietDrivenRouterDelegate - setInitialRoutePath - $configuration");
    navigationCubit.replace(configuration);
  }

  /// for web ...
  @override
  Future<void> setNewRoutePath(DeepLink configuration) async {
    print("DietDrivenRouterDelegate - setNewRoutePath - $configuration");
    navigationCubit.push(configuration);
  }

  /// for web ...
  @override
  Future<bool> popRoute() async {
    print("DietDrivenRouterDelegate - popRoute");
    return navigationCubit.pop();
  }

  /// for web ...
  @override
  DeepLink get currentConfiguration {
    print("DietDrivenRouterDelegate - get currentConfiguration");
    // ...
    return navigationCubit.state.currentDeepLink;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        print("navigation cubit is $state");
        print("navigation cubit current is ${state.currentDeepLink}");
        return Navigator(
          pages: [
            if (state.currentDeepLink.currentPage == DeepLinkPage.splash)
              SplashPage(deepLink: state.currentDeepLink.splashDeepLink),

            if (state.currentDeepLink.currentPage == DeepLinkPage.landing)
              LandingPage(deepLink: state.currentDeepLink.landingDeepLink),

            // if (state.currentDeepLink.currentPage == DeepLinkPage.login)
            // ... TODO

            if (state.currentDeepLink.currentPage == DeepLinkPage.failure)
              UnrecoverableFailurePage(deepLink: state.currentDeepLink.failureDeepLink),

            if (state.currentDeepLink.currentPage == DeepLinkPage.home)
              HomePage(deepLink: state.currentDeepLink.homeDeepLink),
          ],
          onPopPage: (route, result) => false, // FIXME: document
          transitionDelegate: NoAnimationTransitionDelegate(),
        );
      },
    );
  }
}




import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/home/home_page.dart';
import 'package:dietdriven/widget/landing/landing_page.dart';
import 'package:dietdriven/widget/splash/splash_page.dart';
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ...
/// ...
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
    // Retrieve part of a state and react to changes only when the selected part changes
    final currentPage = context.select((NavigationCubit cubit) => cubit.state.currentDeepLink.currentPage);

    print("DietDrivenRouterDelegate BLOC BUILDER");

    return Navigator(
      pages: [
        if (currentPage == DeepLinkPage.splash)
          SplashPage(),

        if (currentPage == DeepLinkPage.landing)
          LandingPage(),

        // if (currentPage == DeepLinkPage.login)
        // ... TODO

        if (currentPage == DeepLinkPage.failure)
          UnrecoverableFailurePage(),

        if (currentPage == DeepLinkPage.home)
          HomePage(),
      ],
      onPopPage: (route, result) => false, // FIXME: document
      transitionDelegate: NoAnimationTransitionDelegate(),
    );
  }
}




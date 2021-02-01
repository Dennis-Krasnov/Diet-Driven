import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/no_animation_transition_delegate.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/home/home_page.dart';
import 'package:dietdriven/widget/landing/landing_page.dart';
import 'package:dietdriven/widget/landing/submitted/landing_submitted_page.dart';
import 'package:dietdriven/widget/splash/splash_page.dart';
import 'package:dietdriven/widget/unrecoverable_failure/unrecoverable_failure_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ...
class DietDrivenNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve part of a state and react to changes only when the selected part changes
    final currentPage = context.select((NavigationCubit cubit) => cubit.state.currentDeepLink.currentPage);
    final hasSubmissionEmail = context.select((NavigationCubit cubit) {
      final onLandingPage = cubit.state.currentDeepLink.currentPage == DeepLinkPage.landing;
      final hasSubmissionEmail = cubit.state.currentDeepLink?.landingDeepLink?.submittedEmail != null;
      return onLandingPage && hasSubmissionEmail;
    });

    print("DietDrivenRouterDelegate BLOC BUILDER");

    return Navigator(
      pages: [
        if (currentPage == DeepLinkPage.splash)
          SplashPage(),

        if (currentPage == DeepLinkPage.landing)
          LandingPage(),

        if (hasSubmissionEmail)
          LandingSubmittedPage(),

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

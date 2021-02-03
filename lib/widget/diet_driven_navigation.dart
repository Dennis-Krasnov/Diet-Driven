import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/no_animation_transition_delegate.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/build_logger.dart';
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
    // Rebuild only when the selected part of navigation state changes
    final currentPage = context.select((NavigationCubit cubit) => cubit.state.deepLinkHistory.last.currentPage);

    final hasSubmissionEmail = context.select((NavigationCubit cubit) {
      final deepLink = cubit.state.mostRecentWhere((dl) => dl?.currentPage == DeepLinkPage.landing);
      return deepLink?.landingDeepLink?.submittedEmail != null;
    });

    buildLog.v("DietDrivenNavigation - rebuild: currentPage=$currentPage, hasSubmissionEmail: $hasSubmissionEmail");

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
      onPopPage: (route, result) => false, // Don't use Navigator's built-in state
      transitionDelegate: NoAnimationTransitionDelegate(),
    );
  }
}

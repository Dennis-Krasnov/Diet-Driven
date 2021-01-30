import 'dart:async';

import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/domain/user.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages navigation state.
class NavigationCubit extends Cubit<NavigationState> {
  final AuthenticationRepository _authenticationRepository;

  /// ...
  final PlatformRouteInformationProvider platformRouteInformationProvider = PlatformRouteInformationProvider(
      initialRouteInformation: RouteInformation(location: "/")
  );

  NavigationCubit(this._authenticationRepository) : super(NavigationState.splash());

  StreamSubscription<NavigationState> _authenticationSubscription;

  Future<void> initializeSubscription() async {
    // Maintain single instance of stream subscription
    await _authenticationSubscription?.cancel();

    // Reset cubit state
    if (state != NavigationState.splash()) {
      print("reset cubit state");
      emit(NavigationState.splash());
    }
    
    // Maps user changes to navigation state
    _authenticationSubscription = _authenticationRepository.authStateChanges() // TODO: buffer stream a bit if it's non-null shortly after null
      .transform<NavigationState>(StreamTransformer.fromHandlers(
        handleData: (user, sink) {
          print("handle data $user");

          // User logged out
          if (user == null) {
            if (state != NavigationState.unauthenticated()) {
              sink.add(NavigationState.unauthenticated()); // TODO: don't subscribe init, re-use replace
            }

            print("user log out");
            return;
          }

          // User logged in
          if (state.user == null) {
            final defaultDeepLink = DietDrivenRouteInformationParser().test1; // FIXME
            sink.add(NavigationState(user: user, deepLinkHistory: [defaultDeepLink]));  // TODO: don't subscribe init, re-use replace

            print("user logged in");
            return;
          }

          // TODO
          // Subscriber-only pages
          // final isNonPayingUser = !user.paidUser;
          // final isOnDietPage = state.currentDeepLink.currentPage == DeepLinkPage.home && state.currentDeepLink.homeDeepLink.currentPage == HomeDeepLinkPage.diet;
          // final isOnSettingsPage = state.currentDeepLink.currentPage == DeepLinkPage.home && state.currentDeepLink.homeDeepLink.currentPage == HomeDeepLinkPage.settings;
          // if (isNonPayingUser && (isOnDietPage || isOnSettingsPage)) {
          //   // sink.add(...);
          //   return;
          // }
        },
        handleError: (error, stacktrace, sink) {
          print("handle error $error");
          final deepLink = DeepLink(currentPage: DeepLinkPage.failure, failureDeepLink: FailureDeepLink(error: error));
          sink.add(NavigationState(user: null, deepLinkHistory: [deepLink]));
          // // TODO: test this!
          // sink.add(UnrecoverableFailure(error: error.toString(), stackTrace: stacktrace.toString()));
        },
        handleDone: (sink) {
          print("handle done");
          // sink.add(UnrecoverableFailure(error: "Authentication state stream ended"));
        },
      ))
      .listen(emit);
  }

  void replace(DeepLink deepLinkPayload) {

  }

  void push(DeepLink deepLinkPayload) {
    // FIXME: don't push if state.deepLinkHistory.last == deepLinkPayload
    emit(state.copyWith(
        deepLinkHistory: List.from(state.deepLinkHistory)..add(deepLinkPayload)
    ));
  }

  bool pop() {
    if (state.deepLinkHistory.length == 1) {
      // Quit from application
      return false;
    }

    emit(state.copyWith(deepLinkHistory: List.from(state.deepLinkHistory)..removeLast()));

    // Don't quit from application
    return true;
  }

  /// ...
  void switchHomeScreenPages(HomeDeepLinkPage homeDeepLinkPage) {
    assert(state.user != null);
    assert(state.currentDeepLink.currentPage == DeepLinkPage.home);

    // TODO: delegate to push, it performs validity checks there ...
    // TODO: ensure where I'm going doesn't have a null deep link...
    emit(state.copyWith(
      deepLinkHistory: List.from(state.deepLinkHistory)
        ..add(state.currentDeepLink.copyWith(
          homeDeepLink: state.currentDeepLink.homeDeepLink.copyWith(
            currentPage: homeDeepLinkPage,
          )
        ))
    ));
  }
}
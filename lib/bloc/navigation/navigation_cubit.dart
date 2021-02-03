import 'dart:async';

import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// Manages navigation state.
class NavigationCubit extends Cubit<NavigationState> {
  final AuthenticationRepository _authenticationRepository;

  NavigationCubit(this._authenticationRepository) : super(NavigationState.splash());

  /// ...
  final PlatformRouteInformationProvider platformRouteInformationProvider = PlatformRouteInformationProvider(
      initialRouteInformation: RouteInformation(location: DeepLink.splash(SplashDeepLink()).serialize())
  );

  StreamSubscription<NavigationState> _authenticationSubscription;

  static final Logger _log = Logger(printer: PrettyPrinter(printTime: true));

  Future<void> initializeSubscription() async {
    _log.d("NavigationCubit - initializeSubscription");

    // Maintain single instance of stream subscription
    await _authenticationSubscription?.cancel();

    // Reset cubit state
    if (state != NavigationState.splash()) {
      _log.d("NavigationCubit - reset cubit state");
      emit(NavigationState.splash());
    }
    
    // Maps user changes to navigation state
    _authenticationSubscription = _authenticationRepository.authStateChanges() // TODO: buffer stream a bit if it's non-null shortly after null
      .transform<NavigationState>(StreamTransformer.fromHandlers(
        handleData: (user, sink) {
          _log.i("NavigationCubit - authStateChanges - handleData: $user");

          // User logged out
          if (user == null) {
            if (state != NavigationState.unauthenticated()) {
              sink.add(NavigationState.unauthenticated()); // TODO: don't subscribe init, re-use replace
            }

            _log.d("NavigationCubit - authStateChanges - handleData: no user found");
            return;
          }

          // User logged in
          if (state.user == null) {
            final deepLink = DeepLink.home(HomeDeepLink.diary(DiaryDeepLink.today(userId: user.uid)));
            sink.add(NavigationState(user: user, deepLinkHistory: [deepLink])); // TODO: don't subscribe init, re-use replace

            _log.d("NavigationCubit - authStateChanges - handleData: user logged in");
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
          _log.e("NavigationCubit - authStateChanges - handleError", error, stacktrace);
          final deepLink = DeepLink.failure(FailureDeepLink(error: error));
          sink.add(NavigationState(user: null, deepLinkHistory: [deepLink]));
          // // TODO: test this!
          // sink.add(UnrecoverableFailure(error: error.toString(), stackTrace: stacktrace.toString()));
        },
        handleDone: (sink) {
          _log.wtf("NavigationCubit - authStateChanges - handleDone");
          // sink.add(UnrecoverableFailure(error: "Authentication state stream ended"));
        },
      ))
      .listen(emit);
  }

  void replace(DeepLink deepLinkPayload) {

  }

  void push(DeepLink deepLink) {
    _log.i("NavigationCubit - push: $deepLink");

    // ...
    if (!deepLink.isValid()) {
      _log.d("NavigationCubit - push wasn't valid");
      // TODO: make isValid() return a nullable String, if not null, it returns the error message.
      final failureDeepLink = DeepLink.failure(FailureDeepLink(error: "Invalid deep link: $deepLink"));
      emit(state.copyWith(
        deepLinkHistory: List.from(state.deepLinkHistory)..add(failureDeepLink)
      ));
      return;
    }

    // ...
    if (state.deepLinkHistory.last == deepLink) {
      _log.d("NavigationCubit - push - was a duplicate");
      return;
    }

    // ...
    emit(state.copyWith(
      deepLinkHistory: List.from(state.deepLinkHistory)..add(deepLink)
    ));
  }

  /// Returns whether this delegate handles the request.
  /// Returning false will cause the entire app to be popped.
  bool pop() {
    _log.i("NavigationCubit - pop");

    if (state.deepLinkHistory.length == 1) {
      return false;
    }

    emit(state.copyWith(deepLinkHistory: List.from(state.deepLinkHistory)..removeLast()));

    return true;
  }

  /// ...
  void switchHomeScreenPages(HomeDeepLinkPage homeDeepLinkPage) {
    assert(state.user != null);
    assert(state.deepLinkHistory.last.currentPage == DeepLinkPage.home);
    switch (homeDeepLinkPage) {
      case HomeDeepLinkPage.diary:
        push(DeepLink.home(HomeDeepLink.diary(DiaryDeepLink.today(userId: state.user.uid))));
        break;

      case HomeDeepLinkPage.diet:
        push(DeepLink.home(HomeDeepLink.diet(DietDeepLink())));
        break;

      case HomeDeepLinkPage.settings:
        push(DeepLink.home(HomeDeepLink.settings(SettingsDeepLink.base())));
        break;

      default:
        throw UnimplementedError("Couldn't switchHomeScreenPages to $homeDeepLinkPage");
    }
  }
}
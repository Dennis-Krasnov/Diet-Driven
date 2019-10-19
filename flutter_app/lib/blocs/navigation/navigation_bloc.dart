/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Manages bottom navigation and deep linking.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final UserDataBloc userDataBloc;
  final AnalyticsRepository analyticsRepository;

  NavigationBloc({@required this.userDataBloc, @required this.analyticsRepository})
    : assert(userDataBloc != null), assert(analyticsRepository != null);

  @override
  NavigationState get initialState => NavigationUninitialized();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is InitNavigation) {
      // Navigation has no error state
      assert(currentState is NavigationUninitialized);

      // Go to default page if navigation bloc hasn't yet been initialized
      Observable<UserDataState>(userDataBloc.state)
        .whereType<UserDataLoaded>()
        .map<Page>((state) => state.settings.navigationSettings.defaultPage)
        .map<NavigationEvent>((page) => ResetNavigation((b) => b..defaultPage = page))
        .first
        .then(dispatch);
    }

    // Can't use custom builder default values since it removes []= operator on pageDeepLinks
    if (event is ResetNavigation) {
      yield NavigationRoute((b) => b
        ..page = event.defaultPage
        ..pageDeepLinks = MapBuilder(<Page, BuiltList<DeepLink>>{
          Page.diary: BuiltList(<DeepLink>[DiaryDeepLink.today()]),
          Page.track: BuiltList(<DeepLink>[]),
          Page.reports: BuiltList(<DeepLink>[]),
          Page.settings: BuiltList(<DeepLink>[SettingsDeepLink()]),
        })
        ..shouldAnimate = false
      );

      BlocLogger().info("Reset navigation to defaults");
    }

    if (event is Navigate) {
      // Navigation has no error state
      assert(currentState is NavigationRoute);
      final routeState = currentState as NavigationRoute;

      yield routeState.rebuild((b) => b
        ..page = event.page
        ..pageDeepLinks[event.page] = event.deepLinks
        ..shouldAnimate = false
      );

      BlocLogger().info("Navigated to ${event.page} - ${event.deepLinks} with${false ? "" : "out"} animation");
    }

    if (event is SwitchTab) {
      // Navigation has no error state
      assert(currentState is NavigationRoute);
      final routeState = currentState as NavigationRoute;

      yield routeState.rebuild((b) => b
        ..page = event.to
        ..shouldAnimate = false
      );

      BlocLogger().info("Switched tabs to ${event.to}");
    }

    if (event is Push) {
      // Navigation has no error state
      assert(currentState is NavigationRoute);
      final routeState = currentState as NavigationRoute;

      yield routeState.rebuild((b) => b
        ..pageDeepLinks[routeState.page] = b.pageDeepLinks[routeState.page].rebuild((b) => b
          ..add(event.deepLink)
        )
        ..shouldAnimate = true
      );

      BlocLogger().info("Pushed from ${routeState.currentPath()}");
    }

    if (event is Pop) {
      // Navigation has no error state
      assert(currentState is NavigationRoute);
      final routeState = currentState as NavigationRoute;

      yield routeState.rebuild((b) => b
        ..pageDeepLinks[routeState.page] = b.pageDeepLinks[routeState.page].rebuild((b) => b
          ..removeLast()
        )
      );

      BlocLogger().info("Popped from ${routeState.currentPath()}");
    }
  }
}

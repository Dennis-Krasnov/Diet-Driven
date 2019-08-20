import 'dart:async';

import 'package:bloc/bloc.dart';
//import 'package:diet_driven/log_printer.dart';
//import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';

/// Manages bottom navigation and deep linking.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final AnalyticsRepository analyticsRepository;
  final UserDataBloc userDataBloc;

  NavigationBloc({@required this.analyticsRepository, @required this.userDataBloc})
    : assert(analyticsRepository != null), assert(userDataBloc != null);

  @override
  NavigationState get initialState => NavigationUninitialized();

//  analyticsRepository.navigateToScreen(transition.event.page.name); // FIXME logging

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is InitNavigation) {
      assert(currentState is NavigationUninitialized);

      // Go to default page if navigation bloc hasn't yet been initialized
      Observable<UserDataState>(userDataBloc.state)
        .ofType(const TypeToken<UserDataLoaded>())
        .map<NavigationEvent>((state) => pageToEvent(state.settings.navigationSettings.defaultPage))
        .first
        .then(dispatch);
    }

    if (event is ClearDeepLink) {
      // TODO: assert one of loaded states
      yield currentState.rebuild((b) => b
        ..deepLink = null
      );
    }

    if (event is NavigateToDiary) {
      yield DiaryTab((b) => b
        ..deepLink = event.deepLink
      );
    }

    if (event is NavigateToTrack) {
      yield TrackTab();
    }

    if (event is NavigateToReports) {
      yield ReportsTab();
    }

    if (event is NavigateToSettings) {
      yield SettingsTab((b) => b
        ..deepLink = event.deepLink
      );
    }

    if (event is NavigateToLogging) {
      yield LoggingTab();
    }
  }

  NavigationEvent pageToEvent(Page page) {
    switch (page) {
      case Page.diary:
        return NavigateToDiary();
        break;
      case Page.track:
        return NavigateToTrack();
        break;
      case Page.reports:
        return NavigateToReports();
        break;
      case Page.settings:
        return NavigateToSettings();
        break;
      case Page.logging:
        return NavigateToLogging();
        break;
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';

/// Manages bottom navigation's current page.
/// [NavigationBloc] shows skeleton bottom menu and app bar until loaded.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final Logger _log = Logger("navigation bloc");
  final AnalyticsRepository analyticsRepository;
  final UserDataBloc userDataBloc;

  Observable<NavigationSettings> _navigationSettingsStream;
  StreamSubscription<NavigationSettings> _navigationSettingsSubscription;

  NavigationBloc({@required this.analyticsRepository, @required this.userDataBloc}) {
    assert(analyticsRepository != null);
    assert(userDataBloc != null);

    // Navigation bloc is re-instantiated for every new user, hence there is no need to wipe old navigation state
    _navigationSettingsStream = Observable<UserDataState>(userDataBloc.state)
      .where((state) => state is UserDataLoaded)
      .map<NavigationSettings>((state) => (state as UserDataLoaded).settings.navigationSettings)
      .distinct();

    _navigationSettingsSubscription = _navigationSettingsStream.listen((navSettings) {
      // Go to default page if navigation bloc hasn't yet been initialized
      // Uninitialization check must be in `mapEventToState(event)` since currentState is uninitialized in constructor
      dispatch(pageToEvent(navSettings.defaultPage).rebuild((b) => b..onlyIfUninitialized = true));
    });
  }

  @override
  void dispose() {
    _navigationSettingsSubscription?.cancel();
    super.dispose();
  }

  @override
  NavigationState get initialState => NavigationUninitialized();

//  analyticsRepository.navigateToScreen(transition.event.page.name); // FIXME logging

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is ClearDeepLink) {
      yield currentState.rebuild((b) => b
        ..deepLink = null
      );

      _log.info("cleared deep link");
    }

    // Switching users re-instantiates navigation bloc, thus checking navigation uninitialized is sufficient
    // Semantically equivalent to implication (event.onlyIfUninitialized -> currentState is NavigationUninitialized)
    if (!event.onlyIfUninitialized || currentState is NavigationUninitialized) {
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

      _log.info("navigated to page ${currentState.page}");
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
    }
  }
}

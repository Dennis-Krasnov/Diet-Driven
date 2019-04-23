import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';

/// Manages bottom navigation current page.
/// [NavigationBloc] shows skeleton bottom menu and app bar until loaded.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final Logger _log = new Logger("navigation bloc");
  final AnalyticsRepository analyticsRepository;
  final UserDataBloc userDataBloc;

  Observable<NavigationSettings> _navigationSettingsStream;
  StreamSubscription<NavigationSettings> _navigationSettingsSubscription;

  NavigationBloc({@required this.analyticsRepository, @required this.userDataBloc}) {
    assert(analyticsRepository != null);
    assert(userDataBloc != null);

    // Navigation bloc is re-instantiated for every new user, hence there is no need to wipe old state
    _navigationSettingsStream = Observable<UserDataState>(userDataBloc.state)
      .where((state) => state is UserDataLoaded)
      .map<NavigationSettings>((state) => (state as UserDataLoaded).settings.navigationSettings)
      .distinct();

    _navigationSettingsSubscription = _navigationSettingsStream.listen((navSettings) {
      // Go to default page if navigation bloc hasn't been initialized
      // if statement must be in `mapEventToState(event)` since currentState is always uninitialized in constructor
      dispatch(InitialNavigateToPage((b) => b..page = navSettings.defaultPage));
    });
  }

  @override
  void dispose() {
    _navigationSettingsSubscription?.cancel();
    super.dispose();
  }

  @override
  NavigationState get initialState => NavigationUninitialized();

  @override
  void onTransition(Transition<NavigationEvent, NavigationState> transition) {
    // Log visited pages in Firebase analytics
    analyticsRepository.navigateToScreen(transition.event.page.name);
  }

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is InitialNavigateToPage) {
      // Switching users re-instantiates navigation bloc, thus checking navigation uninitialized is sufficient
      // Don't assert currentState is NavigationUninitialized since this is called for every userDataState
      if (currentState is NavigationUninitialized) {
        yield NavigationLoaded((b) => b..currentPage = event.page);
        _log.info("going to default page: ${event.page}");
      }
    }
    if (event is NavigateToPage) {
      yield NavigationLoaded((b) => b..currentPage = event.page);

      _log.info("navigated to page ${event.page}");
    }
  }
}

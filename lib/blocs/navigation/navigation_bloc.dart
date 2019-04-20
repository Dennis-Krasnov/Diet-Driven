import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';

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
      .map<NavigationSettings>((state) => (state as UserDataLoaded).userData.settings.navigationSettings)
      .distinct();

    _navigationSettingsSubscription = _navigationSettingsStream.listen((navSettings) {
      // Go to default page if navigation used to be uninitialized
      if (currentState is NavigationUninitialized) {
        dispatch(NavigateToPage((b) => b..page = navSettings.defaultPage));

        _log.info("going to default page ${navSettings.defaultPage}");
      }
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
    if (transition.event is NavigateToPage) {
      // Log visited pages in Firebase analytics
      analyticsRepository.navigatePage((transition.event as NavigateToPage).page);
    }
  }

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToPage) {
      assert(currentState is NavigationLoaded);
      if (currentState is NavigationLoaded) {
        var navLoaded = currentState as NavigationLoaded;

        yield navLoaded.rebuild((b) => b
          ..currentPage = event.page
        );

        _log.info("navigated to page ${event.page}");
      }
    }
  }
}

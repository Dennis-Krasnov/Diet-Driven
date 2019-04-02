import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:meta/meta.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  // TODO: log
  final AnalyticsRepository analyticsRepository;

  NavigationBloc({@required this.analyticsRepository}) : assert(analyticsRepository != null);

  @override
  NavigationState get initialState => NavigationState((b) => b
    ..currentPage = "diary"
    ..bottomNavigationPages = ListBuilder(["diary", "track", "diet", "profile"]) // TODO: recipes
  );


  @override
  void onTransition(Transition<NavigationEvent, NavigationState> transition) {
    if (transition.event is NavigateToPage) {
      analyticsRepository.navigatePage((transition.event as NavigateToPage).page);
    }
  }

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToPage) {
      yield currentState.rebuild((b) => b
        ..currentPage = event.page
      );
    }
    else if (event is ReorderNavigation) {
      yield currentState.rebuild((b) => b
        ..bottomNavigationPages = event.bottomNavigationPages.toBuilder()
      );
    }
    else {
      print("NAVIGATION EVENT NOT DEFINED: $event");
    }
  }

}

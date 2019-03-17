import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/navigation/navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => NavigationState((b) => b
    ..currentPage = "diary"
    ..bottomNavigationPages = ListBuilder(["diary", "track", "diet", "profile"]) // TODO: recipes
  );

  @override
  Stream<NavigationState> mapEventToState(NavigationState currentState, NavigationEvent event) async* {
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
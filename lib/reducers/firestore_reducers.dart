import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/page.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger("FS_REDUCER");

//NestedReducerBuilder<AppState, AppStateBuilder, NavigationState, NavigationStateBuilder> getNavigationReducer() =>
//  (new NestedReducerBuilder<AppState, AppStateBuilder, NavigationState, NavigationStateBuilder>((s) => s.navigation, (b) => b.navigation)
//
//  );
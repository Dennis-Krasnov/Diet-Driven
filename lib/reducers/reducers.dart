import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';

ReducerBuilder<AppState, AppStateBuilder> reducerBuilder =
    new ReducerBuilder<AppState, AppStateBuilder>()
//      ..add(CounterActionsNames.increment, (s, a, b) => b.count++);
//      ..add(ActionsNames.increment, increment)
      ..add(ActionsNames.updateTab, updateTab);


//void increment(AppState state, Action<void> action, AppStateBuilder builder) {
//  builder.count++;
//}

void updateTab(AppState state, Action<Page> action, AppStateBuilder builder) {
  builder.activePage = action.payload;
}
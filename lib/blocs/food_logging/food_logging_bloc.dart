import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'dart:async';

import 'package:diet_driven/blocs/food_logging/food_logging.dart';

///
class FoodLoggingBloc extends Bloc<FoodLoggingEvent, FoodLoggingState> {
  @override
  FoodLoggingState get initialState => null;

  @override
  Stream<FoodLoggingState> mapEventToState(FoodLoggingEvent event) async* {
//    if (event is AddToSelection) {
//      if (currentState is FoodLoggingSingleSelect) {
//        var state = currentState as FoodLoggingSingleSelect;
//
//        // RemoveFromSelection should remove previously selected food record
//        assert(state.selectedFoodRecord == null);
//
//        yield state.rebuild((b) => b
//          ..selectedFoodRecord = event.foodRecord.toBuilder()
//        );
//      }
//
//      if (currentState is FoodLoggingMultiSelect) {
//        var state = currentState as FoodLoggingMultiSelect;
//
//        yield state.rebuild((b) => b
//          ..selectedFoodRecords = state.selectedFoodRecords.rebuild((b) => b.add(event.foodRecord)).toBuilder()
//        );
//      }
//    }
//
//    if (event is RemoveFromSelection) {
//      if (currentState is FoodLoggingSingleSelect) {
//        var state = currentState as FoodLoggingSingleSelect;
//
//        // AddToSelection should ensure selected food record exists
//        assert(state.selectedFoodRecord != null);
//
//        yield state.rebuild((b) => b
//          ..selectedFoodRecord = null
//        );
//      }
//
//      if (currentState is FoodLoggingMultiSelect) {
//        var state = currentState as FoodLoggingMultiSelect;
//
//        yield state.rebuild((b) => b
//          ..selectedFoodRecords = state.selectedFoodRecords.rebuild((b) => b.remove(event.foodRecord)).toBuilder()
//        );
//      }
//    }
//
//    if (event is SaveSelection) {
//      if (currentState is FoodLoggingSingleSelect) {
//        yield (currentState as FoodLoggingSingleSelect).rebuild((b) => b);
//      }
//
//      if (currentState is FoodLoggingMultiSelect) {
//        yield (currentState as FoodLoggingMultiSelect).rebuild((b) => b);
//      }
//    }
//
//    if (event is StartMultiSelect) {
//      assert(currentState is FoodLoggingSingleSelect);
//      if (currentState is FoodLoggingSingleSelect) {
//
//      }
//    }
//
//    if (event is CancelMultiSelect) {
//      assert(currentState is FoodLoggingMultiSelect);
//      if (currentState is FoodLoggingMultiSelect) {
//        // TODO: completer success state! // TODO: use completers for food diary events! (on catch fail), show snackbar from ui!
//      }
//    }
//
//    if (event is ChangeMeal) {
//      // TOTEST
//      // FIXME: make common class uninstantiable built value (see built value polymorphism example)
//      Built<dynamic, dynamic> state = currentState is FoodLoggingSingleSelect
//        ? currentState as FoodLoggingSingleSelect
//        : currentState as FoodLoggingMultiSelect;
//
//      state.rebuild((b) => b..meal = event.meal);
////      currentState.meal
////      abstract class FoodLoggingState {
////        int get meal;
////      }
//    }
  }
}



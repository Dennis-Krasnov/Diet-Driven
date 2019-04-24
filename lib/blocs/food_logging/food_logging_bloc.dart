import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'dart:async';

import 'package:diet_driven/blocs/food_logging/food_logging.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

///
class FoodLoggingBloc extends Bloc<FoodLoggingEvent, FoodLoggingState> {
  final Logger _log = new Logger("food logging bloc");
  final DiaryRepository diaryRepository;
  final FoodRepository foodRepository;
  final String userId;
  final int daysSinceEpoch;
  final int meal;

  FoodLoggingBloc({
    @required this.diaryRepository,
    @required this.foodRepository,
    @required this.userId,
    @required this.daysSinceEpoch,
    @required this.meal
  }) {
    assert(diaryRepository != null);
    assert(foodRepository != null);
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(0 <= meal && meal <= 6);

    // Generate results for all tabs!
  }

  BuiltList<FoodRecord> get randomFoodRecords => BuiltList(
    List<FoodRecord>.generate(
      2 + Random().nextInt(5),
      (int index) => FoodRecord((b) => b
        ..foodName = "Some food #$index"
        ..quantity = Random().nextInt(100)
      )
    )
  );

  @override
  FoodLoggingState get initialState => FoodLoggingSingleSelect((b) => b
    ..meal = meal  // TODO: option to change default (take from settings, pass as param)!
    ..recentResults = randomFoodRecords.toBuilder()
    ..popularResults = randomFoodRecords.toBuilder()
    ..favoriteResults = randomFoodRecords.toBuilder()
  );

  @override
  Stream<FoodLoggingState> mapEventToState(FoodLoggingEvent event) async* {
    if (event is AddToSelection) {
      if (currentState is FoodLoggingSingleSelect) {
        var state = currentState as FoodLoggingSingleSelect;

        // RemoveFromSelection should remove previously selected food record
        assert(state.selectedFoodRecord == null);

        yield state.rebuild((b) => b
          ..selectedFoodRecord = event.foodRecord.toBuilder()
        );
      }

      if (currentState is FoodLoggingMultiSelect) {
        var state = currentState as FoodLoggingMultiSelect;

        yield state.rebuild((b) => b
          ..selectedFoodRecords = state.selectedFoodRecords.rebuild((b) => b.add(event.foodRecord)).toBuilder()
        );
      }
    }

    if (event is RemoveFromSelection) {
      if (currentState is FoodLoggingSingleSelect) {
        var state = currentState as FoodLoggingSingleSelect;

        // AddToSelection should ensure selected food record exists
        assert(state.selectedFoodRecord != null);

        yield state.rebuild((b) => b
          ..selectedFoodRecord = null
        );
      }

      if (currentState is FoodLoggingMultiSelect) {
        var state = currentState as FoodLoggingMultiSelect;

        yield state.rebuild((b) => b
          ..selectedFoodRecords = state.selectedFoodRecords.rebuild((b) => b.remove(event.foodRecord)).toBuilder()
        );
      }
    }

    if (event is SaveSelection) {
      try {
        // TODO: dart 2.3 list if statements
//        BuiltList<FoodRecord> selectedFoodRecords = BuiltList([
//          if (currentState is FoodLoggingSingleSelect)
//            currentState.selectedFoodRecord
//          if (currentState is FoodLoggingMultiSelect)
//            ...currentState.selectedFoodRecords
//        ]);

        // List of all selected food records
        BuiltList<FoodRecord> selectedFoodRecords = currentState.getSelectedFoodRecords();
//
//        if (currentState is FoodLoggingSingleSelect) {
//          var state = currentState as FoodLoggingSingleSelect;
//          selectedFoodRecords = selectedFoodRecords.rebuild((b) => b..add(state.selectedFoodRecord));
//        }
//
//        if (currentState is FoodLoggingMultiSelect) {
//          var state = currentState as FoodLoggingMultiSelect;
//          selectedFoodRecords = selectedFoodRecords.rebuild((b) => b..addAll(state.selectedFoodRecords));
//        }

        // Save each food record one-by one
        for (FoodRecord foodRecord in selectedFoodRecords) {
          diaryRepository.addFoodRecord(userId, daysSinceEpoch, foodRecord);
        }
        event.completer?.complete();

        _log.info("selection of $selectedFoodRecords saved");
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }

    if (event is StartMultiSelect) {
      assert(currentState is FoodLoggingSingleSelect);
      if (currentState is FoodLoggingSingleSelect) {
        var state = currentState as FoodLoggingSingleSelect;

        // Shouldn't have a selected food
        assert(state.selectedFoodRecord == null);

        yield FoodLoggingMultiSelect((b) => b
          ..meal = currentState.meal
          ..recentResults = currentState.recentResults.toBuilder()
          ..popularResults = currentState.popularResults.toBuilder()
          ..favoriteResults = currentState.favoriteResults.toBuilder()
        );
      }
    }

    if (event is CancelMultiSelect) {
      assert(currentState is FoodLoggingMultiSelect);
      if (currentState is FoodLoggingMultiSelect) {
        // Clears currently selected food records!
        // TODO: show confirmation using completer?!
        yield FoodLoggingSingleSelect((b) => b
          ..meal = currentState.meal
          ..recentResults = currentState.recentResults.toBuilder()
          ..popularResults = currentState.popularResults.toBuilder()
          ..favoriteResults = currentState.favoriteResults.toBuilder()
        );
      }
    }

    if (event is ChangeMeal) {
      if (currentState is FoodLoggingSingleSelect) {
        var state = currentState as FoodLoggingSingleSelect;

        yield state.rebuild((b) => b
          ..meal = event.meal
//          ..selectedFoodRecord = state.selectedFoodRecord.rebuild((b) => b..meal = event.meal) // TODO
        );
      }

      if (currentState is FoodLoggingMultiSelect) {
        var state = currentState as FoodLoggingMultiSelect;

        yield state.rebuild((b) => b
          ..meal = event.meal
//          ..selectedFoodRecords = state.selectedFoodRecords.rebuild((b) => b.map((record) => record.rebuild((b) => b
//            ..meal = event.meal // TODO
//          ))).toBuilder()
        );
      }
    }
  }
}



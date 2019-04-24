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
import 'package:rxdart/rxdart.dart';

///
class FoodLoggingBloc extends Bloc<FoodLoggingEvent, FoodLoggingState> {
  final Logger _log = new Logger("food logging bloc");
  final DiaryRepository diaryRepository;
  final FoodRepository foodRepository;
  final String userId;
  final int daysSinceEpoch;
  final int meal;
  final bool startWithMultiSelect;

  FoodLoggingBloc({
    @required this.diaryRepository,
    @required this.foodRepository,
    @required this.userId,
    @required this.daysSinceEpoch,
    @required this.meal,
    @required this.startWithMultiSelect,
  }) {
    assert(diaryRepository != null);
    assert(foodRepository != null);
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(0 <= meal && meal <= 6);

    // Don't pull more data at end of page, only do so with search & real api.
    // dont do: switch map (n) => food repo.recent(n) (increment n on end of page - treat each tab separately)

    // TODO: still do this, but do concat eager with all loading in as soon as possible
    //  if I decide to load all no matter what...

//    CombineLatestStream.combine3(
//      Observable.fromFuture(foodRepository.recentFoodRecords(userId, 10)),
//      Observable.fromFuture(foodRepository.recentFoodRecords(userId, 10)), // FIXME
//      Observable.fromFuture(foodRepository.recentFoodRecords(userId, 10)),
//      ( BuiltList<FoodRecord> recentFoodRecords,
//        BuiltList<FoodRecord> popularFoodRecords,
//        BuiltList<FoodRecord> favoriteFoodRecords) =>
//          RemoteFoodRecordsArrived((b) => b
//            ..meal = meal
//            ..multiSelect = startWithMultiSelect
//            ..recentFoodRecords = recentFoodRecords
//            ..popularFoodRecords = popularFoodRecords
//            ..favoriteFoodRecords = favoriteFoodRecords
//          ),
//    );
//        Observable.fromFuture(foodRepository.recentFoodRecords(userId));


    // Generate results for all tabs!
  }

  @override
  FoodLoggingState get initialState => FoodLoggingState((b) => b
    ..meal = meal
    ..multiSelect = startWithMultiSelect
  );

  @override
  Stream<FoodLoggingState> mapEventToState(FoodLoggingEvent event) async* {
    if (event is FetchFoodRecordsResults) {
      print("FETCHING!");
      try {
//        if (event.loggingTab == LoggingTab.recent) { // FIXME switch case statement
        if (true) {
          BuiltList<FoodRecord> recentFoodRecords = await foodRepository.recentFoodRecords(userId);
          BuiltList<FoodRecord> popularFoodRecords = await foodRepository.recentFoodRecords(userId);
          BuiltList<FoodRecord> favoriteFoodRecords = await foodRepository.recentFoodRecords(userId);
          yield currentState.rebuild((b) => b
            ..recentResults = recentFoodRecords.toBuilder()
            // FIXME only one at a time
            ..popularResults = popularFoodRecords.toBuilder()
            ..favoriteResults = favoriteFoodRecords.toBuilder()
          );
        }
        event.completer?.complete();

        // TODO: log this and all other events as well
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }

    if (event is AddToSelection) {
      if (!currentState.multiSelect) {
        assert(currentState.selectedFoodRecords.isEmpty);
      }

      yield currentState.rebuild((b) => b
        ..selectedFoodRecords = currentState.selectedFoodRecords.rebuild((b) => b.add(event.foodRecord)).toBuilder()
      );
    }

    if (event is RemoveFromSelection) {
      if (!currentState.multiSelect) {
        assert(currentState.selectedFoodRecords.length == 1);
      }

      yield currentState.rebuild((b) => b
        ..selectedFoodRecords = currentState.selectedFoodRecords.rebuild((b) => b.remove(event.foodRecord)).toBuilder()
      );
    }

    if (event is SaveSelection) {
      try {
        // Save each food record one-by one
        for (FoodRecord foodRecord in currentState.selectedFoodRecords) {
          diaryRepository.addFoodRecord(userId, daysSinceEpoch, foodRecord);
        }
        event.completer?.complete();

        _log.info("selection of ${currentState.selectedFoodRecords} saved");
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }

    if (event is StartMultiSelect) {
      assert(!currentState.multiSelect);
//      assert(currentState.selectedFoodRecords.isEmpty, "Can't enter multi-select with foods selected."); not critical...

      yield currentState.rebuild((b) => b
        ..multiSelect = true
      );
    }

    if (event is CancelMultiSelect) {
      assert(currentState.multiSelect);

      // TODO: show confirmation using completer if selected food wasn't empty
      yield currentState.rebuild((b) => b
        ..multiSelect = false
        ..selectedFoodRecords = ListBuilder([]) // Cancelling multi-select removes all selected food records.
      );
    }

    if (event is ChangeMeal) {
      yield currentState.rebuild((b) => b
        ..meal = event.meal
      );
    }
  }
}



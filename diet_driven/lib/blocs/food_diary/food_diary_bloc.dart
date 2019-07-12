import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/models.dart';

/// Fetches and manages user's food diary days and diets.
/// [FoodDiaryBloc] shows skeleton page until loaded.
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {

  /// Fixed point to distinguish 'ongoing' and 'historical' food diary subscriptions.
  /// [today] stays constant regardless of real-world time.
  final int today = 23626; // DateTime.now().TO_DAYS_SINCE_EPOCH

  StreamSubscription<FoodDiaryEvent> _foodDiaryEventSubscription;

  FoodDiaryBloc() {
    final _foodDiaryEvent$ = Observable<FoodDiaryEvent>(CombineLatestStream.combine2(
      // TODO: load from repository
      Observable<BuiltList<FoodDiaryDay>>.just(BuiltList(<FoodDiaryDay>[
        FoodDiaryDay((b) => b
          ..date = 12523
          ..foodRecords = ListBuilder(<FoodRecord>[
            FoodRecord((b) => b..foodName = "apple"),
            FoodRecord((b) => b..foodName = "pear"),
            FoodRecord((b) => b..foodName = "orange"),
          ])
        ),
      ])),
      Observable<BuiltList<Diet>>.just(BuiltList(<Diet>[
        Diet((b) => b..calories = 2520),
        Diet((b) => b..calories = 2125),
      ])),
      (BuiltList<FoodDiaryDay> diaryDays, BuiltList<Diet> diets) => RemoteFoodDiaryArrived((b) => b
          ..diaryDays = diaryDays.toBuilder()
          ..diets = diets.toBuilder()
      )),
    );

    _foodDiaryEventSubscription = _foodDiaryEvent$.listen(
      (foodDiaryEvent) => dispatch(foodDiaryEvent),
      onError: (Object error, Object trace) => dispatch(FoodDiaryError((b) => b
        ..error = error
        ..trace = trace
      )),
    );
  }

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  void dispose() {
    _foodDiaryEventSubscription?.cancel();
    super.dispose();
  }


  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is RemoteFoodDiaryArrived) {
      MapBuilder<int, FoodDiaryDay> diaryDaysBuilder;
      int currentDate = 125214; // TODO: DateTime.now().TO_DAYS_SINCE_EPOCH

      // Load previous current date and food diary days
      if (currentState is FoodDiaryLoaded) {
        currentDate = (currentState as FoodDiaryLoaded).currentDate;
        diaryDaysBuilder.replace((currentState as FoodDiaryLoaded).diaryDays);
      }

      // Override with new food diary days
      diaryDaysBuilder.addIterable(
        event.diaryDays,
        key: (FoodDiaryDay day) => day.date,
        value: (FoodDiaryDay day) => day
      );

      FoodDiaryLoaded((b) => b
        ..currentDate = currentDate
        ..diaryDays = diaryDaysBuilder
        ..diets = event.diets.toBuilder()
      );

      LoggingBloc().info("${diaryDaysBuilder.length} food diary days loaded");
    }

//    if (event is AddFoodRecords) {
//      assert(currentState is FoodDiaryLoaded);
//      if (currentState is FoodDiaryLoaded) {
//        try {
//          for (FoodRecord foodRecord in event.foodRecords) {
//            diaryRepository.addFoodRecord(userId, daysSinceEpoch, foodRecord);
//          }
//          event.completer?.complete();  // TOTEST
//
//          logger.i("${event.foodRecords.length} food records added");
//        } on Exception catch(e) {
//          event.completer?.completeError(e);  // TOTEST
//        }
//      }
//    }
//
//    if (event is DeleteFoodRecords) {
//      assert(currentState is FoodDiaryLoaded);
//      if (currentState is FoodDiaryLoaded) {
//        try {
//          for (FoodRecord foodRecord in event.foodRecords) {
//            diaryRepository.deleteFoodRecord(userId, daysSinceEpoch, foodRecord);
//          }
//          event.completer?.complete();  // TOTEST
//
//          logger.i("${event.foodRecords.length} food records deleted");
//        } on Exception catch(e) {
//          event.completer?.completeError(e);  // TOTEST
//        }
//      }
//    }
//
//    if (event is ReplaceFoodRecord) {
//      assert(currentState is FoodDiaryLoaded);
//
//      if (currentState is FoodDiaryLoaded && event.oldRecord != event.newRecord) {
//        var state = currentState as FoodDiaryLoaded;
//
////        try {
////          // Skip next data arrival. TODOCUMENT
////          logger.i("ADDING SKIPPED ARRIVED (going to be ${state.skipNextNArrivals + 1})");
////          yield state.rebuild((b) => b
////            ..skipNextNArrivals = state.skipNextNArrivals + 1
////          );
////
////          diaryRepository.replaceFoodRecord(userId, daysSinceEpoch, event.oldRecord, event.newRecord);
////
////          event.completer?.complete();
////
////          logger.i("${event.oldRecord} changed to ${event.newRecord}");
////        } on Exception catch(e) {
////          event.completer?.completeError(e);
////        }
//      }
//    }
  }
}

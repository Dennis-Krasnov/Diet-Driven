import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/models.dart';

/// Aggregates and manages user's food diary days and diets.
/// Diary tab shows skeleton records until [ConfigurationBloc] is loaded.
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final DiaryRepository diaryRepository;

  final String userId;

  /// Fixed point to distinguish 'ongoing' and 'historical' food diary subscriptions.
  /// [today] stays constant regardless of real-world time.
  final int today = currentDaysSinceEpoch();

  StreamSubscription<FoodDiaryEvent> _foodDiaryEventSubscription;

  FoodDiaryBloc({@required this.diaryRepository, @required this.userId})
    : assert(diaryRepository != null), assert(userId != null && userId.isNotEmpty);

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  void dispose() {
    _foodDiaryEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is InitFoodDiary) {
      assert(currentState is FoodDiaryUninitialized);

      _foodDiaryEventSubscription ??= Observable<FoodDiaryEvent>(CombineLatestStream.combine2(
        Observable<BuiltList<FoodDiaryDay>>(diaryRepository.allTimeFoodDiary$(userId)),
        Observable<BuiltList<Diet>>(diaryRepository.allTimeDiet$(userId)),
        (BuiltList<FoodDiaryDay> diaryDays, BuiltList<Diet> diets) => RemoteFoodDiaryArrived((b) => b
          ..diaryDays = diaryDays.toBuilder()
          ..diets = diets.toBuilder()
        )
      ))
      .distinct()
      // Unrecoverable failure
      .onErrorReturnWith((dynamic error) => FoodDiaryError((b) => b..error = error))
      .listen(dispatch);
    }

    if (event is RemoteFoodDiaryArrived) {
      var currentDate = currentDaysSinceEpoch();
      final diaryDaysBuilder = MapBuilder<int, FoodDiaryDay>();

      // Load previous state
      if (currentState is FoodDiaryLoaded) {
        currentDate = (currentState as FoodDiaryLoaded).currentDate;
        diaryDaysBuilder.replace((currentState as FoodDiaryLoaded).diaryDays);
      }

      // Combine with new food diary days (overrides)
      diaryDaysBuilder.addIterable(
        event.diaryDays,
        key: (FoodDiaryDay day) => day.date,
        value: (FoodDiaryDay day) => day
      );

      yield FoodDiaryLoaded((b) => b
        ..currentDate = currentDate
        ..diaryDays = diaryDaysBuilder
        ..diets = event.diets.toBuilder()
      );

      LoggingBloc().info("Food diary loaded with ${diaryDaysBuilder.length} days");
    }

    if (event is FoodDiaryError) {
      yield FoodDiaryFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      LoggingBloc().unexpectedError("Food diary failed", event.error, event.stacktrace);
    }

    if (event is AddFoodRecords) {
      assert(currentState is FoodDiaryLoaded);
      assert(event.foodRecords.isNotEmpty);

      if (currentState is FoodDiaryLoaded && event.foodRecords.isNotEmpty) {
        final state = currentState as FoodDiaryLoaded;

        // OPTIMIZE: here or in each food diary day bloc? (instead use foodDiaryBloc.dispatch())
        try {
          // Build default day
          FoodDiaryDayBuilder diaryDayBuilder;
          diaryDayBuilder.date = event.date;

          // Override with existing day
          if (state.diaryDays.containsKey(event.date)) {
            diaryDayBuilder.replace(state.diaryDays[event.date]);
          }

          // Add food records to respective mealIndex
          diaryDayBuilder.mealRecords[event.mealIndex].addAll(event.foodRecords);

          diaryRepository.replaceFoodDiaryDay(userId, diaryDayBuilder.build());

          event?.completer?.complete();
          LoggingBloc().info("Added ${event.foodRecords.length} foods to ${event.date}");
        } on Exception catch(error, stacktrace) {
          event?.completer?.completeError(error, stacktrace);
          LoggingBloc().unexpectedError("Adding ${event.foodRecords.length} foods to ${event.date} failed", error, stacktrace);
        }
      }
    }

    // TODO: diets.where(diet.date <= today).min(diet.date) - or firstWhere less and assume its sorted (more efficient)
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

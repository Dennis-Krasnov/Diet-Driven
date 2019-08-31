/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Aggregates and manages user's food diary days and diets.
/// Diary tab shows skeleton app bar until [FoodDiaryBloc] is loaded.
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final DiaryRepository diaryRepository;

  /// Authenticated user's id.
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
      if (currentState is! FoodDiaryUninitialized) {
        dispatch(FoodDiaryError((b) => b..error = StateError("Food diary bloc must be uninitialized")));
        return;
      }

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
      /// Initializes default DiaryDayBloc currentDate as today.
      var currentDate = currentDaysSinceEpoch();
      final diaryDaysBuilder = MapBuilder<int, FoodDiaryDay>();

      // Load previous state
      if (currentState is FoodDiaryLoaded) {
        currentDate = (currentState as FoodDiaryLoaded).currentDate;
        diaryDaysBuilder.replace((currentState as FoodDiaryLoaded).diaryDays); // OPTIMIZE?: when last food record deletes, cloud function deletes day but this still shows... is this ok?
      }

      // Override with new food diary days
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

    if (event is UpdateCurrentDate) {
      if (currentState is! FoodDiaryLoaded) {
        dispatch(FoodDiaryError((b) => b..error = StateError("Food diary bloc must be loaded")));
        return;
      }

      yield (currentState as FoodDiaryLoaded).rebuild((b) => b
        ..currentDate = event.currentDate
      );
    }

    if (event is GlobalAddFoodRecords) {
      if (currentState is! FoodDiaryLoaded) {
        dispatch(FoodDiaryError((b) => b..error = StateError("Food diary bloc must be loaded")));
        return;
      }

      try {
        // Builder for default day
        // Only needed when adding to day without existing FoodDiaryDay object
        final diaryDayBuilder = FoodDiaryDayBuilder()
          ..date = event.date
          // Create correct number of empty meals according to diet for that day
          ..meals = BuiltList(List<MealData>.generate(
            (currentState as FoodDiaryLoaded).dietForDate(event.date).meals.length,
            (i) => MealData((b) => b
              ..foodRecords = ListBuilder()
            )
          ));

        // Override default day with existing day if it exists
        final existingDiaryDay = (currentState as FoodDiaryLoaded).diaryDays[event.date];
        if (existingDiaryDay != null) {
          diaryDayBuilder.replace(existingDiaryDay);
        }

        diaryDayBuilder.addFoodRecords(event.mealIndex, event.foodRecords);

        await diaryRepository.saveFoodDiaryDay(userId, diaryDayBuilder.build());

        LoggingBloc().info("Added ${event.foodRecords.length} foods to ${event.date}");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Adding ${event.foodRecords.length} foods to ${event.date} failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
  }

  /// Current diary's recently logged foods.
  /// Only use when it's certain that [currentState] is [FoodDiaryLoaded].
  BuiltList<FoodRecord> get recentFoods {
    final loadedState = currentState as FoodDiaryLoaded;

    return loadedState.diaryDays.keys
      // Don't consider future foods
      .where((date) => date <= loadedState.currentDate)
      .map((date) => loadedState.diaryDays[date].meals.expand((meal) => meal.foodRecords))
      .expand((mealFoods) => mealFoods);;
  }

  /// Current diary's frequently logged foods.
  /// Only use when it's certain that [currentState] is [FoodDiaryLoaded].
  BuiltList<FoodRecord> get frequentFoods => BuiltList(<FoodRecord>[]);
}

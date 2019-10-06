/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary_day/food_diary_day.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

class FoodDiaryDayBloc extends Bloc<FoodDiaryDayEvent, FoodDiaryDayState> {
  /// All food diary days and diets.
  final FoodDiaryBloc foodDiaryBloc;

  final DiaryRepository diaryRepository;

  /// Food diary day's date.
  final int date;

  StreamSubscription<FoodDiaryDayEvent> _foodDiaryDayEventSubscription;

  FoodDiaryDayBloc({@required this.foodDiaryBloc, @required this.diaryRepository, @required this.date})
    : assert(foodDiaryBloc != null), assert(diaryRepository != null), assert(date != null);

  @override
  FoodDiaryDayState get initialState => FoodDiaryDayUninitialized();

  @override
  void dispose() {
    _foodDiaryDayEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryDayState> mapEventToState(FoodDiaryDayEvent event) async* {
    if (event is InitFoodDiaryDay) {
      // Food diary day has no error state
      assert(currentState is FoodDiaryDayUninitialized);

      _foodDiaryDayEventSubscription = Observable<FoodDiaryState>(foodDiaryBloc.state)
        .whereType<FoodDiaryLoaded>()
        .map<FoodDiaryDayEvent>((loadedDiaryState) => IngressFoodDiaryDayArrived((b) => b
          ..foodDiaryDay = loadedDiaryState.diaryDays[date]?.toBuilder()
          ..diet = loadedDiaryState.dietForDate(date).toBuilder()
        ))
        .distinct()
        .listen(dispatch);
    }

    if (event is IngressFoodDiaryDayArrived) {
      yield FoodDiaryDayLoaded((b) => b
        ..foodDiaryDay = event.foodDiaryDay?.toBuilder()
        ..diet = event.diet.toBuilder()
      );

      // TODO: remove slightly differently coloured empty fr states, this would show 0 vs null !!!
      LoggingBloc().info("Food diary day #$date loaded with ${event?.foodDiaryDay?.meals?.expand((meal) => meal.foodRecords)?.length} food records");
    }

    if (event is AddFoodRecords) {
      // Food diary day has no error state
      assert(currentState is FoodDiaryDayLoaded, "Food diary day bloc must be loaded");

      // Reuse FoodDiaryBloc's add food records functionality
      foodDiaryBloc.dispatch(GlobalAddFoodRecords((b) => b
        ..date = date
        ..mealIndex = event.mealIndex
        ..foodRecords = event.foodRecords.toBuilder()
        ..completer = event.completer
      ));
    }

    // TODO: disable these food records from further action; finally block removes them from disabled list
    if (event is ReplaceFoodRecord) {
      // Food diary day has no error state
      assert(currentState is FoodDiaryDayLoaded, "Food diary day bloc must be loaded");

      try {
        final diaryDayBuilder = _foodDiaryDay.toBuilder()
          ..replaceFoodRecord(event.oldRecord, event.newRecord);

        await diaryRepository.saveFoodDiaryDay(foodDiaryBloc.userId, diaryDayBuilder.build());

        LoggingBloc().info("Updated ${event.oldRecord.foodName} on $date");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Updating ${event.oldRecord.foodName} failed on $date", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }

    // TODO: disable these food records from further action; finally block removes them from disabled list
    if (event is DeleteFoodRecords) {
      // Food diary day has no error state
      assert(currentState is FoodDiaryDayLoaded, "Food diary day bloc must be loaded");

      try {
        final diaryDayBuilder = _foodDiaryDay.toBuilder()
          ..deleteFoodRecords(event.foodRecords);

        await diaryRepository.saveFoodDiaryDay(foodDiaryBloc.userId, diaryDayBuilder.build());

        LoggingBloc().info("Deleted ${event.foodRecords.length} foods from $date");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Deleting ${event.foodRecords.length} foods from $date failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
  }

  /// Current food diary day.
  /// Only use when it's certain that [currentState] is [FoodDiaryDayLoaded].
  FoodDiaryDay get _foodDiaryDay => (currentState as FoodDiaryDayLoaded).foodDiaryDay;
}

// TODO: handle selection mode

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

class FoodDiaryDayBloc extends Bloc<FoodDiaryDayEvent, FoodDiaryDayState> {
  /// All food diary days.
  final FoodDiaryBloc foodDiaryBloc;

  /// Food diary day's date.
  final int date;

  StreamSubscription<FoodDiaryDayEvent> _foodDiaryDayEventSubscription;

  FoodDiaryDayBloc({@required this.foodDiaryBloc, @required this.date})
    : assert(foodDiaryBloc != null), assert(date != null);

  @override
  FoodDiaryDayState get initialState => FoodDiaryDayUninitialized(); // TOTEST: ensure initialized when bloc is created

  @override
  void dispose() {
    _foodDiaryDayEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryDayState> mapEventToState(FoodDiaryDayEvent event) async* {
    if (event is InitFoodDiaryDay) {
      assert(currentState is FoodDiaryDayUninitialized);

      _foodDiaryDayEventSubscription = Observable<FoodDiaryState>(foodDiaryBloc.state)
        .ofType(const TypeToken<FoodDiaryLoaded>())
        .map<FoodDiaryDayEvent>((loadedDiaryState) => RemoteFoodDiaryDayArrived((b) => b
          ..foodDiaryDay = loadedDiaryState.diaryDays[date]?.toBuilder()
          ..diet = loadedDiaryState.dietForDate(date).toBuilder()
        ))
        .listen(dispatch);
    }

    if (event is RemoteFoodDiaryDayArrived) {
      yield FoodDiaryDayLoaded((b) => b
        ..foodDiaryDay = event.foodDiaryDay?.toBuilder()
        ..diet = event.diet.toBuilder()
      );
    }

    // TODO: move this back to food diary bloc
    if (event is AddFoodRecords) {
      if (currentState is! FoodDiaryDayLoaded) {
        throw StateError("Food diary day bloc must be loaded");
      }

      // FIXME: don't throw here, FoodDiaryDay already throws this!
      if (event.foodRecords.isEmpty) {
        throw ArgumentError("Food records must be non-empty");
      }

      try {
        final loadedState = currentState as FoodDiaryDayLoaded;

        // Build default day
        final diaryDayBuilder = FoodDiaryDayBuilder();
        diaryDayBuilder.date = date;
//        diaryDayBuilder.meals = loadedState.diet.meals; FIXME: (make foodRecords empty array nullable!!!) TOTEST
//        diaryDayBuilder.meals TODO: make correct number of meals!!!!

        // Override with existing day
        if (loadedState.foodDiaryDay != null) {
          diaryDayBuilder.replace(loadedState.foodDiaryDay);
        }

        diaryDayBuilder.addFoodRecords(event.mealIndex, event.foodRecords);
        foodDiaryBloc.diaryRepository.saveFoodDiaryDay(foodDiaryBloc.userId, diaryDayBuilder.build());
        LoggingBloc().info("Added ${event.foodRecords.length} foods to $date");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Adding ${event.foodRecords.length} foods to $date failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }

    if (event is ReplaceFoodRecord) {
      if (currentState is! FoodDiaryDayLoaded) {
        throw StateError("Food diary day bloc must be loaded");
      }

      try {
        final loadedState = currentState as FoodDiaryDayLoaded;

        final diaryDayBuilder = loadedState.foodDiaryDay.toBuilder();
        diaryDayBuilder.replaceFoodRecord(event.oldRecord, event.newRecord);
        print(loadedState.foodDiaryDay == diaryDayBuilder.build());
        foodDiaryBloc.diaryRepository.saveFoodDiaryDay(foodDiaryBloc.userId, diaryDayBuilder.build());

        LoggingBloc().info("Updated ${event.oldRecord.foodName} on $date");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Updating ${event.oldRecord.foodName} failed on $date", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }

    if (event is DeleteFoodRecords) {
      if (currentState is! FoodDiaryDayLoaded) {
        throw StateError("Food diary day bloc must be loaded");
      }

      // FIXME: don't throw here, FoodDiaryDay already throws this!
      if (event.foodRecords.isEmpty) {
        throw ArgumentError("Food records must be non-empty");
      }

      try {
        final loadedState = currentState as FoodDiaryDayLoaded;

        // TODO space out code like this!
        final diaryDayBuilder = loadedState.foodDiaryDay.toBuilder();
        diaryDayBuilder.deleteFoodRecords(event.foodRecords);
        foodDiaryBloc.diaryRepository.saveFoodDiaryDay(foodDiaryBloc.userId, diaryDayBuilder.build());

        LoggingBloc().info("Deleted ${event.foodRecords.length} foods from $date");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        LoggingBloc().unexpectedError("Deleting ${event.foodRecords.length} foods from $date failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
  }
}

// TODO: handle selection mode

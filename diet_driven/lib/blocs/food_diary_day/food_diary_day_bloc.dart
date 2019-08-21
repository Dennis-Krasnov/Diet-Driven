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
        .where((loadedDiary) => loadedDiary.diaryDays.containsKey(date))
        .map<FoodDiaryDayEvent>((loadedDiaryState) => RemoteFoodDiaryDayArrived((b) => b
          ..foodDiaryDay = loadedDiaryState.diaryDays[date].toBuilder()
          ..diet = loadedDiaryState.diets.firstWhere((diet) => diet.startDate >= date).toBuilder()
        ))
        .listen(dispatch);
    }

    if (event is RemoteFoodDiaryDayArrived) {
      yield FoodDiaryDayLoaded((b) => b
        ..foodDiaryDay = event.foodDiaryDay.toBuilder()
        ..diet = event.diet.toBuilder()
      );
    }

    if (event is AddFoodRecords) {
      if (currentState is! FoodDiaryDayLoaded) {
        throw StateError("Food diary day bloc must be loaded");
      }

      if (event.foodRecords.isEmpty) {
        throw ArgumentError("Food records must be non-empty");
      }

      try {
        final loadedState = currentState as FoodDiaryDayLoaded;

        // Build default day
        FoodDiaryDayBuilder diaryDayBuilder;
        diaryDayBuilder.date = date;

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
  }
}

// TODO: handle selection mode

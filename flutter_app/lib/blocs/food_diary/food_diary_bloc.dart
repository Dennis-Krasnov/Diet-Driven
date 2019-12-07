/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Aggregates and manages user's food diary days and diets.
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final DiaryRepository diaryRepository;

  /// Mutable authenticated user's id.
  String _userId;
  String get userId => _userId;

  /// Optional parameter to view historical data from single day.
  final int date;

  /// Whether diary loads single diary day instead of 30 days ago and onwards.
  bool get historical => date != null;

  FoodDiaryLoaded get loadedState => state as FoodDiaryLoaded;

  StreamSubscription<FoodDiaryEvent> _foodDiaryEventSubscription;

  FoodDiaryBloc({@required this.diaryRepository, this.date}) :
    assert(diaryRepository != null),
    assert(date == null || date >= 0);

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  Future<void> close() {
    _foodDiaryEventSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is InitFoodDiary) {
      _userId = event.userId;

      // Common interface for both the ongoing and historical versions of food diary bloc
      Observable<BuiltList<FoodDiaryDay>> diaryDays$;

      // Whether food diary day document(s) exist for the given time period
      bool diaryDaysExist;

      if (historical) {
        // Historical mode subscribes to single food diary day
        diaryDays$ = Observable<FoodDiaryDay>(diaryRepository.foodDiaryDay$(userId, date))
          .map((day) => BuiltList(<FoodDiaryDay>[day]));

        diaryDaysExist = await diaryRepository.foodDiaryDayExists(userId, date);
      }
      else {
        // Ongoing subscription for 30 days ago and onward
        final startDate = DateTime.now().asInt - 30;
        diaryDays$ = Observable<BuiltList<FoodDiaryDay>>(diaryRepository.allTimeFoodDiary$(userId, startAt: startDate));

        diaryDaysExist = await diaryRepository.allTimeFoodDiaryExists(userId, startAt: startDate);
      }

      // Start with nothing if no days were found in time period
      if (!diaryDaysExist) {
        diaryDays$ = diaryDays$.startWith(BuiltList());
      }

      // Maintain single instance of stream subscription
      await _foodDiaryEventSubscription?.cancel();
      _foodDiaryEventSubscription = Observable<FoodDiaryEvent>(CombineLatestStream.combine2(
        diaryDays$,
        diaryRepository.allTimeDiet$(userId),
        (BuiltList<FoodDiaryDay> diaryDays, BuiltList<Diet> diets) => IngressFoodDiaryArrived((b) => b
          ..diaryDays = diaryDays.toBuilder()
          ..diets = diets.toBuilder()
        )
      ))
      // Unrecoverable failure
      .onErrorReturnWith((error) => FoodDiaryError((b) => b..error = error))
      .distinct()
      .listen(add);
    }

    if (event is IngressFoodDiaryArrived) {
      final dateDiaryDays = MapBuilder<int, FoodDiaryDay>(Map<int, FoodDiaryDay>.fromIterable(
        event.diaryDays,
        key: (day) => day.date,
        value: (day) => day,
      ));

      yield FoodDiaryLoaded((b) => b
        ..diaryDays = dateDiaryDays
        ..diets = event.diets.toBuilder()
      );

      BlocLogger().info("${historical ? "Historical ($date) " : ""}Food diary loaded with ${event.diaryDays.length} days");
    }

    if (event is FoodDiaryError) {
      yield FoodDiaryFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      BlocLogger().unexpectedError("Food diary failed", event.error, event.stacktrace);
    }

    if (event is GlobalAddFoodRecords) {
      if (state is! FoodDiaryLoaded) {
        add(FoodDiaryError((b) => b..error = StateError("Food diary bloc must be loaded")));
        return;
      }

      try {
        // Builder for default day
        // Only needed when adding to day without existing FoodDiaryDay object
        final diaryDayBuilder = FoodDiaryDayBuilder()
          ..date = event.date
          // Create correct number of empty meals according to diet for that day
          ..meals = BuiltList(List<MealData>.generate(
            loadedState.dietForDate(event.date).meals.length,
            (i) => MealData((b) => b
              ..foodRecords = ListBuilder()
            )
          ));

        // Override default day with existing day if it exists
        final existingDiaryDay = loadedState.diaryDays[event.date];
        if (existingDiaryDay != null) {
          diaryDayBuilder.replace(existingDiaryDay);
        }

        diaryDayBuilder.addFoodRecords(event.mealIndex, event.foodRecords);

        await diaryRepository.saveFoodDiaryDay(userId, diaryDayBuilder.build());

        BlocLogger().info("Added ${event.foodRecords.length} foods to ${event.date}");
        event?.completer?.complete();
      } catch(error, stacktrace) {
        BlocLogger().unexpectedError("Adding ${event.foodRecords.length} foods to ${event.date} failed", error, stacktrace);
        event?.completer?.completeError(error, stacktrace);
      }
    }
    // TODO: copy event copies onto self, instead of copying into another bloc
  }
}

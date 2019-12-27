/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/blocs/food_diary_day/food_diary_day.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Manages single diary day and its diet.
class FoodDiaryDayBloc extends Bloc<FoodDiaryDayEvent, FoodDiaryDayState> {
  /// All food diary days and diets.
  final FoodDiaryBloc foodDiaryBloc;

  final DiaryRepository diaryRepository;

  /// Food diary day's date.
  final int date;

  FoodDiaryDayLoaded get loadedState => state as FoodDiaryDayLoaded;

  StreamSubscription<FoodDiaryDayEvent> _foodDiaryDayEventSubscription;

  FoodDiaryDayBloc({@required this.foodDiaryBloc, @required this.diaryRepository, @required this.date})
    : assert(foodDiaryBloc != null), assert(diaryRepository != null), assert(date != null);

  @override
  FoodDiaryDayState get initialState => FoodDiaryDayUninitialized();

  @override
  Future<void> close() {
    _foodDiaryDayEventSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<FoodDiaryDayState> mapEventToState(FoodDiaryDayEvent event) async* {
    if (event is InitFoodDiaryDay) {
      // Maintain single instance of stream subscription
      await _foodDiaryDayEventSubscription?.cancel();
      _foodDiaryDayEventSubscription = Observable<FoodDiaryState>(foodDiaryBloc)
        .whereType<FoodDiaryLoaded>()
        .map<FoodDiaryDayEvent>((loadedDiaryState) => IngressFoodDiaryDayArrived((b) => b
          ..foodDiaryDay = loadedDiaryState.diaryDays[date]?.toBuilder()
          ..diet = loadedDiaryState.dietForDate(date).toBuilder()
        ))
        .distinct()
        .listen(add);
    }

    if (event is IngressFoodDiaryDayArrived) {
      yield FoodDiaryDayLoaded((b) => b
        ..foodDiaryDay = event.foodDiaryDay?.toBuilder()
        ..diet = event.diet.toBuilder()
      );

      BlocLogger().info("Food diary day #$date loaded with ${event?.foodDiaryDay?.meals?.expand((meal) => meal.foodRecords)?.length} food records");
    }

    if (event is AddFoodRecords) {
      // Food diary day has no error state
      assert(state is FoodDiaryDayLoaded, "Food diary day bloc must be loaded");

      // Reuse FoodDiaryBloc's add food records functionality
      foodDiaryBloc.add(GlobalAddFoodRecords((b) => b
        ..date = date
        ..mealIndex = event.mealIndex
        ..foodRecords = event.foodRecords.toBuilder()
        ..completer = event.completer
      ));
    }

    if (event is ReplaceFoodRecord) {
      yield* _saveFoodDiaryDay(
        event,
        (day) => day.replaceFoodRecord(event.foodRecord),
        toDisable: BuiltList<String>([event.foodRecord.uid]),
      );
    }

    if (event is DeleteFoodRecords) {
      yield* _saveFoodDiaryDay(
        event,
        (day) => day.deleteFoodRecords(event.foodRecordUids),
        toDisable: event.foodRecordUids,
      );
    }
  }

  // TODO: test this method like in user data bloc (once)
  // TODO: add(event), simply verify(repo.save(any)).called(1); (do same thing for every user data event)
  /// ...
  Stream<FoodDiaryDayState> _saveFoodDiaryDay(Completable event, void Function(FoodDiaryDayBuilder) updates, {BuiltList<String> toDisable}) async* {
    assert(event is FoodDiaryDayEvent);

    // Food diary day has no error state
    assert(state is FoodDiaryDayLoaded, "Food diary day bloc must be loaded");

    try {
      if (toDisable?.isNotEmpty ?? false) {
        assert(toDisable.every((uid) => !loadedState.dirtyFoodRecordUids.any((dirtyFoodRecordUid) => dirtyFoodRecordUid == uid)));

        // Add to set of out of sync food records
        yield loadedState.rebuild((b) => b
          ..dirtyFoodRecordUids = loadedState.dirtyFoodRecordUids.union(toDisable.toBuiltSet()).toBuilder()
        );
      }

      await diaryRepository.saveFoodDiaryDay(foodDiaryBloc.userId, loadedState.foodDiaryDay.rebuild(updates));

      BlocLogger().info("${event.runtimeType} succeeded");
      event.completer?.complete();
    } catch(error, stacktrace) {
      if (toDisable?.isNotEmpty ?? false) {
        // Roll back food records to original state
        yield loadedState;
      }

      BlocLogger().unexpectedError("${event.runtimeType} failed", error, stacktrace);
      event.completer?.completeError(error, stacktrace);
    }
  }
}
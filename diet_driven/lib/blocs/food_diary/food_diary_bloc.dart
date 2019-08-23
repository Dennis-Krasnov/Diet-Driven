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
//      .onFirst ... GO TO TODAY'S PAGE
//      .doOnListen(() => FIXME: doesn't fix
//          dispatch(UpdateCurrentDate((b) => b // FIXME: food diary bloc must be loaded
//            ..currentDate = currentDaysSinceEpoch()
//          ))
//      )
      .listen(dispatch);

      // solution: make stream = ...; stream.first.mapTo(UpdateCurrentDate).then(dispatch); but also sub = stream.listen
      // see user data bloc on how to separate streams!

      // Go to today's food diary day if food diary bloc hasn't yet been initialized
//      _foodDiaryEventSubscription.
//      dispatch(UpdateCurrentDate((b) => b // FIXME: food diary bloc must be loaded
//        ..currentDate = currentDaysSinceEpoch()
//      ))

    }

    if (event is RemoteFoodDiaryArrived) {
      /// Initializes default DiaryDayBloc currentDate as today. FIXME: should go to today on a new day
      var currentDate = currentDaysSinceEpoch(); // TOTEST as 0
      final diaryDaysBuilder = MapBuilder<int, FoodDiaryDay>();

      // Load previous state
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

      yield FoodDiaryLoaded((b) => b
        ..currentDate = currentDate
        ..diaryDays = diaryDaysBuilder
        ..diets = event.diets.toBuilder()
      );

      LoggingBloc().info("Food diary loaded with ${diaryDaysBuilder.length} days");
    }

    if (event is UpdateCurrentDate) {
      if (currentState is! FoodDiaryLoaded) {
        throw StateError("Food diary bloc must be loaded");
      }

      yield (currentState as FoodDiaryLoaded).rebuild((b) => b
        ..currentDate = event.currentDate
      );
    }

    if (event is FoodDiaryError) {
      yield FoodDiaryFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      LoggingBloc().unexpectedError("Food diary failed", event.error, event.stacktrace);
    }
  }
}

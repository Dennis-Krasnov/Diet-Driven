import 'dart:async';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/log_printer.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Manages a particular food diary day for a particular user.
/// [FoodDiaryBloc] shows skeleton meals and food records until loaded.
/// update skips...
/// TODO: rename all `edit` to `update` and `add` to `insert`
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final logger = getLogger("food diary bloc");
  final DiaryRepository diaryRepository;
  final String userId;
  final int daysSinceEpoch;

  StreamSubscription<FoodDiaryEvent> _foodDiaryEventSubscription;

  FoodDiaryBloc({@required this.diaryRepository, @required this.userId, @required this.daysSinceEpoch}) {
    assert(diaryRepository != null);
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);


    final _foodDiaryEvent$ = Observable<FoodDiaryEvent>(CombineLatestStream.combine2(
      diaryRepository.streamDiaryDay(userId, daysSinceEpoch),
      Observable<Diet>.just(Diet((b) => b..calories = 2520)), // TODO: call repo with daysSinceEpoch
      (FoodDiaryDay foodDiaryDay, Diet diet) => RemoteDiaryDayArrived((b) => b
        ..foodDiaryDay = foodDiaryDay.toBuilder()
        ..diet = diet.toBuilder()
      ),
    ));

    _foodDiaryEventSubscription = _foodDiaryEvent$.listen(
      (foodDiaryEvent) => dispatch(foodDiaryEvent),
      onError: (Object error, Object trace) => dispatch(FoodDiaryError((b) => b
        ..error = error.toString()
        ..trace = trace.toString()
      )),
    );
  }
//    Observable<FoodDiaryDay> _foodDiaryDayStream = diaryRepository.streamDiaryDay(userId, daysSinceEpoch);//.doOnData((data) => print(" DATA: $data"));
//
//    // TODO: diet! -> merge together into event stream -> listen(dispatch)
//
//    _foodDiaryDaySubscription = _foodDiaryDayStream.listen((foodDiaryDay) =>
//      // TODO: call repository for this day's diet (returns as Observable.just() if historical or live stream if today)
//      // hardcode it for now! // TOTEST see user data tests
//      dispatch(RemoteDiaryDayArrived((b) => b..foodDiaryDay = foodDiaryDay.toBuilder())),
//      onError: (Error error, StackTrace trace) => dispatch(FoodDiaryError((b) => b..error = error.toString())),
//        // TODO .switchIfEmpty(fallbackStream) for caching and loading historical configs
//    );
//  }

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  void dispose() {
    _foodDiaryEventSubscription?.cancel();
    logger.i("$daysSinceEpoch disposed!");
    super.dispose();
  }


  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is RemoteDiaryDayArrived) {
      yield FoodDiaryLoaded((b) => b
        ..foodDiaryDay = event.foodDiaryDay.toBuilder()
        ..diet = event.diet.toBuilder()
      );

      logger.i("food diary day #${event.foodDiaryDay.date} loaded");
    }

    if (event is AddFoodRecords) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
        try {
          for (FoodRecord foodRecord in event.foodRecords) {
            diaryRepository.addFoodRecord(userId, daysSinceEpoch, foodRecord);
          }
          event.completer?.complete();  // TOTEST

          logger.i("${event.foodRecords.length} food records added");
        } on Exception catch(e) {
          event.completer?.completeError(e);  // TOTEST
        }
      }
    }

    if (event is DeleteFoodRecords) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
        try {
          for (FoodRecord foodRecord in event.foodRecords) {
            diaryRepository.deleteFoodRecord(userId, daysSinceEpoch, foodRecord);
          }
          event.completer?.complete();  // TOTEST

          logger.i("${event.foodRecords.length} food records deleted");
        } on Exception catch(e) {
          event.completer?.completeError(e);  // TOTEST
        }
      }
    }

    if (event is ReplaceFoodRecord) {
      assert(currentState is FoodDiaryLoaded);

      if (currentState is FoodDiaryLoaded && event.oldRecord != event.newRecord) {
        var state = currentState as FoodDiaryLoaded;

//        try {
//          // Skip next data arrival. TODOCUMENT
//          logger.i("ADDING SKIPPED ARRIVED (going to be ${state.skipNextNArrivals + 1})");
//          yield state.rebuild((b) => b
//            ..skipNextNArrivals = state.skipNextNArrivals + 1
//          );
//
//          diaryRepository.replaceFoodRecord(userId, daysSinceEpoch, event.oldRecord, event.newRecord);
//
//          event.completer?.complete();
//
//          logger.i("${event.oldRecord} changed to ${event.newRecord}");
//        } on Exception catch(e) {
//          event.completer?.completeError(e);
//        }
      }
    }
  }
}

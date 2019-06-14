import 'dart:async';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
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
  final Logger _log = new Logger("food diary bloc");
  final DiaryRepository diaryRepository;
  final String userId;
  final int daysSinceEpoch;

  StreamSubscription<FoodDiaryEvent> _foodDiaryDaySubscription;

  FoodDiaryBloc({@required this.diaryRepository, @required this.userId, @required this.daysSinceEpoch}) {
    assert(diaryRepository != null);
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    final Observable<FoodDiaryEvent> _foodDiaryDayStream = diaryRepository.streamDiaryDay(userId, daysSinceEpoch)
      .switchMap<FoodDiaryEvent>((foodDiaryDay) =>
        Observable<Diet>.just(Diet((b) => b..calories = 2520)) // TODO: call repo with date field from day
          .map<FoodDiaryEvent>((diet) => RemoteDiaryDayArrived((b) => b
            ..foodDiaryDay = foodDiaryDay.toBuilder()
            ..diet = diet.toBuilder()
          ))
      );

    _foodDiaryDaySubscription = _foodDiaryDayStream.listen(
      (foodDiaryEvent) => dispatch(foodDiaryEvent),
      onError: (Object error, Object trace) => dispatch(FoodDiaryError((b) => b
        ..error = error.toString()
        ..trace = trace.toString()
      )),
    );

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
  }

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  void dispose() {
    _foodDiaryDaySubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryState> transform(Stream<FoodDiaryEvent> events, Stream<FoodDiaryState> Function(FoodDiaryEvent event) next) {
    return super.transform(
      (events as Observable<FoodDiaryEvent>),
//        .debounce(Duration(milliseconds: 500)),
      next,
    );
    // FIXME: use updated transform contract
    // Distinct stream for each event type // TODO: make this a reusable observable transformation
//    Observable<FoodDiaryEvent>(events)
//      .groupBy((event) => event.runtimeType)
//      .flatMap((eventType) {
//        // TODO: stop spamming of expensive actions
////        if (eventType.key is Completable) {
////          return eventType.distinct();
////        }
//        return eventType;
//      });
//    return events;
  }

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is RemoteDiaryDayArrived) {
      if (currentState is FoodDiaryLoaded) {
        var state = currentState as FoodDiaryLoaded;

        // Skip next data arrival if performed a food record edit
        // ...
        if (state.skipNextNArrivals > 0) {
          yield state.rebuild((b) => b
            ..skipNextNArrivals = state.skipNextNArrivals - 1
          );
          _log.info("SKIPPING DATA ARRIVAL");
        }
        // Update food diary day
        else {
          yield state.rebuild((b) => b
            ..foodDiaryDay = event.foodDiaryDay
          );
        }
      }
      else {
        yield FoodDiaryLoaded((b) => b
          ..foodDiaryDay = event.foodDiaryDay
          ..diet = event.diet
        );
      }

      _log.info("food diary day #${event.foodDiaryDay.date} arrived");
    }

    if (event is AddFoodRecords) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
        try {
          for (FoodRecord foodRecord in event.foodRecords) {
            diaryRepository.addFoodRecord(userId, daysSinceEpoch, foodRecord);
          }
          event.completer?.complete();  // TOTEST

          _log.info("${event.foodRecords.length} food records added");
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

          _log.info("${event.foodRecords.length} food records deleted");
        } on Exception catch(e) {
          event.completer?.completeError(e);  // TOTEST
        }
      }
    }

    if (event is ReplaceFoodRecord) {
      assert(currentState is FoodDiaryLoaded);

      if (currentState is FoodDiaryLoaded && event.oldRecord != event.newRecord) {
        var state = currentState as FoodDiaryLoaded;

        try {
          // Skip next data arrival. TODOCUMENT
          _log.info("ADDING SKIPPED ARRIVED (going to be ${state.skipNextNArrivals + 1})");
          yield state.rebuild((b) => b
            ..skipNextNArrivals = state.skipNextNArrivals + 1
          );

          diaryRepository.replaceFoodRecord(userId, daysSinceEpoch, event.oldRecord, event.newRecord);

          event.completer?.complete();

          _log.info("${event.oldRecord} changed to ${event.newRecord}");
        } on Exception catch(e) {
          event.completer?.completeError(e);
        }
      }
    }
  }
}

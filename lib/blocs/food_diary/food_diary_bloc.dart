import 'dart:async';

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
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final Logger _log = new Logger("food diary bloc");
  final DiaryRepository diaryRepository;
  final String userId;
  final int daysSinceEpoch;

  Observable<FoodDiaryDay> _foodDiaryDayStream;
  StreamSubscription<FoodDiaryDay> _foodDiaryDaySubscription;


  FoodDiaryBloc({@required this.diaryRepository, @required this.userId, @required this.daysSinceEpoch}) {
    assert(diaryRepository != null);
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    _foodDiaryDayStream = diaryRepository.streamDiaryDay(userId, daysSinceEpoch).doOnData((data) => print(" DATA: $data"));

    // TODO: diet! -> merge together into event stream -> listen(dispatch)

    _foodDiaryDaySubscription = _foodDiaryDayStream.listen((foodDiaryDay) =>
      // TODO: call repository for this day's diet (returns as Observable.just() if historical or live stream if today)
      // hardcode it for now! // TOTEST see user data tests
      dispatch(RemoteDiaryDayArrived((b) => b..foodDiaryDay = foodDiaryDay.toBuilder())),
      onError: (error, trace) => dispatch(FoodDiaryError((b) => b..error = error.toString())),
    );
  }

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  void dispose() {
    _foodDiaryDaySubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryEvent> transform(Stream<FoodDiaryEvent> events) {
    // Distinct stream for each event type // TODO: make this a reusable observable transformation
    Observable<FoodDiaryEvent>(events)
      .groupBy((event) => event.runtimeType)
      .flatMap((eventType) {
        // TODO: create an 'distinctAction' mixin!! - single if statement! - pass this same type to undo button
        if (eventType.key is AddFoodRecord || eventType.key is DeleteFoodRecord || eventType.key is EditFoodRecord) {
          return eventType.distinct();
        }
        return eventType;
      });
    return events;
  }

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is RemoteDiaryDayArrived) {
      if (currentState is FoodDiaryLoaded) {
        yield (currentState as FoodDiaryLoaded).rebuild((b) => b
          ..foodDiaryDay = event.foodDiaryDay.toBuilder()
        );
      }
      else {
        yield FoodDiaryLoaded((b) => b
          ..foodDiaryDay = event.foodDiaryDay.toBuilder()
        );
      }

      _log.info("food diary day #${event.foodDiaryDay.date} arrived");
    }
    // OPTIMIZE: single try catch around next 3 if statements, if I can make them specific enough as a whole
    // TODO: don't show blocking error page because of a failed food record operation - simply show error message + retry button using completer
    if (event is AddFoodRecord) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
//        try {
        diaryRepository.addFoodRecord(userId, daysSinceEpoch, event.foodRecord);

        _log.info("${event.foodRecord} added");
//        } on Exception catch(e) {
//          yield FoodDiaryFailed((b) => b..error = e.toString());
//        }
      }
    }
    if (event is DeleteFoodRecord) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
        // TODO: use completer to show snack bar upon completion for undo
        try {
          diaryRepository.deleteFoodRecord(userId, daysSinceEpoch, event.foodRecord);
          event.completer?.complete(); // TODO: create uninstantiable built value that events extend

          _log.info("${event.foodRecord} deleted");
        } on Exception catch(e) {
          event.completer?.completeError(e);
        }
      }
    }
    if (event is EditFoodRecord) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
//        try {
          diaryRepository.editFoodRecord(userId, daysSinceEpoch, event.oldRecord, event.newRecord);

          _log.info("${event.oldRecord} changed to ${event.newRecord}");
//        } on Exception catch(e) {
//          yield FoodDiaryFailed((b) => b..error = e.toString());
//        }
      }
    }
  }
}
  // TODO .switchIfEmpty(fallbackStream) for caching and loading historical configs

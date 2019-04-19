import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

// TODO: create foodDiaryDay blocs in UI as needed. pass foodDiaryBloc as argument
class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final Logger _log = new Logger("food diary bloc");
  final DiaryRepository diaryRepository;
//  final UserDataBloc userDataBloc;

  final String userId;
  final int daysSinceEpoch;

  // User-specific stream of data streams of a food diary day
//  Observable<ValueObservable<FoodDiaryDay>> _foodDiaryDayStream;
//  StreamSubscription<ValueObservable<FoodDiaryDay>> _foodDiaryDaySubscription;
  ValueObservable<FoodDiaryDay> _foodDiaryDayStream;
//  StreamSubscription<FoodDiaryDay> _foodDiaryDaySubscription;

  FoodDiaryBloc({@required this.diaryRepository, @required this.userId, @required this.daysSinceEpoch}) {
    assert(diaryRepository != null);
    assert(userId.isNotEmpty);

    try {
      _foodDiaryDayStream = diaryRepository.streamDiaryDay(userId, daysSinceEpoch);

      // FIXME: I don't need a subscription, I just dispatch as loaded!!!
      dispatch(RemoteDiaryDayArrived((b) => b..diaryDayStream = _foodDiaryDayStream));

//      _foodDiaryDaySubscription = _foodDiaryDayStream.listen((diaryDayStream) =>
//        dispatch(RemoteDiaryDayArrived((b) => b..diaryDayStream = diaryDayStream)),
////      onError: (error, trace) => dispatch(FoodDiaryFailed((b) => b..error = error)); // TODO: failed event
//      );

    } on Exception catch (e) {
//      dispatch(Error!!!)
    // TOTEST: diaryRepository.streamDiaryDay(userId, daysSinceEpoch) returns invalid path
      // TODO: similar constructor exception handling in other blocs
    }
  }

  @override
  FoodDiaryState get initialState => FoodDiaryUninitialized();

  @override
  Stream<FoodDiaryEvent> transform(Stream<FoodDiaryEvent> events) {
    Observable<FoodDiaryEvent>(events)
      .groupBy((event) => event.runtimeType)
      .flatMap((eventType) {
        if (eventType.key is SaveFoodDiaryDay) {
          return eventType.distinct();
        }
        return eventType;
      });
    return events;
  }

  @override
  void dispose() {
//    _foodDiaryDaySubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is RemoteDiaryDayArrived) {
      var diaryReadyBuilder = currentState is FoodDiaryReady
        ? (currentState as FoodDiaryReady).toBuilder()
        : FoodDiaryReadyBuilder();

      diaryReadyBuilder.diaryDayStream = event.diaryDayStream;
      yield diaryReadyBuilder.build();

      _log.info("food diary day #${event.diaryDayStream.value.date} arrived");
    }
    if (event is SaveFoodDiaryDay) {
      assert(currentState is FoodDiaryReady);
      if (currentState is FoodDiaryReady) {
        diaryRepository.saveDiaryDay(userId, event.diaryDay);
        // TODO: use completer to show snack bar upon completion

        _log.info("${event.diaryDay.date} day saved");
      }
    }
    if (event is DeleteFoodRecord) {
      assert(currentState is FoodDiaryReady);
      if (currentState is FoodDiaryReady) {
        // TODO: completer (undo), + try/catch
//        diaryRepository.deleteFoodRecord(userId, daysSinceEpoch, event.foodRecord);

        // Doesn't produce duplicates!
//        diaryRepository.addFoodRecord(userId, daysSinceEpoch, event.foodRecord.rebuild((b) => b..foodName = "NEW!!!"));
        diaryRepository.addFoodRecord(userId, daysSinceEpoch, event.foodRecord.rebuild((b) => b
          ..foodName = "NEW!!!"
          ..userData = UserData((b) => b..userId = "person").toBuilder()
        ));

        _log.info("${event.foodRecord} deleted");
      }
    }
  }
}

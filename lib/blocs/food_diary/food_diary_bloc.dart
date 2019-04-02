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

  final FoodRepository foodRepository;
  final UserDataBloc userDataBloc;

  // User-specific stream of data streams of food diary days
  Observable<ValueObservable<BuiltList<FoodDiaryDay>>> _foodDiaryDayStream;
  StreamSubscription<ValueObservable<BuiltList<FoodDiaryDay>>> _foodDiaryDaySubscription;

  FoodDiaryBloc({@required this.foodRepository, @required this.userDataBloc}) {
    assert(foodRepository != null);
    assert(userDataBloc != null);

    _foodDiaryDayStream = Observable<UserDataState>(userDataBloc.state)
      .where((userDataState) => userDataState is UserDataLoaded)
      .map<String>((userDataState) => (userDataState as UserDataLoaded).userData.userId)
      .distinct()
      .switchMap<ValueObservable<BuiltList<FoodDiaryDay>>>((userId) => Observable.just(foodRepository.streamDiary(userId))) // observable.just is a hack? // Combine latest here if needed
      .distinct();

    _foodDiaryDaySubscription = _foodDiaryDayStream.listen((diaryDays) =>
      dispatch(RemoteDiaryArrived((b) => b..diaryDays = diaryDays)),
//      onError: (error, trace) => dispatch(FoodDiaryFailed((b) => b..error = error)); // TODO: failed event
    );
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
    _foodDiaryDaySubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryEvent event) async* {
    if (event is RemoteDiaryArrived) {
      assert(event.diaryDays != null);

      // Updated food diary days
      if (currentState is FoodDiaryReady) {
        yield (currentState as FoodDiaryReady).rebuild((b) => b
          ..diaryDays = event.diaryDays
        );
      }
      // Initial load
      else {
        yield FoodDiaryReady((b) => b
          ..diaryDays = event.diaryDays
          ..currentDate = 0 // FIXME: current days since epoch
        );
      }

      _log.info("${event.diaryDays.length} food diary days arrived");
    }
    if (event is SaveFoodDiaryDay) {
      assert(currentState is FoodDiaryReady);
      if (currentState is FoodDiaryReady) {
        foodRepository.saveDiaryDay(event.userId, event.day);
        // TODO: use completer to show snack bar upon completion

        _log.info("${event.day.date} day saved");
      }
    }
  }
}

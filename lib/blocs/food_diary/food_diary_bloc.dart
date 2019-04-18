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
  Observable<ValueObservable<FoodDiaryDay>> _foodDiaryDayStream;
  StreamSubscription<ValueObservable<FoodDiaryDay>> _foodDiaryDaySubscription;

  FoodDiaryBloc({@required this.diaryRepository, @required this.userId, @required this.daysSinceEpoch}) {
    assert(diaryRepository != null);

    _foodDiaryDayStream = Observable.just(diaryRepository.streamDiaryDay(userId, daysSinceEpoch));
//    _foodDiaryDayStream = Observable<UserDataState>(userDataBloc.state)
//      .where((userDataState) => userDataState is UserDataLoaded)
//      .map<String>((userDataState) => (userDataState as UserDataLoaded).userData.userId)
//      .distinct()
//      // Observable.just to create higher order observable
//      // Combine latest here if needed
//      .switchMap<ValueObservable<FoodDiaryDay>>((userId) => Observable.just(diaryRepository.streamDiaryDay(userId, 0)))
//      .distinct();

    _foodDiaryDaySubscription = _foodDiaryDayStream.listen((diaryDay) =>
      dispatch(RemoteDiaryDayArrived((b) => b..diaryDay = diaryDay)),
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
    if (event is RemoteDiaryDayArrived) {
      var diaryReadyBuilder = currentState is FoodDiaryReady
        ? (currentState as FoodDiaryReady).toBuilder()
        : FoodDiaryReadyBuilder();

      diaryReadyBuilder.diaryDay = event.diaryDay;
      yield diaryReadyBuilder.build();

      _log.info("food diary day #${event.diaryDay.value.date} arrived");
    }
    if (event is SaveFoodDiaryDay) {
      assert(currentState is FoodDiaryReady);
      if (currentState is FoodDiaryReady) {
        diaryRepository.saveDiaryDay(userId, event.diaryDay);
        // TODO: use completer to show snack bar upon completion

        _log.info("${event.diaryDay.date} day saved");
      }
    }
  }
}

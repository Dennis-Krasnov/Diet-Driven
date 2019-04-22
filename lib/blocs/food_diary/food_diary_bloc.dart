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

    _foodDiaryDayStream = diaryRepository.streamDiaryDay(userId, daysSinceEpoch);

    // OPTIMIZE: alternative for food diary and user data combine:
    // combine into a stream of RemoteDiaryDayArrived, listen and dispatch it directly
    // this way don't need to manually combine data, can store UserDocument, Auth, settings separately under Loaded state
    // TODO: change user data bloc as well!!!!!!
    // it becomes clear what's being stored in state!
    // no huge combination data classes, (especially good here where I would need diet - illogical combination)
    // would look like: stream.listen(dispatch) // stream is of type event!!!!

    // user data: separate fields for userDocument, auth (store full auth object), and settings
    // event and loaded state will copy all these over!

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
        if (eventType.key is SaveFoodDiaryDay ||  // TODO: create an 'distinctAction' mixin!! - single if statement! - pass this same type to undo button
          eventType.key is AddFoodRecord || eventType.key is DeleteFoodRecord || eventType.key is EditFoodRecord) {
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

      _log.info("food diary day #${event.foodDiaryDay} arrived");
    }
    if (event is SaveFoodDiaryDay) {
      assert(currentState is FoodDiaryLoaded);
      if (currentState is FoodDiaryLoaded) {
        // FIXME: these events shouldn't fail because of the nature of firestore - only real error is invalid id/date - beyond the scope of this bloc
        //  - for this and other events
//        try {
          diaryRepository.saveDiaryDay(userId, event.diaryDay);

          _log.info("${event.diaryDay.date} day saved");
//        } on Exception catch(e) {
//          yield FoodDiaryFailed((b) => b..error = e.toString());
//        }
      }
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
//        try {
          diaryRepository.addFoodRecord(userId, daysSinceEpoch, event.foodRecord);

          _log.info("${event.foodRecord} deleted");
//        } on Exception catch(e) {
//          yield FoodDiaryFailed((b) => b..error = e.toString());
//        }
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

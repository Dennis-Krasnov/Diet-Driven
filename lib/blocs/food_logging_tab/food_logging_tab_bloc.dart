import 'dart:async';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_logging_tab/food_logging_tab.dart';
import 'package:diet_driven/models/models.dart';

class FoodLoggingTabBloc extends Bloc<FoodLoggingTabEvent, FoodLoggingTabState> {
  final Logger _log = new Logger("food logging tab bloc");
  final LoggingTab loggingTab;
  final Future<BuiltList<FoodRecord>> futureResultRecords;
  final BuiltList<FoodRecord> diaryRecords;
  final FoodLoggingBloc foodLoggingBloc;

  StreamSubscription<BuiltList<FoodRecordResult>> _selectionEventSubscription;

  FoodLoggingTabBloc({
    @required this.loggingTab,
    @required this.futureResultRecords,
    @required this.diaryRecords,
    @required this.foodLoggingBloc
  }) {
    assert(loggingTab != null);
    assert(futureResultRecords != null);
    assert(diaryRecords != null);
    assert(foodLoggingBloc != null);

    Observable<BuiltList<FoodRecordResult>> mergedResultsStream = Observable.combineLatest3<BuiltList<FoodRecord>, BuiltList<FoodRecord>, BuiltList<FoodRecord>, BuiltList<FoodRecordResult>>(
      Observable<FoodLoggingState>(foodLoggingBloc.state).map<BuiltList<FoodRecord>>((state) => state.selectedFoodRecords),
      Observable.just(diaryRecords),
      Observable.fromFuture(futureResultRecords), //.delay(Duration(seconds: 2)), // FIXME
      (selected, diary, results) {
        return BuiltList(results.map<FoodRecordResult>((foodRecord) {
          bool existsInDiary = diaryRecords.any((diaryFoodRecord) => diaryFoodRecord.uuid == foodRecord.uuid);
          bool existsInSelection = selected.any((selectedFoodRecord) => selectedFoodRecord.uuid == foodRecord.uuid);
          assert(!(existsInDiary && existsInSelection), "food record can't exist in both diary and selection");

          // Updating foodRecord as needed to match diary or selection
          FoodRecordBuilder mergedBuilder = foodRecord.toBuilder();

          if (existsInDiary) {
            mergedBuilder.replace(diaryRecords.singleWhere((diaryFoodRecord) => diaryFoodRecord.uuid == foodRecord.uuid));
          }
          else if (existsInSelection) {
            mergedBuilder.replace(selected.singleWhere((selectedFoodRecord) => selectedFoodRecord.uuid == foodRecord.uuid));
          }

          return FoodRecordResult((b) => b
            ..foodRecord = mergedBuilder
            ..resultType = loggingTab
            ..existsInDiary = existsInDiary
            ..existsInSelection = existsInSelection
          );
        }));
      }
    );

    // TODO: change user data to be like this! (instead of a stream of events)
    _selectionEventSubscription = mergedResultsStream.listen(
      (mergedResults) => dispatch(ResultsArrived((b) => b
        ..results = mergedResults.toBuilder()
      )),
      onError: (error, trace) => dispatch(FoodLoggingTabError((b) => b
        ..error = error.toString()
        ..trace = trace.toString()
      )),
    );
  }

  @override
  void dispose() {
    _selectionEventSubscription?.cancel();
    super.dispose();
  }

  @override
  FoodLoggingTabState get initialState => FoodLoggingTabUninitialized();

  @override
  Stream<FoodLoggingTabState> mapEventToState(FoodLoggingTabEvent event) async* {
    if (event is ResultsArrived) {
      yield FoodLoggingTabLoaded((b) => b
        ..results = event.results.toBuilder()
      );

      _log.info("$loggingTab - ${event.results} loaded");
    }

    // TODO: filters similar to filtered todos - do an 'ifEven' filter for testing purposes
  }
}



import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/search/search.dart';
import 'package:rxdart/rxdart.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  final Logger _log = Logger("food record search bloc");
  final FoodLoggingState foodLoggingState;
  final FoodRepository foodRepository;

  FoodSearchBloc({
    @required this.foodLoggingState,
    @required this.foodRepository,
  }) : assert(foodLoggingState != null, foodRepository != null);
  
  @override
  FoodSearchState get initialState => FoodSearchQuery((b) => b
    ..query = ""
    ..suggestions = ListBuilder(<String>[]) // TODO: initial suggestions from repo!
  );

  // Debouncing update query events doesn't bottleneck UI
  @override
  Stream<FoodSearchState> transform(
    Stream<FoodSearchEvent> events,
    Stream<FoodSearchState> Function(FoodSearchEvent event) next,
  ) {
    return super.transform(
      (events as Observable<FoodSearchEvent>)
      .debounceTime(const Duration(milliseconds: 500)), // OPTIMIZE: also affects search event! (put to 5000 to test)
      // FIXME: doesn't work!
//        .groupBy((event) => event.runtimeType)
//        .flatMap((eventType) {
//          print(eventType);
//          print(eventType is UpdateQuery);
//          if (eventType is UpdateQuery) {
//            return eventType.debounce(Duration(milliseconds: 3000));
//          }
//          return eventType;
//        }),
      next,
    );
  }

  @override
  Stream<FoodSearchState> mapEventToState(FoodSearchEvent event) async* {
    if (event is UpdateQuery) {
      _log.info("updated query to ${event.query}, state used to be ${currentState.runtimeType}");

      try {
        final BuiltList<String> suggestions = await foodRepository.foodSuggestions(event.query);
        _log.fine(suggestions);

        yield FoodSearchQuery((b) => b
          ..query = event.query
          ..suggestions = suggestions.toBuilder()
        );
      }
      on CloudFunctionsException catch (error, trace) {
        print('caught firebase functions exception');
        print(error.code);
        print(error.message);
        print(error.details);
        print(trace);

        yield FoodSearchFailed((b) => b
          ..error = error.toString()
          ..trace = trace.toString()
        );
      }
      catch (error, trace) {
        print(error);
        print(trace);

        yield FoodSearchFailed((b) => b
          ..error = error.toString()
          ..trace = trace.toString()
        );
      }
    }

    if (event is SearchFoods) {
      yield FoodSearchLoading();

      try {
        // TODO: memoize results!
        final BuiltList<FoodRecord> results = await foodRepository.searchForFood(event.query);
        _log.fine(results);

        yield FoodSearchLoaded((b) => b
          // TODO: extract to method
          ..results = ListBuilder(results.map<FoodRecordResult>((foodRecord) =>
            FoodRecordResult((b) => b
              ..foodRecord = foodRecord.toBuilder()
              ..resultType = LoggingTab.popular // FIXME: none of the above!
              // FIXME: compare by edamam id!!!
              ..existsInDiary = foodLoggingState.diaryFoodRecords.any((diaryFoodRecord) => diaryFoodRecord.uuid == foodRecord.uuid)
              ..existsInSelection = foodLoggingState.selectedFoodRecords.any((selectedFoodRecord) => selectedFoodRecord.uuid == foodRecord.uuid)
            )
          ))
        );

//        assert(!(existsInDiary && existsInSelection), "food record can't exist in both diary and selection");
        _log.fine("${event.query} was searched!");
      } on DioError catch (error, trace) {
        yield FoodSearchFailed((b) => b
//          ..error = error.toString()
          ..error = _handleError(error)
          ..trace = trace.toString()
        );
      }
    }
  }
}


// TODO: move to bloc helper class
String _handleError(Object error) {
//String _handleError(dynamic error) { // FIXME
  print("error runtype is ${error.runtimeType}"); // FIXME

  String errorDescription = "";
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "??????";
        break;
      case DioErrorType.RESPONSE:
        errorDescription = "Received invalid status code: $error";
        break;
    }
  } else {
    errorDescription = "Unexpected error occured";
  }
  return errorDescription;
}

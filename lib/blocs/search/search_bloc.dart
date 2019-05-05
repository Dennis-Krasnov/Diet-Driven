import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/blocs/search/search.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  final Logger _log = new Logger("food record search bloc");
  final FoodLoggingState foodLoggingState;
  final FoodRepository foodRepository;

  FoodSearchBloc({
    @required this.foodLoggingState,
    @required this.foodRepository,
  }) : assert(foodLoggingState != null, foodRepository != null);
  
  @override
  FoodSearchState get initialState => FoodSearchQuery((b) => b
    ..query = ""
    ..suggestions = ListBuilder([]) // TODO: initial suggestions from repo!
  );

  @override // OPTIMIZE: debounce - doesn't affect UI!!!
  Stream<FoodSearchState> mapEventToState(FoodSearchEvent event) async* {
    if (event is UpdateQuery) {
      _log.info("updated query to ${event.query}, state used to be ${currentState.runtimeType}");

      try {
        BuiltList<String> suggestions = await foodRepository.foodSuggestions(event.query);
        _log.fine(suggestions);

        yield FoodSearchQuery((b) => b
          ..query = event.query
          ..suggestions = suggestions.toBuilder()
        );
      } on DioError catch (error, trace) {
        yield FoodSearchFailed((b) => b
//          ..error = error.toString()
          ..error = _handleError(error)
          ..trace = trace.toString()
        );
      }
    }

    if (event is SearchFoods) {
      yield FoodSearchLoading();

      try {
//        await Future.delayed(Duration(seconds: 2));

        BuiltList<FoodRecord> results = await foodRepository.searchForFood(event.query);
        _log.fine(results);

        yield FoodSearchLoaded((b) => b
          // TODO: extract to method
          ..results = ListBuilder(results.map((foodRecord) =>
            FoodRecordResult((b) => b
              ..foodRecord = foodRecord.toBuilder()
              ..resultType = LoggingTab.popular // FIXME: none of the above!
              ..existsInDiary = false // TODO
              ..existsInSelection = false // TODO
            )
          ))
        );

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
String _handleError(Error error) {
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
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "??????";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
        "Received invalid status code: ${error.response.statusCode}";
        break;
    }
  } else {
    errorDescription = "Unexpected error occured";
  }
  return errorDescription;
}

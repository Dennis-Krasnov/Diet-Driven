import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'search_state.g.dart';

abstract class FoodSearchState {}

///
abstract class FoodSearchQuery with FoodSearchState implements Built<FoodSearchQuery, FoodSearchQueryBuilder> {
  ///
  String get query;

  ///
  BuiltList<String> get suggestions;

  FoodSearchQuery._();
  factory FoodSearchQuery([updates(FoodSearchQueryBuilder b)]) = _$FoodSearchQuery;
}

///
abstract class FoodSearchLoading with FoodSearchState implements Built<FoodSearchLoading, FoodSearchLoadingBuilder> {
  FoodSearchLoading._();
  factory FoodSearchLoading([updates(FoodSearchLoadingBuilder b)]) = _$FoodSearchLoading;
}

///
abstract class FoodSearchFailed with FoodSearchState implements Built<FoodSearchFailed, FoodSearchFailedBuilder> {
  String get error;
  String get trace;

  FoodSearchFailed._();
  factory FoodSearchFailed([updates(FoodSearchFailedBuilder b)]) = _$FoodSearchFailed;
}

///
abstract class FoodSearchLoaded with FoodSearchState implements Built<FoodSearchLoaded, FoodSearchLoadedBuilder> {
  ///
  BuiltList<FoodRecordResult> get results;

  FoodSearchLoaded._();
  factory FoodSearchLoaded([updates(FoodSearchLoadedBuilder b)]) = _$FoodSearchLoaded;
}


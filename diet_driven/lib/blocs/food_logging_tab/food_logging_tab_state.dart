import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_tab_state.g.dart';

abstract class FoodLoggingTabState {}

/// Skeleton food record results.
abstract class FoodLoggingTabUninitialized with FoodLoggingTabState implements Built<FoodLoggingTabUninitialized, FoodLoggingTabUninitializedBuilder> {
  FoodLoggingTabUninitialized._();
  factory FoodLoggingTabUninitialized([void Function(FoodLoggingTabUninitializedBuilder b)]) = _$FoodLoggingTabUninitialized;

  @override String toString() => runtimeType.toString();
}

/// Food record result list.
abstract class FoodLoggingTabLoaded with FoodLoggingTabState implements Built<FoodLoggingTabLoaded, FoodLoggingTabLoadedBuilder> {
  BuiltList<FoodRecordResult> get results;

  FoodLoggingTabLoaded._();
  factory FoodLoggingTabLoaded([void Function(FoodLoggingTabLoadedBuilder b)]) = _$FoodLoggingTabLoaded;
}

/// Error page.
abstract class FoodLoggingTabFailed with FoodLoggingTabState implements Built<FoodLoggingTabFailed, FoodLoggingTabFailedBuilder> {
  FoodLoggingTabFailed._();
  factory FoodLoggingTabFailed([void Function(FoodLoggingTabFailedBuilder b)]) = _$FoodLoggingTabFailed;
}

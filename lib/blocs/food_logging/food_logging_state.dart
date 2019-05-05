import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_state.g.dart';

/// Food logging for both single and multi selection mode.
/// Viewing detailed food record details sets selectedFoodRecords as [selectedFoodRecord].
abstract class FoodLoggingState implements Built<FoodLoggingState, FoodLoggingStateBuilder> {
  ///
  int get mealIndex;

  /// Whether multiple food selection mode is on.
  bool get multiSelect;

  /// Currently selected food records for [multiSelect].
  /// Selected food records are lost when leaving multi-selection mode.
  BuiltList<FoodRecord> get selectedFoodRecords;

  /// Currently logged food records in food diary.
  /// Food records aren't real time and may become outdated.
  BuiltList<FoodRecord> get diaryFoodRecords;

  FoodLoggingState._();
  factory FoodLoggingState([updates(FoodLoggingStateBuilder b)]) = _$FoodLoggingState;
}

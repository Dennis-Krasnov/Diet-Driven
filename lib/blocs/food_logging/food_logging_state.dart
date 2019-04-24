import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_state.g.dart';

/// Food logging for both single and multi selection mode.
/// Viewing detailed food record details sets selectedFoodRecords as [selectedFoodRecord].
abstract class FoodLoggingState implements Built<FoodLoggingState, FoodLoggingStateBuilder> {
  ///
  int get meal;

  /// Currently selected food records.
  /// While in single selection mode, only a single food record may be selected at a time (by viewing food info).
  /// Selected food records are lost when cancelling multi-selection mode.
  BuiltList<FoodRecord> get selectedFoodRecords;

  /// Whether multiple food selection mode is on.
  bool get multiSelect;

  /// Results for each tab are lists instead of streams as it would be odd if results changed while browsing.
  /// Each result is initially null, must separately call `load...` TODOCUMENT

  ///
  @nullable
  BuiltList<FoodRecord> get recentResults;

  ///
  @nullable
  BuiltList<FoodRecord> get popularResults;

  ///
  @nullable
  BuiltList<FoodRecord> get favoriteResults;

  // TODO: others

  FoodLoggingState._();
  factory FoodLoggingState([updates(FoodLoggingStateBuilder b)]) = _$FoodLoggingState;
}

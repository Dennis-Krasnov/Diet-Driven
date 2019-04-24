import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_state.g.dart';

/// Common fields across all selection modes.
abstract class FoodLoggingState {
  int get meal;

  @nullable
  BuiltList<FoodRecord> get recentResults;

  @nullable
  BuiltList<FoodRecord> get popularResults;

  @nullable
  BuiltList<FoodRecord> get favoriteResults;


//  List<FoodRecord> get selectedFoodRecords => [
//    if (state is FoodLoggingSingleSelect)
//      state.selectedFoodRecord,
//    if (state is FoodLoggingMultiSelect)
//      ...state.selectedFoodRecords,
//  ];
  BuiltList<FoodRecord> getSelectedFoodRecords();
  // TODO: others
}

/// Food logging, single-selection mode.
/// Viewing detailed food record details sets it as [selectedFoodRecord].
abstract class FoodLoggingSingleSelect with FoodLoggingState implements Built<FoodLoggingSingleSelect, FoodLoggingSingleSelectBuilder> {
  @nullable
  FoodRecord get selectedFoodRecord;

  BuiltList<FoodRecord> getSelectedFoodRecords() => BuiltList([
    if (selectedFoodRecord != null)
      selectedFoodRecord
  ]);

  FoodLoggingSingleSelect._();
  factory FoodLoggingSingleSelect([updates(FoodLoggingSingleSelectBuilder b)]) = _$FoodLoggingSingleSelect;
}

/// Food logging, multi-selection mode.
abstract class FoodLoggingMultiSelect with FoodLoggingState implements Built<FoodLoggingMultiSelect, FoodLoggingMultiSelectBuilder> {
  BuiltList<FoodRecord> get selectedFoodRecords;

  BuiltList<FoodRecord> getSelectedFoodRecords() => selectedFoodRecords;

  FoodLoggingMultiSelect._();
  factory FoodLoggingMultiSelect([updates(FoodLoggingMultiSelectBuilder b)]) = _$FoodLoggingMultiSelect;
}

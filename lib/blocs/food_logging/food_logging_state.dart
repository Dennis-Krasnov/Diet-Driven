import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_state.g.dart';

///
abstract class FoodLoggingState {
  int get meal;
}

///
abstract class FoodLoggingSingleSelect with FoodLoggingState implements Built<FoodLoggingSingleSelect, FoodLoggingSingleSelectBuilder> {
  @nullable
  FoodRecord get selectedFoodRecord;

  FoodLoggingSingleSelect._();
  factory FoodLoggingSingleSelect([updates(FoodLoggingSingleSelectBuilder b)]) = _$FoodLoggingSingleSelect;
}

///
abstract class FoodLoggingMultiSelect with FoodLoggingState implements Built<FoodLoggingMultiSelect, FoodLoggingMultiSelectBuilder> {
  BuiltList<FoodRecord> get selectedFoodRecords;

  FoodLoggingMultiSelect._();
  factory FoodLoggingMultiSelect([updates(FoodLoggingMultiSelectBuilder b)]) = _$FoodLoggingMultiSelect;
}

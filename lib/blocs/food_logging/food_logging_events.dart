import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_events.g.dart';

abstract class FoodLoggingEvent {}

///
abstract class AddToSelection with FoodLoggingEvent implements Built<AddToSelection, AddToSelectionBuilder> {
  FoodRecord get foodRecord;

  AddToSelection._();
  factory AddToSelection([updates(AddToSelectionBuilder b)]) = _$AddToSelection;
}

///
abstract class RemoveFromSelection with FoodLoggingEvent implements Built<RemoveFromSelection, RemoveFromSelectionBuilder> {
  FoodRecord get foodRecord;

  RemoveFromSelection._();
  factory RemoveFromSelection([updates(RemoveFromSelectionBuilder b)]) = _$RemoveFromSelection;
}

///
abstract class SaveSelection with FoodLoggingEvent implements Built<SaveSelection, SaveSelectionBuilder> {
  SaveSelection._();
  factory SaveSelection([updates(SaveSelectionBuilder b)]) = _$SaveSelection;

  @override String toString() => runtimeType.toString();
}

///
abstract class StartMultiSelect with FoodLoggingEvent implements Built<StartMultiSelect, StartMultiSelectBuilder> {
  StartMultiSelect._();
  factory StartMultiSelect([updates(StartMultiSelectBuilder b)]) = _$StartMultiSelect;

  @override String toString() => runtimeType.toString();
}

///
abstract class CancelMultiSelect with FoodLoggingEvent implements Built<CancelMultiSelect, CancelMultiSelectBuilder> {
  CancelMultiSelect._();
  factory CancelMultiSelect([updates(CancelMultiSelectBuilder b)]) = _$CancelMultiSelect;

  @override String toString() => runtimeType.toString();
}

///
abstract class ChangeMeal with FoodLoggingEvent implements Built<ChangeMeal, ChangeMealBuilder> {
  int get meal;

  ChangeMeal._();
  factory ChangeMeal([updates(ChangeMealBuilder b)]) = _$ChangeMeal;
}

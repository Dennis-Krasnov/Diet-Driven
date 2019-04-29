import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_events.g.dart';

abstract class FoodLoggingEvent {}

/// Changes [mealIndex] the selected food records are logged to.
abstract class ChangeMeal with FoodLoggingEvent implements Built<ChangeMeal, ChangeMealBuilder> {
  int get mealIndex;

  ChangeMeal._();
  factory ChangeMeal([updates(ChangeMealBuilder b)]) = _$ChangeMeal;
}

/// Adds [foodRecord] to current selection.
/// Only available when [multiSelect] is true.
abstract class AddToSelection with FoodLoggingEvent implements Built<AddToSelection, AddToSelectionBuilder> {
  FoodRecord get foodRecord;

  AddToSelection._();
  factory AddToSelection([updates(AddToSelectionBuilder b)]) = _$AddToSelection;
}

/// Removes [foodRecord] from current selection.
/// Cancels multi-select if there are no longer food records in selection after removal.
/// Only available when [multiSelect] is true.
abstract class RemoveFromSelection with FoodLoggingEvent implements Built<RemoveFromSelection, RemoveFromSelectionBuilder> {
  FoodRecord get foodRecord;

  RemoveFromSelection._();
  factory RemoveFromSelection([updates(RemoveFromSelectionBuilder b)]) = _$RemoveFromSelection;
}

/// Enters multi-selection mode.
/// Only available when [multiSelect] is false.
abstract class StartMultiSelect with FoodLoggingEvent implements Built<StartMultiSelect, StartMultiSelectBuilder> {
  StartMultiSelect._();
  factory StartMultiSelect([updates(StartMultiSelectBuilder b)]) = _$StartMultiSelect;

  @override String toString() => runtimeType.toString();
}

/// Exits multi-selection mode, loses all current selected food records.
/// Only available when [multiSelect] is true.
abstract class CancelMultiSelect with FoodLoggingEvent implements Built<CancelMultiSelect, CancelMultiSelectBuilder> {
  CancelMultiSelect._();
  factory CancelMultiSelect([updates(CancelMultiSelectBuilder b)]) = _$CancelMultiSelect;

  @override String toString() => runtimeType.toString();
}

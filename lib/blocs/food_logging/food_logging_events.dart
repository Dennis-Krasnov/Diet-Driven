import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'food_logging_events.g.dart';

abstract class FoodLoggingEvent {}

/// Adds [foodRecord] to current selection.
abstract class AddToSelection with FoodLoggingEvent implements Built<AddToSelection, AddToSelectionBuilder> {
  FoodRecord get foodRecord;

  AddToSelection._();
  factory AddToSelection([updates(AddToSelectionBuilder b)]) = _$AddToSelection;
}

/// Removes [foodRecord] from current selection.
abstract class RemoveFromSelection with FoodLoggingEvent implements Built<RemoveFromSelection, RemoveFromSelectionBuilder> {
  FoodRecord get foodRecord;

  RemoveFromSelection._();
  factory RemoveFromSelection([updates(RemoveFromSelectionBuilder b)]) = _$RemoveFromSelection;
}

/// Logs currently selected food records.
abstract class SaveSelection with Completable, FoodLoggingEvent implements Built<SaveSelection, SaveSelectionBuilder> {
  SaveSelection._();
  factory SaveSelection([updates(SaveSelectionBuilder b)]) = _$SaveSelection;

  @override String toString() => runtimeType.toString();
}

/// Enters multi-selection mode.
abstract class StartMultiSelect with FoodLoggingEvent implements Built<StartMultiSelect, StartMultiSelectBuilder> {
  StartMultiSelect._();
  factory StartMultiSelect([updates(StartMultiSelectBuilder b)]) = _$StartMultiSelect;

  @override String toString() => runtimeType.toString();
}

/// Exits multi-selection mode, loses all current selected food records.
abstract class CancelMultiSelect with FoodLoggingEvent implements Built<CancelMultiSelect, CancelMultiSelectBuilder> {
  CancelMultiSelect._();
  factory CancelMultiSelect([updates(CancelMultiSelectBuilder b)]) = _$CancelMultiSelect;

  @override String toString() => runtimeType.toString();
}

/// Changes meal the selected food records are logged to.
abstract class ChangeMeal with FoodLoggingEvent implements Built<ChangeMeal, ChangeMealBuilder> {
  int get meal;

  ChangeMeal._();
  factory ChangeMeal([updates(ChangeMealBuilder b)]) = _$ChangeMeal;
}

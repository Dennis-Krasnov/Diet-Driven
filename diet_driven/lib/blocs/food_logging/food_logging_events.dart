/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_logging_events.g.dart';

abstract class FoodLoggingEvent {}

/// Changes [mealIndex] the selected food records are logged to.
abstract class ChangeMeal with FoodLoggingEvent implements Built<ChangeMeal, ChangeMealBuilder> {
  factory ChangeMeal([void Function(ChangeMealBuilder b)]) = _$ChangeMeal;
  ChangeMeal._();

  int get mealIndex;
}

/// Adds [foodRecord] to current selection.
/// Only available when [multiSelect] is true.
abstract class AddToSelection with FoodLoggingEvent implements Built<AddToSelection, AddToSelectionBuilder> {
  factory AddToSelection([void Function(AddToSelectionBuilder b)]) = _$AddToSelection;
  AddToSelection._();

  FoodRecord get foodRecord;
}

/// Removes [foodRecord] from current selection.
/// Cancels multi-select if there are no longer food records in selection after removal.
/// Only available when [multiSelect] is true.
abstract class RemoveFromSelection with FoodLoggingEvent implements Built<RemoveFromSelection, RemoveFromSelectionBuilder> {
  factory RemoveFromSelection([void Function(RemoveFromSelectionBuilder b)]) = _$RemoveFromSelection;
  RemoveFromSelection._();

  FoodRecord get foodRecord;
}

/// Updates [oldRecord] to [newRecord] in current selection.
/// Similar to logic in updating food records in Firestore.
/// Replacing a non-existent [oldRecord] has no effect.
/// Adding a duplicate [newRecord] has no effect.
/// Only available when [multiSelect] is true.
abstract class ReplaceSelected with FoodLoggingEvent implements Built<ReplaceSelected, ReplaceSelectedBuilder> {
  factory ReplaceSelected([void Function(ReplaceSelectedBuilder b)]) = _$ReplaceSelected;
  ReplaceSelected._();

  FoodRecord get oldRecord;
  FoodRecord get newRecord;
}

/// Enters multi-selection mode.
/// Only available when [multiSelect] is false.
abstract class StartMultiSelect with FoodLoggingEvent implements Built<StartMultiSelect, StartMultiSelectBuilder> {
  factory StartMultiSelect([void Function(StartMultiSelectBuilder b)]) = _$StartMultiSelect;
  StartMultiSelect._();
}

/// Exits multi-selection mode, loses all current selected food records.
/// Only available when [multiSelect] is true.
abstract class CancelMultiSelect with FoodLoggingEvent implements Built<CancelMultiSelect, CancelMultiSelectBuilder> {
  factory CancelMultiSelect([void Function(CancelMultiSelectBuilder b)]) = _$CancelMultiSelect;
  CancelMultiSelect._();
}

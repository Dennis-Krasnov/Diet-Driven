import 'dart:async';

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';

part 'food_record_edit_events.g.dart';

abstract class FoodRecordEditEvent {}

/// Updates local [FoodRecord]'s [grams].
/// Validates [grams]'s correctness.
abstract class UpdateQuantity with FoodRecordEditEvent implements Built<UpdateQuantity, UpdateQuantityBuilder> {
  num get grams;

  UpdateQuantity._();
  factory UpdateQuantity([void Function(UpdateQuantityBuilder b)]) = _$UpdateQuantity;
}

/// Deletes [FoodRecord] from [FoodDiaryDay].
/// Only available when [deletable] is true.
abstract class DeleteFoodRecord with Completable, FoodRecordEditEvent implements Built<DeleteFoodRecord, DeleteFoodRecordBuilder> {
  DeleteFoodRecord._();
  factory DeleteFoodRecord([void Function(DeleteFoodRecordBuilder b)]) = _$DeleteFoodRecord;
}

/// Saves [FoodRecord] update to [FoodDiaryDay].
/// Only called if [liveEdit] is true. // FIXME: decide whether it uses diary repository or diary update callback
abstract class SaveFoodRecord with FoodRecordEditEvent implements Built<SaveFoodRecord, SaveFoodRecordBuilder> {
  SaveFoodRecord._();
  factory SaveFoodRecord([void Function(SaveFoodRecordBuilder b)]) = _$SaveFoodRecord;
}

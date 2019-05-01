import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_record_edit_state.g.dart';

abstract class FoodRecordEditState implements Built<FoodRecordEditState, FoodRecordEditStateBuilder> {
  FoodRecord get foodRecord;

  @nullable
  String get quantityError;

  FoodRecordEditState._();
  factory FoodRecordEditState([updates(FoodRecordEditStateBuilder b)]) = _$FoodRecordEditState;
}

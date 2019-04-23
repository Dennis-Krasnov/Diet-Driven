import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'food_record_edit_state.g.dart';

//abstract class FoodRecordEditState {}

abstract class FoodRecordEditState implements Built<FoodRecordEditState, FoodRecordEditStateBuilder> {
  FoodRecord get foodRecord;
  // TODO: bool get live; to keep track if already saved or not?!

  FoodRecordEditState._();
  factory FoodRecordEditState([updates(FoodRecordEditStateBuilder b)]) = _$FoodRecordEditState;
}

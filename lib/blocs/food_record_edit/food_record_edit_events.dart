import 'package:built_value/built_value.dart';

part 'food_record_edit_events.g.dart';

abstract class FoodRecordEditEvent {}

abstract class UpdateQuantity with FoodRecordEditEvent implements Built<UpdateQuantity, UpdateQuantityBuilder> {
  num get quantity;

  UpdateQuantity._();
  factory UpdateQuantity([updates(UpdateQuantityBuilder b)]) = _$UpdateQuantity;
}

abstract class SaveFoodRecord with FoodRecordEditEvent implements Built<SaveFoodRecord, SaveFoodRecordBuilder> {
  SaveFoodRecord._();
  factory SaveFoodRecord([updates(SaveFoodRecordBuilder b)]) = _$SaveFoodRecord;

  @override String toString() => runtimeType.toString();
}

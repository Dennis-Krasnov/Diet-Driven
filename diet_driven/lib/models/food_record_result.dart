import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_record_result.g.dart';

/// Wrapper ...
/// [existsInDiary] and [existsInSelection] can't both be true.
abstract class FoodRecordResult implements Built<FoodRecordResult, FoodRecordResultBuilder> {
  ///
  FoodRecord get foodRecord;

  ///
  LoggingTab get resultType; // TODO: store list of where it's appeared? would have to update all results when a new one comes in - recursion?!

  ///
  bool get existsInDiary;

  ///
  bool get existsInSelection;

  FoodRecordResult._();
  factory FoodRecordResult([void Function(FoodRecordResultBuilder b)]) = _$FoodRecordResult;
}

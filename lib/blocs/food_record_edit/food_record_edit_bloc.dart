import 'package:bloc/bloc.dart';
import 'dart:async';

// TODO: change other blocs to only import their own export file
import 'package:diet_driven/blocs/food_record_edit/food_record_edit.dart';
import 'package:diet_driven/models/models.dart';
import 'package:meta/meta.dart';

class FoodRecordEditBloc extends Bloc<FoodRecordEditEvent, FoodRecordEditState> {
  final FoodRecord initialFoodRecord;
  final void Function(FoodRecord) editFoodRecord;

  FoodRecordEditBloc(this.initialFoodRecord, {@required this.editFoodRecord})
    : assert(initialFoodRecord != null), assert(editFoodRecord != null);

  @override
  FoodRecordEditState get initialState => FoodRecordEditState((b) => b..foodRecord = initialFoodRecord.toBuilder());

  @override
  Stream<FoodRecordEditState> mapEventToState(FoodRecordEditEvent event) async* {
    if (event is UpdateQuantity) {
      yield currentState.rebuild((b) => b..
        foodRecord = currentState.foodRecord.rebuild((b) => b
          ..quantity = event.quantity
        ).toBuilder()
      );
    }
    if (event is SaveFoodRecord) {
      //
      if (initialFoodRecord != currentState.foodRecord) {
        print("SAVVEEEE");
        editFoodRecord(currentState.foodRecord); // FIXME: pass DiaryRepository instead?? - more independent...
//        diaryRepository.editFoodRecord(userId, daysSinceEpoch, initialFoodRecord, currentState.foodRecord);
      }
    }
  }
}



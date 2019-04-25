import 'package:bloc/bloc.dart';
import 'dart:async';

// TODO: change other blocs to only import their own export file
import 'package:diet_driven/blocs/food_record_edit/food_record_edit.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:meta/meta.dart';

class FoodRecordEditBloc extends Bloc<FoodRecordEditEvent, FoodRecordEditState> {
  final FoodRecord initialFoodRecord;
  final String userId;
  final int daysSinceEpoch;
//  final DiaryRepository diaryRepository;
  final void Function(FoodRecord) saveAction;


  FoodRecordEditBloc({
    @required this.initialFoodRecord,
    @required this.userId,
    @required this.daysSinceEpoch,
    @required this.saveAction
  }) :
    assert(initialFoodRecord != null),
    assert(userId != null),
    assert(daysSinceEpoch >= 0),
    assert(saveAction != null);

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
      // Can't edit unchanged food record
//      if (initialFoodRecord != currentState.foodRecord) {
//        saveAction(currentState.foodRecord);
//      }
      // OPTIMIZE: I can't check != here since I also use this for single add, could be same if didn't change anything!
      saveAction(currentState.foodRecord);

    }
  }
}



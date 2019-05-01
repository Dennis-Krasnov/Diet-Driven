import 'package:bloc/bloc.dart';
import 'dart:async';

// TODO: change other blocs to only import their own export file
import 'package:diet_driven/blocs/food_record_edit/food_record_edit.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

class FoodRecordEditBloc extends Bloc<FoodRecordEditEvent, FoodRecordEditState> {
  final Logger _log = new Logger("food record edit bloc");
  final FoodRecord initialFoodRecord;
  final String userId;
  final int daysSinceEpoch;
  final DiaryRepository diaryRepository;
  // TODO: final boolean live instead of final void Function(FoodRecord) saveAction;

  FoodRecordEditBloc({
    @required this.initialFoodRecord,
    @required this.userId,
    @required this.daysSinceEpoch,
    @required this.diaryRepository,
  }) :
    assert(initialFoodRecord != null),
    assert(userId != null),
    assert(daysSinceEpoch >= 0),
    assert(diaryRepository != null);

  @override
  FoodRecordEditState get initialState => FoodRecordEditState((b) => b..foodRecord = initialFoodRecord.toBuilder());

  @override
  Stream<FoodRecordEditState> mapEventToState(FoodRecordEditEvent event) async* {
    if (event is UpdateQuantity) {
      // TOTEST
      assert(event.quantity.isFinite);
      assert(event.quantity <= 100000);
      if (event.quantity.isNegative || event.quantity == 0) {
        yield currentState.rebuild((b) => b
          ..quantityError = "Quantity must be positive"
        );
      }
      else {
        yield currentState.rebuild((b) => b..
          foodRecord = currentState.foodRecord.rebuild((b) => b
            ..quantity = event.quantity // TODO: round here instead!? - function in bloc utils
          ).toBuilder()
          ..quantityError = null
        );
        _log.info("Quantity updated to ${event.quantity}");
      }
    }

    if (event is DeleteFoodRecord) {
      try {
        diaryRepository.deleteFoodRecord(userId, daysSinceEpoch, currentState.foodRecord);
        event.completer?.complete();

        _log.info("${currentState.foodRecord} deleted");
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }

    if (event is SaveFoodRecord) {
      _log.info("save food record does nothing!");
      // Can't edit unchanged food record
//      if (initialFoodRecord != currentState.foodRecord) {
//        saveAction(currentState.foodRecord);
//      }
      // OPTIMIZE: I can't check != here since I also use this for single add, could be same if didn't change anything!
//      saveAction(currentState.foodRecord);

    }
  }
}



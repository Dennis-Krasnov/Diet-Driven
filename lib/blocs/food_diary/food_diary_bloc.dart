import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  final FoodRepository foodRepository;

  ValueObservable<BuiltList<FoodDiaryDay>> foodDiaryDayStream;

  FoodDiaryBloc({@required this.foodRepository}) : assert(foodRepository != null);

  @override
  FoodDiaryState get initialState => FoodDiaryLoading();


  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryState currentState, FoodDiaryEvent event) async* {
    if (event is LoadFoodRecordDays) {
      yield* _mapLoadFoodDiaryToState();
    }
    else if (event is AddFoodRecord) {
      yield* _mapAddFoodRecordToState(currentState, event);
    }
    else {
      print("FOOD DIARY EVENT NOT DEFINED: $event");
    }
  }

  ///
  Stream<FoodDiaryState> _mapLoadFoodDiaryToState() async* {
    // Don't re-initialize existing stream data subscription
    foodDiaryDayStream ??= foodRepository.foodDiaryList("Z1TAAZu1jDMn0VbSAyKXUO1qc5z2");
//    foodDiaryDayStreamBloc ??= StreamDataBloc<BuiltList<FoodDiaryDay>>()
//      ..dispatch(StreamDataInit<BuiltList<FoodDiaryDay>>((b) => b
//        ..stream = foodRepository.foodDiaryList("Z1TAAZu1jDMn0VbSAyKXUO1qc5z2")
//      ));

//    await otherData
    yield FoodDiaryLoaded((b) => b
      ..foodDiaryDayStream = foodDiaryDayStream
//      ..otherData
    );
  }

  ///
  Stream<FoodDiaryState> _mapAddFoodRecordToState(FoodDiaryState currentState, AddFoodRecord event) async* {
    // FIXME: doesn't update (can click theme to update)
    if (currentState is FoodDiaryLoaded) {
//      var day = currentState.foodDiaryDays[0].rebuild((b) => b
//        ..foodRecords = b.foodRecords.build().rebuild((b) => b.add(FoodRecord((b) => b..foodName = "FOO"))).toBuilder()
//      );

      print("gonna add a food!");

      var searchResult = await foodRepository.searchForFood("apple");
      print(searchResult);
      // FIXME !!!


//    print(currentState.foodDiaryDays.length);
//    print(currentState.foodDiaryDays.length.then((i) => print(i)));

//    ValueObservable<BuiltList<FoodDiaryDay>> val = currentState.foodDiaryDays.shareValue(); // uses Behaviorsubject in background
//
//    print("VALUE: $val ");
//    print("VALUE VALUE ${val.value}");
//
//      var i = Random().nextInt(1000);
//      var day = val.value[0].rebuild((b) => b
//        ..foodRecords = b.foodRecords.build().rebuild((b) => b.add(FoodRecord((b) => b..foodName = "OOH $i"))).toBuilder()
//      );
//
//      print("DAY: $day");
////
//      await foodRepository.foodDiaryUpdate("Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", 124, day);

//      yield currentState;
//      yield currentState.rebuild((b) => b
//        ..foodDiaryDays[0] = b.foodDiaryDays[0].rebuild((b) => b
//          ..foodRecords = List.from(b.foodRecords..add(FoodRecord((b) => b..foodName = "FOO")))
//        )
//      );
    } else {
      print("can't add to a non-loaded food diary");
    }
  }
}

// generic:
//try {
//final todos = await this.todosRepository.loadTodos();
//yield TodosLoaded(
//todos.map(Todo.fromEntity).toList(),
//);
//} catch (_) {
//yield TodosNotLoaded();
//}

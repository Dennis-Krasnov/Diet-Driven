import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/food_diary/food_diary.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/models.dart';

class FoodDiaryBloc extends Bloc<FoodDiaryEvent, FoodDiaryState> {
  @override
  FoodDiaryState get initialState => FoodDiaryLoading();

  @override
  Stream<FoodDiaryState> mapEventToState(FoodDiaryState currentState, FoodDiaryEvent event) async* {
    if (event is LoadFoodRecords) {
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
    yield FoodDiaryLoaded((b) => b
      ..foodDiaryDays = List.from([
        FoodDiaryDay((b) => b
          ..foodRecords = List.from([
            FoodRecord((b) => b..foodName = "FOO"),
            FoodRecord((b) => b..foodName = "DOO")
          ])
        )
      ])
    );
  }

  ///
  Stream<FoodDiaryState> _mapAddFoodRecordToState(FoodDiaryState currentState, AddFoodRecord event) async* {
    // FIXME: doesn't update (can click theme to update)
    if (currentState is FoodDiaryLoaded) {
      yield currentState.rebuild((b) => b
        ..foodDiaryDays[0] = b.foodDiaryDays[0].rebuild((b) => b
          ..foodRecords = List.from(b.foodRecords..add(FoodRecord((b) => b..foodName = "FOO")))
        )
      );
    } else {
      print("can't add to a non-loaded food diary");
    }
  }
}

//try {
//final todos = await this.todosRepository.loadTodos();
//yield TodosLoaded(
//todos.map(Todo.fromEntity).toList(),
//);
//} catch (_) {
//yield TodosNotLoaded();
//}
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'food_diary_events.g.dart';

abstract class FoodDiaryEvent {}

abstract class LoadFoodRecordDays with FoodDiaryEvent implements Built<LoadFoodRecordDays, LoadFoodRecordDaysBuilder> {
  LoadFoodRecordDays._();
  factory LoadFoodRecordDays([updates(LoadFoodRecordDaysBuilder b)]) = _$LoadFoodRecordDays;
}

abstract class AddFoodRecord with FoodDiaryEvent implements Built<AddFoodRecord, AddFoodRecordBuilder> {
  FoodRecord get foodRecord;

  AddFoodRecord._();
  factory AddFoodRecord([updates(AddFoodRecordBuilder b)]) = _$AddFoodRecord;
}

//LoadTodos - tells the bloc that it needs to load the todos from the TodosRepository.
//AddTodo - tells the bloc that it needs to add an new todo to the list of todos.
//UpdateTodo - tells the bloc that it needs to update an existing todo.
//DeleteTodo - tells the bloc that it needs to remove an existing todo.
//ClearCompleted - tells the bloc that it needs to remove all completed todos.
//ToggleAll - tells the bloc that it needs to toggle the completed state of all todos.
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

//part 'authentication_events.g.dart';

abstract class AuthenticationEvent {}


//LoadTodos - tells the bloc that it needs to load the todos from the TodosRepository.
//AddTodo - tells the bloc that it needs to add an new todo to the list of todos.
//UpdateTodo - tells the bloc that it needs to update an existing todo.
//DeleteTodo - tells the bloc that it needs to remove an existing todo.
//ClearCompleted - tells the bloc that it needs to remove all completed todos.
//ToggleAll - tells the bloc that it needs to toggle the completed state of all todos.
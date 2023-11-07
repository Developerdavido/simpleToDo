

import 'package:equatable/equatable.dart';
import 'package:simple_to_do/models/todo.dart';

abstract class TodoEvents extends Equatable {}

//add a todo
class AddATodo extends TodoEvents {
  final ToDo toDo;
  AddATodo({required this.toDo});

  @override
  // TODO: implement props
  List<Object?> get props => [toDo];
}

//delete todos
class DeleteTodo extends TodoEvents {
  final ToDo toDo;
  DeleteTodo({required this.toDo});

  @override
  // TODO: implement props
  List<Object?> get props => [toDo];
}

// remove todos
class RemoveTodo extends TodoEvents {
  final ToDo toDo;
  RemoveTodo({required this.toDo});

  @override
  // TODO: implement props
  List<Object?> get props => [toDo];
}

//update todos
class UpdateATodo extends TodoEvents {
  final ToDo toDo;
  UpdateATodo({required this.toDo});

  @override
  // TODO: implement props
  List<Object?> get props => [toDo];
}

//get todos
class GetAllTodos extends TodoEvents {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

import 'package:simple_to_do/models/todo.dart';

abstract class ToDoState {
  List<ToDo> todos = [];
  ToDoState();
}

class ToDoInitial extends ToDoState {
  ToDoInitial();
}

class ToDoLoaded extends ToDoState {
  ToDoLoaded(List<ToDo> todos) {
    this.todos = todos;
  }
}

class ToDoError extends ToDoState {
  final String message;
  ToDoError(this.message);

}
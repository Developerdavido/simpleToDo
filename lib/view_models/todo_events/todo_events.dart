

import 'package:simple_to_do/models/todo.dart';

abstract class TodoEvents {}


class AddATodo extends TodoEvents {
  final ToDo toDo;
  AddATodo(this.toDo);
}

class RemoveATodo extends TodoEvents {
  final ToDo toDo;
  RemoveATodo(this.toDo);
}

class UpdateATodo extends TodoEvents {
  final ToDo toDo;
  UpdateATodo(this.toDo);
}

class GetTodos extends TodoEvents {}
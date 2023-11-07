import 'package:flutter/material.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_events.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/widgets/todo_tile.dart';

import '../blocs/bloc_exports.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todoList,
  });

  final List<ToDo> todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          var todo = todoList[index];
          return TodoTile(todo: todo);
        });
  }
}

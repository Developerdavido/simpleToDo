
import 'package:flutter/material.dart';
import 'package:simple_to_do/blocs/bloc_exports.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_events.dart';
import 'package:simple_to_do/models/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });

  final ToDo todo;
  void _removeOrDeleteTodo(BuildContext context, ToDo todo){
    todo.deleted!
        ? context.read<ToDoBloc>().add(DeleteTodo(toDo: todo))
        : context.read<ToDoBloc>().add(RemoveTodo(toDo: todo));
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.item!,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(
          decoration: todo.completed!
              ? TextDecoration.lineThrough
              : null,
        ),
      ),
      trailing: Checkbox(
        value: todo.completed,
        onChanged: todo.deleted == false ? (value) {
          context
              .read<ToDoBloc>()
              .add(UpdateATodo(toDo: todo));
        } : null,
      ),
      onLongPress: ()=> _removeOrDeleteTodo(context, todo)
    );
  }
}
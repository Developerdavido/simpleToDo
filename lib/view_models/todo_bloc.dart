

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/services/database_service.dart';
import 'package:simple_to_do/view_models/todo_events/todo_events.dart';
import 'package:simple_to_do/view_models/todo_state/todo_state.dart';

class ToDoBloc extends Bloc<TodoEvents, ToDoState> {
  DatabaseService database = DatabaseService();
  ToDoBloc() : super(ToDoInitial()) {
    on<AddATodo>(_mapAddAToDoToState);
    on<RemoveATodo>(_mapRemoveAToDoToState);
    on<UpdateATodo>(_mapUpdateAToDoToState);
    on<GetTodos>(_mapGetToDosToState);
  }


  FutureOr<void> _mapAddAToDoToState(AddATodo event, Emitter<ToDoState> emit) async {
    try{
      final List<ToDo> todos = state.todos;
      todos.add(event.toDo);
      await database.saveTodo(event.toDo);
      emit(ToDoLoaded(todos));
    } catch (e) {
      print(e);
      emit(ToDoError(e.toString()));
    }
  }

  FutureOr<void> _mapRemoveAToDoToState(RemoveATodo event, Emitter<ToDoState> emit) async{
    try {
      final List<ToDo> todos = state.todos;
      todos.removeWhere((todo) => todo.uuid == event.toDo.uuid);
      await database.deleteTodo(uuid: event.toDo.uuid);
      emit(ToDoLoaded(todos));
    } catch (e) {
      print(e);
      emit(ToDoError(e.toString()));
    }
  }

  //update all todos
  FutureOr<void> _mapUpdateAToDoToState(UpdateATodo event, Emitter<ToDoState> emit) async {
    try {
      List<ToDo> todos = state.todos;
      await database.updateTodo(event.toDo);
      todos = await database.getTodoList();
      emit(ToDoLoaded(todos));
    } catch (e) {
      print(e);
      emit(ToDoError(e.toString()));
    }
  }

  //get all the todos and keep state
  FutureOr<void> _mapGetToDosToState(GetTodos event, Emitter<ToDoState> emit) async{
    try {
      List<ToDo> todos = await database.getTodoList();
      emit(ToDoLoaded(todos));
    } catch (e) {
      print(e);
      emit(ToDoError(e.toString()));
    }
  }
}
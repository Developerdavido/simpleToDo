

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_events.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_state.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/services/database_service.dart';


class ToDoBloc extends HydratedBloc<TodoEvents, ToDoState> {
  DatabaseService database = DatabaseService();
  ToDoBloc() : super(const ToDoState()) {
    on<AddATodo>(_mapAddAToDoToState);
    on<DeleteTodo>(_mapDeleteAToDoToState);
    on<UpdateATodo>(_mapUpdateAToDoToState);
    on<RemoveTodo>(_mapRemoveAToDoToState);
    //on<GetAllTodos>(_mapGetToDosToState);
  }


  FutureOr<void> _mapAddAToDoToState(AddATodo event, Emitter<ToDoState> emit){
      final state = this.state;
      emit(ToDoState(
          allTodos: List.from(state.allTodos)..add(event.toDo),
        removeTodos: state.removeTodos
      ));
  }

  FutureOr<void> _mapDeleteAToDoToState(DeleteTodo event, Emitter<ToDoState> emit) {
      final state = this.state;
      final todo = event.toDo;
      List<ToDo> todos = List.from(state.removeTodos)..remove(todo);
      emit(ToDoState(allTodos: state.allTodos, removeTodos: todos));

  }

  FutureOr<void> _mapRemoveAToDoToState(RemoveTodo event, Emitter<ToDoState> emit) {
    final state = this.state;
    final todo = event.toDo;
    List<ToDo> todos = List.from(state.allTodos)..remove(todo);
    emit(ToDoState(allTodos: todos,
        removeTodos: List.from(state.removeTodos)..add(event.toDo.copyWith(deleted: true))
    ));

  }

  //update all todos
  FutureOr<void> _mapUpdateAToDoToState(UpdateATodo event, Emitter<ToDoState> emit) async {
      final state = this.state;
      final todo = event.toDo;
      final int index = state.allTodos.indexOf(todo);
      List<ToDo> todos = List.from(state.allTodos)..remove(todo);
      //todos.removeWhere((todo) => todo.uuid == event.toDo.uuid);
      //await database.deleteTodo(uuid: event.toDo.uuid);
      todo.completed == false
          ? todos.insert(index, todo.copyWith(completed: true))
          : todos.insert(index, todo.copyWith(completed: false));
      emit(ToDoState( allTodos: todos, removeTodos: state.removeTodos));
  }

  // //get all the todos and keep state
  // FutureOr<void> _mapGetToDosToState(GetAllTodos event, Emitter<ToDoState> emit) async{
  //   try {
  //     List<ToDo> todos = await database.getTodoList();
  //     emit(ToDoLoaded(allTodos: todos));
  //   } catch (e) {
  //     print(e);
  //     emit(ToDoError(e.toString()));
  //   }
  // }

  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return ToDoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    // TODO: implement toJson
    return state.toJson();
  }
}
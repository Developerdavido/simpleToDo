
import 'package:equatable/equatable.dart';
import 'package:simple_to_do/models/todo.dart';


class ToDoState extends Equatable{
  final List<ToDo> allTodos;
  final List<ToDo> removeTodos;
  const ToDoState({
    this.allTodos = const <ToDo>[],
    this.removeTodos = const <ToDo>[]
});

  Map<String, dynamic> toJson() {
    return {
      'all_todos': allTodos.map((x) => x.toJson()).toList(),
      'removed_todos': removeTodos.map((x) => x.toJson()).toList(),
    };
  }

  factory ToDoState.fromJson(Map<String, dynamic> json) {
    return ToDoState(
        allTodos: List<ToDo>.from(json['all_todos']?.map((x) => ToDo.fromJson(x))),
        removeTodos: List<ToDo>.from(json['removed_todos']?.map((x) => ToDo.fromJson(x))),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [allTodos, removeTodos];

}

// class ToDoInitial extends ToDoState {
//   ToDoInitial({required List<ToDo> allTodos});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [allTodos];
//
//   Map<String, dynamic> toJson() {
//     return {
//       'all_todos': allTodos.map((x) => x.toJson()).toList()
//     };
//   }
//
//   factory ToDoInitial.fromJson(Map<String, dynamic> json) {
//     return ToDoInitial(
//       allTodos: List<ToDo>.from(json['all_todos']?.map((x) => ToDo.fromJson(x)))
//     );
//   }
// }
//
// class ToDoLoaded extends ToDoState {
//   ToDoLoaded({required List<ToDo> allTodos}) {
//     this.allTodos = allTodos;
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [allTodos];
//
//   Map<String, dynamic> toJson() {
//     return {
//       'all_todos': allTodos.map((x) => x.toJson()).toList()
//     };
//   }
//
//   factory ToDoLoaded.fromJson(Map<String, dynamic> json) {
//     return ToDoLoaded(
//         allTodos: List<ToDo>.from(json['all_todos']?.map((x) => ToDo.fromJson(x)))
//     );
//   }
// }
//
// class ToDoError extends ToDoState {
//   final String message;
//   ToDoError(this.message);
//
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [allTodos];
//
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/constants/colors.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/screens/add_a_new_todo.dart';
import 'package:simple_to_do/view_models/todo_bloc.dart';
import 'package:simple_to_do/view_models/todo_events/todo_events.dart';
import 'package:simple_to_do/view_models/todo_state/todo_state.dart';
import 'package:simple_to_do/widgets/todo_widget.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ToDoBloc>(context).add(GetTodos());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Simple ToDo App",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (BuildContext context, state) {
          if (state is ToDoLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: state.todos.isEmpty
                  ? Center(
                      child: Text(
                        "There are no current items in your list",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        var todo = state.todos[index];
                        return GestureDetector(
                          onLongPress: (){
                            var newToDo = ToDo(
                                item: todo.item,
                                description: todo.description,
                                uuid: todo.uuid ?? Uuid().v4().toString(),
                                createdAt: DateTime.now(),
                                completed: true
                            );
                            context.read<ToDoBloc>().add(UpdateATodo(newToDo));
                          },
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => AddANewTodo(todo: todo,)));
                            }, child: TodoWidget(todo: todo));
                      }),
            );
          } else if (state is ToDoError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 1.5,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddANewTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

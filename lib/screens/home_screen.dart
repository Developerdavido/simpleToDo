import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/blocs/bloc_exports.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_events.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_state.dart';
import 'package:simple_to_do/constants/app_routes.dart';
import 'package:simple_to_do/constants/colors.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/screens/add_a_new_todo.dart';
import 'package:simple_to_do/screens/my_drawer.dart';
import 'package:simple_to_do/widgets/todo_list.dart';
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
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        List<ToDo> todoList = state.allTodos;
        return SafeArea(
          child: Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: const Text(
                "ToDo App",
              ),
            ),
            body: Column(
              children: [
                Chip(label: Text("${state.allTodos.length} Todos"),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: state.allTodos.isEmpty
                      ? Center(
                          child: Text(
                            "There are no current items in your list",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      : TodoList(todoList: todoList),
                ))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.addTodoRoute);
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}



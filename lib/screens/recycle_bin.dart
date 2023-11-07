import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/blocs/bloc_exports.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_state.dart';
import 'package:simple_to_do/constants/colors.dart';
import 'package:simple_to_do/screens/my_drawer.dart';
import 'package:simple_to_do/widgets/todo_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text(
              "Recycle Bin",
            ),
          ),
          body: Column(
            children: [
              Chip(label: Text("${state.removeTodos.length} Todos"),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TodoList(todoList: state.removeTodos),
                  ))
            ],
          ),
        );
      }
    );
  }
}

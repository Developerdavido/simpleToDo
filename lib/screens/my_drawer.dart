import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/blocs/bloc_exports.dart';
import 'package:simple_to_do/blocs/todo_bloc/todo_state.dart';

import '../constants/app_routes.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool switchValue  = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
              child: Text("Todo Drawer", style: Theme.of(context).textTheme.headlineSmall,),
            ),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.todoScreenRoute),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Todos'),
                    trailing: Text('${state.allTodos.length}'),
                  ),
                );
              }
            ),
            const Divider(),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.recycleRoute),
                  child:ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removeTodos.length}'),
                  ),
                );
              }
            ),
            Switch(
              value: switchValue,
              onChanged: (value){
                setState(() {
                  switchValue = value;
                });
              },
            )
          ],
        ));
  }
}

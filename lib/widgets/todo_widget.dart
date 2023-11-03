import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/constants/colors.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/view_models/todo_bloc.dart';
import 'package:simple_to_do/view_models/todo_events/todo_events.dart';
class TodoWidget extends StatelessWidget {
  final ToDo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.5, 0.5),
              blurRadius: 0.4,
              spreadRadius: 0.3,
              color: AppColors.secondaryColor.withOpacity(0.3)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.item!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    decoration: todo.completed! ? TextDecoration.lineThrough : null
                  ),

                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(todo.completed! ? "Completed" : "Activity due on: ${todo.formatTheDate(todo.createdAt!)}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: todo.completed! ? Colors.green : AppColors.grey
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                context.read<ToDoBloc>().add(RemoveATodo(todo));
              },
              child: Icon(
                Icons.delete_outline,
                size: 44.sp,
                color: AppColors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

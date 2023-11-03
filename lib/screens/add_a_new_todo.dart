import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/constants/colors.dart';
import 'package:simple_to_do/models/todo.dart';
import 'package:simple_to_do/view_models/todo_bloc.dart';
import 'package:simple_to_do/view_models/todo_events/todo_events.dart';
import 'package:simple_to_do/widgets/custom_button.dart';
import 'package:simple_to_do/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';

class AddANewTodo extends StatefulWidget {
  final ToDo? todo;
  const AddANewTodo({Key? key, this.todo}) : super(key: key);

  @override
  State<AddANewTodo> createState() => _AddANewTodoState();
}

class _AddANewTodoState extends State<AddANewTodo> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController itemCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todo != null) {
      itemCtrl = TextEditingController(text: widget.todo!.item);
      descriptionCtrl = TextEditingController(text: widget.todo!.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.onPrimaryColor,
        title: Text("Add a new Todo", style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 25.h),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "What do you want to do?",
                inputAction: TextInputAction.next,
                controller: itemCtrl,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h,),
              CustomTextField(
                hintText: "Can you give a brief description ?",
                inputAction: TextInputAction.done,
                controller: descriptionCtrl,
                maxLines: 6,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h,),
              CustomButton(
                  title: widget.todo != null ? "Update Todo" : "Save Todo",
                onTap: (){
                    var todo = ToDo(
                      item: itemCtrl.text,
                      description: descriptionCtrl.text,
                      uuid: widget.todo != null ? widget.todo!.uuid : Uuid().v4().toString(),
                      createdAt: DateTime.now(),
                      completed: false
                    );
                    if (globalKey.currentState!.validate()) {
                      widget.todo != null
                          ? context.read<ToDoBloc>().add(UpdateATodo(todo))
                          : context.read<ToDoBloc>().add(AddATodo(todo));
                    }
                    itemCtrl.text = "";
                    descriptionCtrl.text = "";
                    Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

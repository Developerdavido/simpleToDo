import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/constants/colors.dart';
import 'package:simple_to_do/screens/home_screen.dart';
import 'package:simple_to_do/view_models/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(640, 1136),
      builder: (context, child) {
        return BlocProvider(
            create: (context) => ToDoBloc(),
          child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
                textTheme: TextTheme(
                    headlineLarge: TextStyle(
                      color: AppColors.onPrimaryColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                    titleMedium: TextStyle(
                      color: AppColors.onPrimaryDark,
                      fontSize: 26.sp,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                    bodyMedium: TextStyle(
                      color: AppColors.onPrimaryDark,
                      fontSize: 18.sp,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    )
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    foregroundColor: AppColors.onPrimaryDark,
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)
                    )
                ),
                useMaterial3: true,
              ),
              home: const HomeScreen()
          ),
        );
      },
    );
  }
}




import 'package:flutter/material.dart';
import 'package:simple_to_do/constants/app_routes.dart';
import 'package:simple_to_do/screens/add_a_new_todo.dart';
import 'package:simple_to_do/screens/home_screen.dart';
import 'package:simple_to_do/screens/recycle_bin.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case AppRoutes.recycleRoute:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case AppRoutes.todoScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.addTodoRoute:
        return MaterialPageRoute(builder: (_) => const AddANewTodo());
      default :
        return null;
    }
  }
}

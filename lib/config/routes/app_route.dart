import 'package:flutter/material.dart';

import '../../domain/entities/todo_model.dart';
import '../../presentation/pages/pages.dart';

class AppRoute {
  static const LOGIN = "/to_login";
  static const TASK_LIST = "/to_task_list";
  static const CREATE = "/to_create";
  static const DETAIL = "/to_detail";
  static const SPLASH_SCREEN = "/to_detail";

  static final routeMap = {
    LOGIN: (settings) => _materialRoute(const LoginScreen(), settings),
    TASK_LIST: (settings) {
      final tasksMap = settings.arguments;
      return _materialRoute(TasksScreen(tasksMap), settings);
    },
    CREATE: (settings) {
      TodoModel? todo = settings.arguments;
      return _materialRoute(CreateScreen(data: todo), settings);
    }
  };

  static Route<dynamic> _materialRoute(Widget view, RouteSettings? settings,
          {bool haveAnimation = false}) =>
      haveAnimation
          ? MaterialPageRoute(builder: (_) => view, settings: settings)
          : NoAnimationMaterialPageRoute(
              builder: (_) => view, settings: settings);
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
    super.maintainState = true,
    super.fullscreenDialog = false,
  });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

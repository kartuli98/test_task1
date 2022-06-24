import 'package:flutter/material.dart';

import '../logger/todo_logger.dart';

class AppNavigator {
  final NavigatorState _navigator;
  final ToDoLogger _logger;

  AppNavigator(this._navigator, this._logger);

  pop({
    Object? data,
  }) {
    _logger.logInfo(data.toString());
    _navigator.pop(data);
  }

  popUntil(String screen) {
    _navigator.popUntil((route) => route.settings.name == screen);
  }

  Future push(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  pushReplacementName(
    String routeName, {
    Object? arguments,
  }) {
    _navigator.pushReplacementNamed(routeName, arguments: arguments);
  }

  pushNamedAndRemoveUntil(
    String routeName,
    String predicateRouteName, {
    Object? arguments,
  }) {
    _navigator.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(predicateRouteName),
        arguments: arguments);
  }

  Future<dynamic> pushDialog({
    required WidgetBuilder builder,
    BuildContext? context,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    return showDialog(
      context: context ?? _navigator.context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }

  NavigatorState get navigationContext => _navigator;
}

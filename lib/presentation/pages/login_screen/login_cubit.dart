import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_to_do/core/constants/shared_prefs_const.dart';
import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/core/navigation/app_navigator.dart';
import 'package:test_to_do/domain/usecases/usecases.dart';
import 'package:test_to_do/presentation/pages/base_cubit.dart';

import '../../../config/routes/app_route.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final ToDoLogger _logger;
  final AppNavigator appNavigator;
  final GetTasksUseCase getTasksUseCase;

  LoginCubit(
    this._logger,
    this.appNavigator,
    this.getTasksUseCase, 
  ) : super(const LoginState(loading: false, error: null));

  void init() {}

  void navigateMainScreen() async {
    final tasks = await getTasksUseCase(null);
    appNavigator.pushNamedAndRemoveUntil(AppRoute.TASK_LIST, AppRoute.TASK_LIST,
        arguments: tasks);
  }
}

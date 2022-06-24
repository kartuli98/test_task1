import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/domain/entities/task_filter.dart';
import 'package:test_to_do/domain/usecases/usecases.dart';
import 'package:test_to_do/presentation/pages/base_cubit.dart';

import '../../../config/routes/app_route.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/observer/task_update_checker.dart';
import '../../../domain/entities/todo_model.dart';
import 'main_state.dart';

class TasksScreenCubit extends BaseCubit<TasksScreenState> {
  final ToDoLogger logger;
  final AppNavigator appNavigator;
  final TaskUpdateChecker _taskUpdateChecker;
  final GetTaskUseCase _getTaskUseCase;
  final UpdateStatusUseCase _updateStatusUseCase;
  Map<String, TodoModel> allTask = {};
  TasksScreenCubit(this.logger, this.appNavigator, this._taskUpdateChecker,
      this._getTaskUseCase, this._updateStatusUseCase)
      : super(const TasksScreenState(
            filter: TaskFilter.all, loading: false, error: null, tasks: [])) {
    _taskUpdateChecker.stream.listen((event) async {
      logger.logInfo('MainCubit.liste: event => $event');
      print(_taskUpdateChecker.isUpdateRequired);
      if (_taskUpdateChecker.isUpdateRequired) {
        if (event.value == 'DELETE') {
          allTask.remove(event.key);
        }
        if (event.value == 'SAVE') {
          final task = await _getTaskUseCase(event.key);
          allTask[event.key] = task;
        }
        changeFilter(state.filter);
        _taskUpdateChecker.onUpdateDone();
      }
    });
  }

  void init(Map<String, TodoModel> tasks) {
    allTask.addAll(tasks);
    emit(state.copyWith(tasks: tasks.values.toList()));
  }

  void updateStatus(String id, bool status) async {
    logger.logInfo("taskId= $id status= $status");
    allTask[id] = allTask[id]!.copyWith(status: status ? 2 : 1);
    await _updateStatusUseCase(MapEntry(id, status ? 2 : 1));
  }

  void changeFilter(TaskFilter filter) {
    logger.logInfo("filter $filter");
    final List<TodoModel> filtredTasks;
    if (filter == TaskFilter.all) {
      filtredTasks = allTask.values.toList();
    } else {
      filtredTasks =
          allTask.values.where((task) => task.type == filter.code).toList();
    }
    emit(state.copyWith(filter: filter, tasks: filtredTasks));
  }

  void navigateToTask(TodoModel task) {
    logger.logInfo(task.toString());
    appNavigator.push(AppRoute.CREATE, arguments: task);
  }

  void navigateToCreateTask() => appNavigator.push(AppRoute.CREATE);

  @override
  Future<void> close() {
    _taskUpdateChecker.dispose();
    return super.close();
  }
}

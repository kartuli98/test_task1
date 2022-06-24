import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';
import 'package:test_to_do/domain/repositories/local_task_repository.dart';

import '../datasources/local/local_task_storage.dart';

class LocalTaskRepositoryImpl implements LocalTaskRepository {
  final LocalTaskStorage _localStorage;
  final ToDoLogger _logger;
  LocalTaskRepositoryImpl(this._localStorage, this._logger);
  @override
  Future<void> deleteTask(String id) async {
    await _localStorage.deleteTaskById(id);
  }

  @override
  Future<List<TaskEntity>> getTasks() {
    return _localStorage.getTasks();
  }

  @override
  Future<TaskEntity> getTask(String taskId) {
    return _localStorage.getTaskById(taskId);
  }

  @override
  Future<void> saveTask(TaskEntity task) async {
    await _localStorage.saveTask(task);
  }

  @override
  Future<void> saveTasks(Map<String,TaskEntity> tasks) async {
    if (tasks.length == 1) {
      await _localStorage.saveTask(tasks.values.first);
    } else {
      await _localStorage.updateAllTasks(tasks);
    }
  }

  @override
  Future<void> updateTask(String id, int status) async {
    await _localStorage.updateStatusTask(id, status);
  }
}

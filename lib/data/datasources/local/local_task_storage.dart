import 'dart:async';
import 'package:logger/logger.dart';
import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';

import '../../../core/db/hive_db.dart';

class LocalTaskStorage {
  static const String _boxName = 'tasks';
  final HiveDB _hiveDB;
  ToDoLogger _logger;

  LocalTaskStorage(this._hiveDB, this._logger) {
    unawaited(_hiveDB
        .registerAdapter<TaskEntity, TaskEntityAdapter>(TaskEntityAdapter()));
  }

  Future<List<TaskEntity>> getTasks() async {
    final box = await _hiveDB.getBox<TaskEntity>(_boxName);
    final list = box.values.toList();
    _logger.logInfo('tasks amount: ${list.length}');
    return list;
  }

  Future<TaskEntity> getTaskById(String id) async {
    final box = await _hiveDB.getBox<TaskEntity>(_boxName);
    final TaskEntity taskEntity = box.get(id)!;
    _logger.logInfo("localStorage.getTaskById: $taskEntity");
    return box.get(id)!;
  }

  Future<void> saveTask(TaskEntity taskEntity) async {
    final box = await _hiveDB.getBox<TaskEntity>(_boxName);
    _logger.logInfo(taskEntity.taskId);
    await box.put(taskEntity.taskId, taskEntity);
  }

  Future<void> updateAllTasks(Map<String, TaskEntity> tasks) async {
    final box = await _hiveDB.getBox<TaskEntity>(_boxName);
    _logger.logInfo("count: ${tasks.length}");
    await box.putAll(tasks);
  }

  Future<void> deleteTaskById(String taskId) async {
    final box = await _hiveDB.getBox<TaskEntity>(_boxName);
    _logger.logInfo(taskId);
    if (box.containsKey(taskId)) {
      await box.delete(taskId);
    }
    _logger.logInfo("\"$taskId\" has been deleted");
  }

  Future<void> updateStatusTask(String taskId, int status) async {
    final box = await _hiveDB.getBox<TaskEntity>(_boxName);
    _logger.logInfo(taskId);
    if (box.containsKey(taskId)) {
      var task = box.get(taskId);
      await box.delete(taskId);
      await box.put(taskId, task!.copyWith(status: status));
      _logger.logInfo("\"$taskId\" has been updated");
    }
  }
}

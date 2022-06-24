import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';

abstract class LocalTaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<TaskEntity> getTask(String taskId);

  Future<void> saveTask(TaskEntity task);

  Future<void> saveTasks(Map<String,TaskEntity> tasks);

  Future<void> updateTask(String id, int status);

  Future<void> deleteTask(String id);
}

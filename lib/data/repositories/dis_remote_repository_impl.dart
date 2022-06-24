import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/data/models/todo_model_dto.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

class DisableRemoteRepositoryImpl extends RemoteTaskRepository {
  @override
  Future<void> deleteTask(String id) {
    return Future.value();
  }

  @override
  Future<List<TodoModelDto>> getTasks() {
    return Future.value();
  }

  @override
  Future<void> postTasks(List<TodoModel> task) {
    return Future.value();
  }

  @override
  Future<void> putTask(String id, int status) {
    return Future.value();
  }
}

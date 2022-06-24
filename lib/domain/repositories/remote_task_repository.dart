import 'package:test_to_do/data/models/todo_model_dto.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';

abstract class RemoteTaskRepository {

  Future<List<TodoModelDto>> getTasks();

  Future<void> postTasks(List<TodoModel> task);

  Future<void> putTask(String id, int status);

  Future<void> deleteTask(String id);
}

import 'package:test_to_do/core/io/file_handler.dart';
import 'package:test_to_do/core/usecases/usecase.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

import '../repositories/local_task_repository.dart';

class GetTaskUseCase implements UseCase<TodoModel, String> {
  final LocalTaskRepository _localTaskRepository;

  GetTaskUseCase(this._localTaskRepository);

  @override
  Future<TodoModel> call(String params) async {
    final taskEntity = await _localTaskRepository.getTask(params);

    return taskEntity.toUiModel();
  }
}

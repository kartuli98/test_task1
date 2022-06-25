import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

import '../../core/usecases/usecase.dart';

class PostTasksUseCase implements UseCase<void, List<TodoModel>> {
  final ToDoLogger _logger;
  final RemoteTaskRepository _remoteTaskRepository;
  PostTasksUseCase(this._logger, this._remoteTaskRepository);
  @override
  Future<void> call(List<TodoModel> params) {
    _logger.logInfo('uploaded data: $params');
    return _remoteTaskRepository.postTasks(params);
  }
}

import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

import '../../core/usecases/usecase.dart';

class PostTasksUseCase implements UseCase<void, List<TodoModel>> {
  final RemoteTaskRepository _remoteTaskRepository;
  PostTasksUseCase(this._remoteTaskRepository);
  @override
  Future<void> call(List<TodoModel> params) {
    return _remoteTaskRepository.postTasks(params);
  }
}
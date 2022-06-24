import 'package:test_to_do/core/usecases/usecase.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';
import 'package:test_to_do/domain/repositories/local_task_repository.dart';

class ReadTasksUseCase implements UseCase<List<TaskEntity>, void> {
  final LocalTaskRepository _localTaskRepository;
  ReadTasksUseCase(this._localTaskRepository);
  @override
  Future<List<TaskEntity>> call(void params) {
    return _localTaskRepository.getTasks();
  }
}

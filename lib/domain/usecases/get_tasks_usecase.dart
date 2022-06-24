import 'package:logger/logger.dart';
import 'package:test_to_do/core/io/file_handler.dart';
import 'package:test_to_do/core/usecases/usecase.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

import '../../core/services/connectivity_service.dart';
import '../repositories/local_task_repository.dart';

class GetTasksUseCase implements UseCase<Map<String, TodoModel>, void> {
  final RemoteTaskRepository _remoteTaskRepository;
  final LocalTaskRepository _localTaskRepository;
  final ConnectivityService _connectivityService;

  GetTasksUseCase(this._remoteTaskRepository, this._localTaskRepository,
      this._connectivityService);

  @override
  Future<Map<String, TodoModel>> call(void params) async {
    final Map<String, TodoModel> uiMap = {};
    if (await _connectivityService.checkInternetConnection()) {
      final dto = await _remoteTaskRepository.getTasks();
      Map<String, TaskEntity> dbMap = {};
      FileHandler fileHandler = FileHandler();
      await fileHandler.initializeDocumentsDirectory();
      List<TodoModel> listEntity =
          await Future.wait(dto.map((e) => e.toEntity(fileHandler)));
      for (var element in listEntity) {
        uiMap[element.taskId] = element;
        dbMap[element.taskId] = TaskEntity.fromUiModel(element);
      }
      await _localTaskRepository.saveTasks(dbMap);
    } else {
      List<TaskEntity> dbModels = await _localTaskRepository.getTasks();
      for (var element in dbModels) {
        uiMap[element.taskId] = element.toUiModel();
      }
    }
    print(uiMap.toString());
    return uiMap;
  }
}

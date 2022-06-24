import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_to_do/core/usecases/usecase.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

import '../../core/constants/shared_prefs_const.dart';
import '../../core/services/connectivity_service.dart';
import '../repositories/local_task_repository.dart';

class SaveTasksUseCase implements UseCase<void, Map<String, TodoModel>> {
  final RemoteTaskRepository _remoteTaskRepository;
  final LocalTaskRepository _localTaskRepository;
  final ConnectivityService _connectivityService;

  SaveTasksUseCase(this._remoteTaskRepository, this._localTaskRepository,
      this._connectivityService);

  @override
  Future<void> call(Map<String, TodoModel> tasks) async {
    await _localTaskRepository.saveTasks(tasks
        .map(((key, value) => MapEntry(key, TaskEntity.fromUiModel(value)))));
    if (await _connectivityService.checkInternetConnection()) {
      await _remoteTaskRepository.postTasks(tasks.values.toList());
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(SharedPrefsKey.needSendData, true);
    }
  }
}

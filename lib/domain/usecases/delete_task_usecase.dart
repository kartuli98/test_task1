import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_to_do/core/constants/shared_prefs_const.dart';
import 'package:test_to_do/core/services/connectivity_service.dart';
import 'package:test_to_do/core/usecases/usecase.dart';

import '../repositories/local_task_repository.dart';
import '../repositories/remote_task_repository.dart';

class DeleteTaskUseCase implements UseCase<void, String> {
  final RemoteTaskRepository _remoteTaskRepository;
  final LocalTaskRepository _localTaskRepository;
  final ConnectivityService _connectivityService;

  DeleteTaskUseCase(this._remoteTaskRepository, this._localTaskRepository,
      this._connectivityService);
  @override
  Future<void> call(String id) async {
    await _localTaskRepository.deleteTask(id);
    if (await _connectivityService.checkInternetConnection()) {
      await _remoteTaskRepository.deleteTask(id);
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(SharedPrefsKey.needSendData, true);
    }
  }
}

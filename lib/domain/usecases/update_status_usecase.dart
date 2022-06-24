import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_to_do/core/usecases/usecase.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

import '../../core/constants/shared_prefs_const.dart';
import '../../core/services/connectivity_service.dart';
import '../repositories/local_task_repository.dart';

class UpdateStatusUseCase implements UseCase<void, MapEntry<String, int>> {
  final RemoteTaskRepository _remoteTaskRepository;
  final LocalTaskRepository _localTaskRepository;
  final ConnectivityService _connectivityService;

  UpdateStatusUseCase(this._remoteTaskRepository, this._localTaskRepository,
      this._connectivityService);

  @override
  Future<void> call(MapEntry<String, int> params) async {
    await _localTaskRepository.updateTask(params.key, params.value);
    if (await _connectivityService.checkInternetConnection()) {
      await _remoteTaskRepository.putTask(params.key, params.value);
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(SharedPrefsKey.needSendData, true);
    }
  }
}

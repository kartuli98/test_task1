import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_to_do/config/theme/colors.dart';
import 'package:test_to_do/config/theme/styles.dart';
import 'package:test_to_do/core/constants/shared_prefs_const.dart';
import 'package:test_to_do/core/keys.dart';
import 'package:test_to_do/core/services/connectivity_service.dart';
import 'package:test_to_do/data/datasources/local/entity/task_entity.dart';
import 'package:test_to_do/domain/usecases/usecases.dart';

class SynchronizationServices {
  final PostTasksUseCase _postTasksUseCase;
  final ReadTasksUseCase _readTasksUseCase;
  final ConnectivityService _connectivityService;
  SynchronizationServices(this._connectivityService, this._postTasksUseCase,
      this._readTasksUseCase) {
    _connectivityService.connectivityStream.listen((event) async {
      if (event) {
        final prefs = await SharedPreferences.getInstance();
        SnackBar Function(String) snackBar = (p0) => SnackBar(
            backgroundColor: AppColorScheme.colorBananaMania,
            content: Text(
              p0,
              style: textRegular18,
            ));
        if (prefs.getBool(SharedPrefsKey.needSendData) ?? false) {
          List<TaskEntity> dbModels = await _readTasksUseCase(null);
          await _postTasksUseCase(dbModels.map((e) => e.toUiModel()).toList());
          ScaffoldMessenger.of(Keys.navigatorKey.currentContext!)
              .showSnackBar(snackBar('Данні відправлено на сервер'));
        }
        //  else {
        //   ScaffoldMessenger.of(Keys.navigatorKey.currentContext!)
        //       .showSnackBar(snackBar('Данні отриманно з сервера'));
        // }
      }
    });
  }
}

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_to_do/core/constants/shared_prefs_const.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _streamController = StreamController.broadcast();
  Stream<bool> get connectivityStream => _streamController.stream;

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((connection) async {
      bool hasInternet = connection == ConnectivityResult.wifi ||
          connection == ConnectivityResult.mobile;
      _streamController.add(hasInternet);
    });
  }

  Future<bool> checkInternetConnection() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    return (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile);
  }
}

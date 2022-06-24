import 'dart:async';

class TaskUpdateChecker {
  StreamController<MapEntry<String, String>> _streamController = StreamController();
  bool _updateRequired = false;

  void onUpdateDone() {
    _updateRequired = false;
  }

  bool get isUpdateRequired => _updateRequired;

  Stream<MapEntry<String, String>> get stream {
    _reopenControllerIfNeed();
    return _streamController.stream;
  }

  StreamSink<MapEntry<String, String>> get sink {
    _updateRequired = true;
    _reopenControllerIfNeed();
    return _streamController.sink;
  }

  void dispose() {
    _updateRequired = false;
    _streamController.close();
  }

  void _reopenControllerIfNeed() {
    if (_streamController.isClosed) {
      _streamController = StreamController();
    }
  }
}

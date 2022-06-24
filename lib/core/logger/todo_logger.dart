import 'package:logger/logger.dart';

class ToDoLogger {
  static const _appName = "ToDoTestTask";
  static final Logger _logger =
      Logger(output: _OutputCompositor([ConsoleOutput()]));

  void logDebug<T>(String msg) {
    final detailedMessage = _getDetailedMessage(msg, Level.debug, T.toString());
    _logger.d(detailedMessage);
  }

  void logInfo<T>(String msg) {
    final detailedMessage = _getDetailedMessage(msg, Level.info, T.toString());
    _logger.i(detailedMessage);
  }

  void logWarning<T>(String msg) {
    final detailedMessage =
        _getDetailedMessage(msg, Level.warning, T.toString());
    _logger.w(detailedMessage);
  }

  void logError<T>(String msg) {
    final detailedMessage = _getDetailedMessage(msg, Level.error, T.toString());
    _logger.e(detailedMessage);
  }

  String _getDetailedMessage(
    String msg,
    Level level,
    String classType,
  ) {
    final dateTime = DateTime.now();
    final levelString = level.toString().split('.').last;
    final formattedTime =
        '${dateTime.hour.toString()}:${dateTime.minute.toString()}:${dateTime.second.toString()}';
    return '[$_appName] [$formattedTime] [$classType] [$levelString] - $msg';
  }
}

class _OutputCompositor extends LogOutput {
  final List<LogOutput> _outputs;
  _OutputCompositor(this._outputs);

  @override
  void output(OutputEvent event) {
    for (var output in _outputs) {
      output.output(event);
    }
  }
}

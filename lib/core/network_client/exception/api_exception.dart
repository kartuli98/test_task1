class ApiException implements Exception {
  //final int serverErrorCode;
  // final String? serverErrorMessage;
  // final String? serverLogMessage;
  final String error;
  final String? data;

  ApiException(this.error, this.data);
  //this.serverErrorCode, this.serverErrorMessage, this.serverLogMessage);

  String get message => error;

  factory ApiException.fromErrorBody(jsonMap) => ApiException(
      //int.parse(jsonMap["errorCode"] ?? '-111111'),
      // jsonMap['message'],
      // jsonMap['cause']);
      jsonMap['error'],
      jsonMap['data']);

  factory ApiException.unknown({required String log}) =>
     // ApiException(-111111, 'unknown', log);
      ApiException( 'unknown', 'unknow');

  @override
  String toString() => data.toString();
}

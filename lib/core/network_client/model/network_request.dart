import 'dart:typed_data';

class NetworkRequest {
  final RequestType type;
  late String _endpoint;
  final Map<String, String>? _headers = {};
  Map<String, dynamic>? body;
  List<Map<String, dynamic>>? listBody;
  List<FileFormData>? files;

  NetworkRequest._(
      {required String endpoint,
      required this.type,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      this.body,
      this.listBody,
      this.files}) {
    // Map<String, dynamic> _queryParams = {};

    // if (queryParameters != null) {
    //   _queryParams.addAll(queryParameters);
    // }

    _endpoint = "$endpoint${_makeQuery(queryParameters)}";
    _headers!.addAll(_defaultHeaders);
    if (headers != null) {
      _headers!.addAll(headers);
    }
  }

  factory NetworkRequest.post(
          {required String endpoint,
          Map<String, String>? headers,
          Map<String, dynamic>? body,
          List<Map<String, dynamic>>? listBody,
          Map<String, dynamic>? queryParameters}) =>
      NetworkRequest._(
          endpoint: endpoint,
          type: RequestType.post,
          headers: headers,
          body: body,
          listBody: listBody,
          queryParameters: queryParameters);

  factory NetworkRequest.get(
          {required String endpoint,
          Map<String, String>? headers,
          Map<String, dynamic>? body,
          Map<String, dynamic>? queryParameters}) =>
      NetworkRequest._(
          endpoint: endpoint,
          type: RequestType.get,
          headers: headers,
          body: body,
          queryParameters: queryParameters);

  factory NetworkRequest.put(
          {required String endpoint,
          Map<String, String>? headers,
          Map<String, dynamic>? body,
          Map<String, dynamic>? queryParameters}) =>
      NetworkRequest._(
          endpoint: endpoint,
          type: RequestType.put,
          headers: headers,
          body: body,
          queryParameters: queryParameters);

  factory NetworkRequest.delete(
          {required String endpoint,
          Map<String, String>? headers,
          Map<String, dynamic>? body,
          Map<String, dynamic>? queryParameters}) =>
      NetworkRequest._(
          endpoint: endpoint,
          type: RequestType.delete,
          headers: headers,
          body: body,
          queryParameters: queryParameters);

  factory NetworkRequest.postMultipart(
          {required String endpoint,
          Map<String, String>? headers,
          Map<String, dynamic>? body,
          required List<FileFormData> files,
          Map<String, dynamic>? queryParameters}) =>
      NetworkRequest._(
          endpoint: endpoint,
          type: RequestType.postMultipart,
          headers: headers,
          body: body,
          files: files,
          queryParameters: queryParameters);

  String get url => _endpoint;

  Map<String, String>? get headers => _headers;

  String _makeQuery(Map<String, dynamic>? queryParameters) {
    if (queryParameters == null) return "";

    var result = StringBuffer();
    result.write('?');
    var separator = "";

    void writeParameter(String key, String? value) {
      result.write(separator);
      separator = "&";
      result.write(key);
      if (value != null && value.isNotEmpty) {
        result.write("=");
        result.write(value);
      }
    }

    queryParameters.forEach((key, value) {
      if (value == null || value is String) {
        writeParameter(key, value);
      } else {
        writeParameter(key, value.toString());
        // Iterable values = value;
        // for (String value in values) {
        //   writeParameter(key, value);
        // }
      }
    });
    return result.toString();
  }

  @override
  String toString() => 'NetworkRequest: $url, type: $type';
}

enum RequestType { get, post, put, delete, postMultipart }

const _defaultHeaders = {
  "Accept": "application/json",
  "Content-Type": "application/json; charset=utf-8",
  'Charset': 'utf-8'
};

class FileFormData {
  final Uint8List bytes;
  final String name;

  FileFormData({required this.bytes, required this.name});
}

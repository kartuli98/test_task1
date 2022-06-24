import 'package:http/http.dart';
import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/core/network_client/exception/api_exception.dart';
import 'package:test_to_do/core/network_client/network_client.dart';
import 'package:test_to_do/core/network_client/model/network_response.dart';
import 'package:test_to_do/core/network_client/model/network_request.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DefaultHttpClient extends NetworkClient {
  late ToDoLogger _logger;

  DefaultHttpClient(super.baseUrl, ToDoLogger logger) {
    _logger = logger;
  }

  @override
  Future<NetworkResponse> execureRequest(NetworkRequest request) async {
    final uri = Uri.parse('$baseUrl${request.url}');
    _logger.logInfo('${request.type}: $uri');
    Object? body;
    final b = request.body ?? request.listBody;
    if (b != null) {
      body = json.encode(b);
    }

    try {
      switch (request.type) {
        case RequestType.get:
          final response = await http.get(uri, headers: request.headers);
          return response.toHttpResponse();
        case RequestType.post:
          final response =
              await http.post(uri, headers: request.headers, body: body);
          return response.toHttpResponse();
        case RequestType.put:
          final response =
              await http.put(uri, headers: request.headers, body: body);
          return response.toHttpResponse();
        case RequestType.delete:
          final response =
              await http.delete(uri, headers: request.headers, body: body);
          return response.toHttpResponse();
        case RequestType.postMultipart:
          var multipartRequest = http.MultipartRequest('Post', uri);
          multipartRequest.files.addAll(request.files!.map(
            (e) =>
                http.MultipartFile.fromBytes('file', e.bytes, filename: e.name),
          ));
          var response =
              await http.Response.fromStream(await multipartRequest.send());

          return response.toHttpResponse();
      }
    } on ApiException catch (e) {
      _logger.logError('ApiException: $uri request error: $e, ${e.message}');
      rethrow;
    } catch (e) {
      _logger.logError('Exception: $uri, request error: $e');
      rethrow;
    }
  }
}

extension on Response {
  NetworkResponse toHttpResponse() {
    final stringResponse = utf8.decode(bodyBytes);
    final decodedResponse =
        stringResponse.isNotEmpty ? json.decode(stringResponse) : '';
    final decodedHeaders = Map<String, dynamic>.of(headers);

    if (statusCode != 200 && statusCode != 201) {
      decodedResponse.isNotEmpty
          ? throw ApiException.fromErrorBody(decodedResponse)
          : throw ApiException(
              'Unhandled empty response',
              'Unhandled empty response',
            );
    }
    return NetworkResponse(
        headers: decodedHeaders, body: decodedResponse, statusCode: statusCode);
  }
}

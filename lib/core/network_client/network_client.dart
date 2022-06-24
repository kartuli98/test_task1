import 'package:test_to_do/core/network_client/model/network_request.dart';
import 'package:test_to_do/core/network_client/model/network_response.dart';

abstract class NetworkClient {
  final String baseUrl;

  NetworkClient(this.baseUrl);

  Future<NetworkResponse> execureRequest(NetworkRequest request);
}

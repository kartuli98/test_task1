import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/core/network_client/model/network_request.dart';
import 'package:test_to_do/core/network_client/network_client.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/data/models/todo_model_dto.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';

class RemoteTaskRepositoryImpl implements RemoteTaskRepository {
  static const _pathPost = "tasks";
  static const _pathWithParam = "tasks/";

  final NetworkClient _networkClient;
  final ToDoLogger _logger;

  RemoteTaskRepositoryImpl(this._networkClient, this._logger);

  @override
  Future<void> deleteTask(String id) async {
    final networkRequest =
        NetworkRequest.delete(endpoint: "$_pathWithParam$id");

    await _networkClient.execureRequest(networkRequest);
  }

  @override
  Future<List<TodoModelDto>> getTasks() async {
    final networkRequest = NetworkRequest.get(endpoint: _pathWithParam);
    final remoteTasks =
        await _networkClient.execureRequest(networkRequest).then((response) {
      _logger.logInfo("TaskRepositoryImpl.getTasks response: ${response.body}");
      if (response.body.isEmpty) {
        return <TodoModelDto>[];
      } else {
        final list = <TodoModelDto>[];
        (response.body["data"] as List).forEach((json) {
          list.add(TodoModelDto.fromJson(json));
        });
        return list;
      }
    });
    return remoteTasks;
  }

  @override
  Future<void> postTasks(List<TodoModel> tasks) async {
    Future<Map<String, dynamic>> _requestParametrs(TodoModel t) async {
      Map<String, dynamic> parameters = {
        "taskId": t.taskId,
        "status": t.status,
        "name": t.name,
        "type": t.type,
        "finishDate": t.finishDate,
        "urgent": t.urgent,
      };
      if (t.filePath != null) {
        File file = File(t.filePath!);
        Uint8List filebytes = await file.readAsBytes();
        String bs4str = base64.encode(filebytes);
        parameters["file"] = bs4str;
      }
      if (t.description != null && t.description!.isNotEmpty) {
        parameters["description"] = t.description;
      }
      return parameters;
    }

    final listParameters = await Future.wait(
        tasks.map((task) => _requestParametrs(task)).toList());

    _logger.logInfo('post parameters: $listParameters');
    final networkRequest =
        NetworkRequest.post(listBody: listParameters, endpoint: _pathPost);
    await _networkClient.execureRequest(networkRequest);
  }

  @override
  Future<void> putTask(String id, int status) async {
    final networkRequest = NetworkRequest.put(
        body: {"status": status}, endpoint: "$_pathWithParam$id");
    await _networkClient.execureRequest(networkRequest);
  }
}

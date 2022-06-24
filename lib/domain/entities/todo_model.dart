import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String taskId,
    required int status, // 1- active 2 - completed
    required String name,
    required int type, // 1-work 2 personal
    String? description,
    String? filePath,
    required String finishDate, //date complited
    required int urgent, //0 - no, 1- yes
  }) = _TodoModel;

  factory TodoModel.idle() => const TodoModel(
      taskId: 'idle',
      status: 1,
      name: "Назва завдання...",
      type: 2,
      finishDate: "",
      urgent: 0);
}

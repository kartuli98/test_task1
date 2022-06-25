import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_to_do/core/services/file_handler.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/core/extension/extension.dart';
part 'todo_model_dto.freezed.dart';

part 'todo_model_dto.g.dart';

@freezed
class TodoModelDto with _$TodoModelDto {
  const TodoModelDto._();
  const factory TodoModelDto({
    required String taskId,
    required int status, // 1- active 2 - completed
    required String name,
    required int type, // 1-work 2 personal
    String? description,
    String? file,
    required DateTime finishDate, //date complited
    required int urgent, //0 - no, 1- yes
    required DateTime syncTime, // date synchronization
  }) = _TodoModelDto;

  factory TodoModelDto.fromJson(Map<String, dynamic> json) =>
      _$TodoModelDtoFromJson(json);

  Future<TodoModel> toEntity(FileHandler fileHandler) async {
    String? filePath;
    if (file != null && file!.isNotEmpty) {
      filePath = await fileHandler.saveFile(taskId, file!);
    }
    return TodoModel(
      finishDate: finishDate.toUiString(),
      status: status,
      name: name,
      taskId: taskId,
      type: type,
      urgent: urgent,
      description: description,
      filePath: filePath,
    );
  }
}

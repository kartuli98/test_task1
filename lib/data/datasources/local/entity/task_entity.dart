import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:test_to_do/data/datasources/local/hive_type_id_list.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';

part 'task_entity.g.dart';

@JsonSerializable(createToJson: true)
@HiveType(typeId: HiveTypeIdList.TASK_ENTITY)
class TaskEntity {
  @HiveField(0)
  String taskId;
  @HiveField(1)
  int status;
  @HiveField(2)
  String name;
  @HiveField(3)
  int type;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? filePath;
  @HiveField(6)
  String finishDate;
  @HiveField(7)
  int urgent;

  TaskEntity({
    required this.taskId,
    required this.status, // 1- active 2 - completed
    required this.name,
    required this.type, // 1-work 2 personal
    this.description,
    this.filePath,
    required this.finishDate, //date complited
    required this.urgent, //0 - no, 1- yes
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  factory TaskEntity.fromUiModel(TodoModel model) => TaskEntity(
      taskId: model.taskId,
      status: model.status,
      name: model.name,
      description: model.description,
      filePath: model.filePath,
      type: model.type,
      finishDate: model.finishDate,
      urgent: model.urgent);

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);

  TodoModel toUiModel() => TodoModel(
      taskId: taskId,
      status: status,
      description: description,
      name: name,
      type: type,
      filePath: filePath,
      finishDate: finishDate,
      urgent: urgent);

  TaskEntity copyWith(
      {String? taskId,
      int? status,
      String? name,
      int? type,
      String? description,
      String? filePath,
      String? finishDate,
      int? urgent}) {
    return TaskEntity(
        description: description ?? this.description,
        taskId: taskId ?? this.taskId,
        status: status ?? this.status,
        name: name ?? this.name,
        type: type ?? this.type,
        finishDate: finishDate ?? this.finishDate,
        filePath: filePath ?? this.filePath,
        urgent: urgent ?? this.urgent);
  }

  @override
  String toString() {
    return 'TaskEntity(taskId: $taskId, status: $status, name: $name, type: $type, description: ${description ?? 'null'}, filePath: ${filePath ?? 'null'}, finishDate: $finishDate, urgent: $urgent)';
  }
}

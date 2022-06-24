// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoModelDto _$$_TodoModelDtoFromJson(Map<String, dynamic> json) =>
    _$_TodoModelDto(
      taskId: json['taskId'] as String,
      status: int.parse(json['status']),
      name: json['name'] as String,
      type: int.parse(json['type']) as int,
      description: json['description'] as String?,
      file: json['file'] as String?,
      finishDate: DateTime.parse(json['finishDate'] as String),
      urgent: int.parse(json['urgent']) as int,
      syncTime: DateTime.parse(json['syncTime'] as String),
    );

Map<String, dynamic> _$$_TodoModelDtoToJson(_$_TodoModelDto instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'status': instance.status,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'file': instance.file,
      'finishDate': instance.finishDate.toIso8601String(),
      'urgent': instance.urgent,
      'syncTime': instance.syncTime.toIso8601String(),
    };

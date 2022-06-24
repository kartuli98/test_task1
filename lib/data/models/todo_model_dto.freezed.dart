// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoModelDto _$TodoModelDtoFromJson(Map<String, dynamic> json) {
  return _TodoModelDto.fromJson(json);
}

/// @nodoc
mixin _$TodoModelDto {
  String get taskId => throw _privateConstructorUsedError;
  int get status =>
      throw _privateConstructorUsedError; // 1- active 2 - completed
  String get name => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError; // 1-work 2 personal
  String? get description => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  DateTime get finishDate =>
      throw _privateConstructorUsedError; //date complited
  int get urgent => throw _privateConstructorUsedError; //0 - no, 1- yes
  DateTime get syncTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoModelDtoCopyWith<TodoModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelDtoCopyWith<$Res> {
  factory $TodoModelDtoCopyWith(
          TodoModelDto value, $Res Function(TodoModelDto) then) =
      _$TodoModelDtoCopyWithImpl<$Res>;
  $Res call(
      {String taskId,
      int status,
      String name,
      int type,
      String? description,
      String? file,
      DateTime finishDate,
      int urgent,
      DateTime syncTime});
}

/// @nodoc
class _$TodoModelDtoCopyWithImpl<$Res> implements $TodoModelDtoCopyWith<$Res> {
  _$TodoModelDtoCopyWithImpl(this._value, this._then);

  final TodoModelDto _value;
  // ignore: unused_field
  final $Res Function(TodoModelDto) _then;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? file = freezed,
    Object? finishDate = freezed,
    Object? urgent = freezed,
    Object? syncTime = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      finishDate: finishDate == freezed
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      urgent: urgent == freezed
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as int,
      syncTime: syncTime == freezed
          ? _value.syncTime
          : syncTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoModelDtoCopyWith<$Res>
    implements $TodoModelDtoCopyWith<$Res> {
  factory _$$_TodoModelDtoCopyWith(
          _$_TodoModelDto value, $Res Function(_$_TodoModelDto) then) =
      __$$_TodoModelDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String taskId,
      int status,
      String name,
      int type,
      String? description,
      String? file,
      DateTime finishDate,
      int urgent,
      DateTime syncTime});
}

/// @nodoc
class __$$_TodoModelDtoCopyWithImpl<$Res>
    extends _$TodoModelDtoCopyWithImpl<$Res>
    implements _$$_TodoModelDtoCopyWith<$Res> {
  __$$_TodoModelDtoCopyWithImpl(
      _$_TodoModelDto _value, $Res Function(_$_TodoModelDto) _then)
      : super(_value, (v) => _then(v as _$_TodoModelDto));

  @override
  _$_TodoModelDto get _value => super._value as _$_TodoModelDto;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? file = freezed,
    Object? finishDate = freezed,
    Object? urgent = freezed,
    Object? syncTime = freezed,
  }) {
    return _then(_$_TodoModelDto(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      finishDate: finishDate == freezed
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      urgent: urgent == freezed
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as int,
      syncTime: syncTime == freezed
          ? _value.syncTime
          : syncTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoModelDto extends _TodoModelDto {
  const _$_TodoModelDto(
      {required this.taskId,
      required this.status,
      required this.name,
      required this.type,
      this.description,
      this.file,
      required this.finishDate,
      required this.urgent,
      required this.syncTime})
      : super._();

  factory _$_TodoModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_TodoModelDtoFromJson(json);

  @override
  final String taskId;
  @override
  final int status;
// 1- active 2 - completed
  @override
  final String name;
  @override
  final int type;
// 1-work 2 personal
  @override
  final String? description;
  @override
  final String? file;
  @override
  final DateTime finishDate;
//date complited
  @override
  final int urgent;
//0 - no, 1- yes
  @override
  final DateTime syncTime;

  @override
  String toString() {
    return 'TodoModelDto(taskId: $taskId, status: $status, name: $name, type: $type, description: $description, file: $file, finishDate: $finishDate, urgent: $urgent, syncTime: $syncTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoModelDto &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality()
                .equals(other.finishDate, finishDate) &&
            const DeepCollectionEquality().equals(other.urgent, urgent) &&
            const DeepCollectionEquality().equals(other.syncTime, syncTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(finishDate),
      const DeepCollectionEquality().hash(urgent),
      const DeepCollectionEquality().hash(syncTime));

  @JsonKey(ignore: true)
  @override
  _$$_TodoModelDtoCopyWith<_$_TodoModelDto> get copyWith =>
      __$$_TodoModelDtoCopyWithImpl<_$_TodoModelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoModelDtoToJson(this);
  }
}

abstract class _TodoModelDto extends TodoModelDto {
  const factory _TodoModelDto(
      {required final String taskId,
      required final int status,
      required final String name,
      required final int type,
      final String? description,
      final String? file,
      required final DateTime finishDate,
      required final int urgent,
      required final DateTime syncTime}) = _$_TodoModelDto;
  const _TodoModelDto._() : super._();

  factory _TodoModelDto.fromJson(Map<String, dynamic> json) =
      _$_TodoModelDto.fromJson;

  @override
  String get taskId => throw _privateConstructorUsedError;
  @override
  int get status => throw _privateConstructorUsedError;
  @override // 1- active 2 - completed
  String get name => throw _privateConstructorUsedError;
  @override
  int get type => throw _privateConstructorUsedError;
  @override // 1-work 2 personal
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get file => throw _privateConstructorUsedError;
  @override
  DateTime get finishDate => throw _privateConstructorUsedError;
  @override //date complited
  int get urgent => throw _privateConstructorUsedError;
  @override //0 - no, 1- yes
  DateTime get syncTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TodoModelDtoCopyWith<_$_TodoModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

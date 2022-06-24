// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoModel {
  String get taskId => throw _privateConstructorUsedError;
  int get status =>
      throw _privateConstructorUsedError; // 1- active 2 - completed
  String get name => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError; // 1-work 2 personal
  String? get description => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  String get finishDate => throw _privateConstructorUsedError; //date complited
  int get urgent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res>;
  $Res call(
      {String taskId,
      int status,
      String name,
      int type,
      String? description,
      String? filePath,
      String finishDate,
      int urgent});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res> implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  final TodoModel _value;
  // ignore: unused_field
  final $Res Function(TodoModel) _then;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? filePath = freezed,
    Object? finishDate = freezed,
    Object? urgent = freezed,
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
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      finishDate: finishDate == freezed
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as String,
      urgent: urgent == freezed
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$$_TodoModelCopyWith(
          _$_TodoModel value, $Res Function(_$_TodoModel) then) =
      __$$_TodoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String taskId,
      int status,
      String name,
      int type,
      String? description,
      String? filePath,
      String finishDate,
      int urgent});
}

/// @nodoc
class __$$_TodoModelCopyWithImpl<$Res> extends _$TodoModelCopyWithImpl<$Res>
    implements _$$_TodoModelCopyWith<$Res> {
  __$$_TodoModelCopyWithImpl(
      _$_TodoModel _value, $Res Function(_$_TodoModel) _then)
      : super(_value, (v) => _then(v as _$_TodoModel));

  @override
  _$_TodoModel get _value => super._value as _$_TodoModel;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? filePath = freezed,
    Object? finishDate = freezed,
    Object? urgent = freezed,
  }) {
    return _then(_$_TodoModel(
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
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      finishDate: finishDate == freezed
          ? _value.finishDate
          : finishDate // ignore: cast_nullable_to_non_nullable
              as String,
      urgent: urgent == freezed
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TodoModel implements _TodoModel {
  const _$_TodoModel(
      {required this.taskId,
      required this.status,
      required this.name,
      required this.type,
      this.description,
      this.filePath,
      required this.finishDate,
      required this.urgent});

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
  final String? filePath;
  @override
  final String finishDate;
//date complited
  @override
  final int urgent;

  @override
  String toString() {
    return 'TodoModel(taskId: $taskId, status: $status, name: $name, type: $type, description: ${description ?? 'null'}, filePath: ${filePath ?? 'null'}, finishDate: $finishDate, urgent: $urgent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoModel &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.filePath, filePath) &&
            const DeepCollectionEquality()
                .equals(other.finishDate, finishDate) &&
            const DeepCollectionEquality().equals(other.urgent, urgent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(filePath),
      const DeepCollectionEquality().hash(finishDate),
      const DeepCollectionEquality().hash(urgent));

  @JsonKey(ignore: true)
  @override
  _$$_TodoModelCopyWith<_$_TodoModel> get copyWith =>
      __$$_TodoModelCopyWithImpl<_$_TodoModel>(this, _$identity);
}

abstract class _TodoModel implements TodoModel {
  const factory _TodoModel(
      {required final String taskId,
      required final int status,
      required final String name,
      required final int type,
      final String? description,
      final String? filePath,
      required final String finishDate,
      required final int urgent}) = _$_TodoModel;

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
  String? get filePath => throw _privateConstructorUsedError;
  @override
  String get finishDate => throw _privateConstructorUsedError;
  @override //date complited
  int get urgent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TodoModelCopyWith<_$_TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

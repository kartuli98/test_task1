// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksScreenState {
  TaskFilter get filter => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;
  List<TodoModel> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksScreenStateCopyWith<TasksScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksScreenStateCopyWith<$Res> {
  factory $TasksScreenStateCopyWith(
          TasksScreenState value, $Res Function(TasksScreenState) then) =
      _$TasksScreenStateCopyWithImpl<$Res>;
  $Res call(
      {TaskFilter filter, bool loading, dynamic error, List<TodoModel> tasks});
}

/// @nodoc
class _$TasksScreenStateCopyWithImpl<$Res>
    implements $TasksScreenStateCopyWith<$Res> {
  _$TasksScreenStateCopyWithImpl(this._value, this._then);

  final TasksScreenState _value;
  // ignore: unused_field
  final $Res Function(TasksScreenState) _then;

  @override
  $Res call({
    Object? filter = freezed,
    Object? loading = freezed,
    Object? error = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TaskFilter,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_TasksScreenStateCopyWith<$Res>
    implements $TasksScreenStateCopyWith<$Res> {
  factory _$$_TasksScreenStateCopyWith(
          _$_TasksScreenState value, $Res Function(_$_TasksScreenState) then) =
      __$$_TasksScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TaskFilter filter, bool loading, dynamic error, List<TodoModel> tasks});
}

/// @nodoc
class __$$_TasksScreenStateCopyWithImpl<$Res>
    extends _$TasksScreenStateCopyWithImpl<$Res>
    implements _$$_TasksScreenStateCopyWith<$Res> {
  __$$_TasksScreenStateCopyWithImpl(
      _$_TasksScreenState _value, $Res Function(_$_TasksScreenState) _then)
      : super(_value, (v) => _then(v as _$_TasksScreenState));

  @override
  _$_TasksScreenState get _value => super._value as _$_TasksScreenState;

  @override
  $Res call({
    Object? filter = freezed,
    Object? loading = freezed,
    Object? error = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_$_TasksScreenState(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TaskFilter,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ));
  }
}

/// @nodoc

class _$_TasksScreenState implements _TasksScreenState {
  const _$_TasksScreenState(
      {required this.filter,
      required this.loading,
      required this.error,
      required final List<TodoModel> tasks})
      : _tasks = tasks;

  @override
  final TaskFilter filter;
  @override
  final bool loading;
  @override
  final dynamic error;
  final List<TodoModel> _tasks;
  @override
  List<TodoModel> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksScreenState(filter: $filter, loading: $loading, error: $error, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksScreenState &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filter),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  _$$_TasksScreenStateCopyWith<_$_TasksScreenState> get copyWith =>
      __$$_TasksScreenStateCopyWithImpl<_$_TasksScreenState>(this, _$identity);
}

abstract class _TasksScreenState implements TasksScreenState {
  const factory _TasksScreenState(
      {required final TaskFilter filter,
      required final bool loading,
      required final dynamic error,
      required final List<TodoModel> tasks}) = _$_TasksScreenState;

  @override
  TaskFilter get filter => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  dynamic get error => throw _privateConstructorUsedError;
  @override
  List<TodoModel> get tasks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TasksScreenStateCopyWith<_$_TasksScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

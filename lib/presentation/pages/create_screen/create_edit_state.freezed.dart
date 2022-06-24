// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateEditState {
  TodoModel get todoModel => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateEditStateCopyWith<CreateEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEditStateCopyWith<$Res> {
  factory $CreateEditStateCopyWith(
          CreateEditState value, $Res Function(CreateEditState) then) =
      _$CreateEditStateCopyWithImpl<$Res>;
  $Res call({TodoModel todoModel, bool loading, dynamic error});

  $TodoModelCopyWith<$Res> get todoModel;
}

/// @nodoc
class _$CreateEditStateCopyWithImpl<$Res>
    implements $CreateEditStateCopyWith<$Res> {
  _$CreateEditStateCopyWithImpl(this._value, this._then);

  final CreateEditState _value;
  // ignore: unused_field
  final $Res Function(CreateEditState) _then;

  @override
  $Res call({
    Object? todoModel = freezed,
    Object? loading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      todoModel: todoModel == freezed
          ? _value.todoModel
          : todoModel // ignore: cast_nullable_to_non_nullable
              as TodoModel,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  $TodoModelCopyWith<$Res> get todoModel {
    return $TodoModelCopyWith<$Res>(_value.todoModel, (value) {
      return _then(_value.copyWith(todoModel: value));
    });
  }
}

/// @nodoc
abstract class _$$_CreateEditStateCopyWith<$Res>
    implements $CreateEditStateCopyWith<$Res> {
  factory _$$_CreateEditStateCopyWith(
          _$_CreateEditState value, $Res Function(_$_CreateEditState) then) =
      __$$_CreateEditStateCopyWithImpl<$Res>;
  @override
  $Res call({TodoModel todoModel, bool loading, dynamic error});

  @override
  $TodoModelCopyWith<$Res> get todoModel;
}

/// @nodoc
class __$$_CreateEditStateCopyWithImpl<$Res>
    extends _$CreateEditStateCopyWithImpl<$Res>
    implements _$$_CreateEditStateCopyWith<$Res> {
  __$$_CreateEditStateCopyWithImpl(
      _$_CreateEditState _value, $Res Function(_$_CreateEditState) _then)
      : super(_value, (v) => _then(v as _$_CreateEditState));

  @override
  _$_CreateEditState get _value => super._value as _$_CreateEditState;

  @override
  $Res call({
    Object? todoModel = freezed,
    Object? loading = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_CreateEditState(
      todoModel: todoModel == freezed
          ? _value.todoModel
          : todoModel // ignore: cast_nullable_to_non_nullable
              as TodoModel,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_CreateEditState implements _CreateEditState {
  const _$_CreateEditState(
      {required this.todoModel, required this.loading, required this.error});

  @override
  final TodoModel todoModel;
  @override
  final bool loading;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'CreateEditState(todoModel: $todoModel, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEditState &&
            const DeepCollectionEquality().equals(other.todoModel, todoModel) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todoModel),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_CreateEditStateCopyWith<_$_CreateEditState> get copyWith =>
      __$$_CreateEditStateCopyWithImpl<_$_CreateEditState>(this, _$identity);
}

abstract class _CreateEditState implements CreateEditState {
  const factory _CreateEditState(
      {required final TodoModel todoModel,
      required final bool loading,
      required final dynamic error}) = _$_CreateEditState;

  @override
  TodoModel get todoModel => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  dynamic get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEditStateCopyWith<_$_CreateEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

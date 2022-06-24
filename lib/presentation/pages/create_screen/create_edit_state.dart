import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';

part 'create_edit_state.freezed.dart';

@freezed
class CreateEditState with _$CreateEditState {
  const factory CreateEditState({
    required TodoModel todoModel,
    required bool loading,
    required dynamic error,
  }) = _CreateEditState;
}

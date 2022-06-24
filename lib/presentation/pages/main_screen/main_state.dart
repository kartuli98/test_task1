import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/task_filter.dart';
import '../../../domain/entities/todo_model.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksScreenState with _$TasksScreenState {
  const factory TasksScreenState({
    required TaskFilter filter,
    required bool loading,
    required dynamic error,
    required List<TodoModel> tasks,
  }) = _TasksScreenState;
}


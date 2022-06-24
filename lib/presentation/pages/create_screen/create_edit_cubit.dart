import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/styles.dart';
import 'package:test_to_do/core/di/dependency_provider.dart';
import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/core/navigation/app_navigator.dart';
import 'package:test_to_do/core/observer/task_update_checker.dart';
import 'package:test_to_do/domain/usecases/save_task_usecase.dart';
import 'package:test_to_do/domain/usecases/update_status_usecase.dart';
import 'package:test_to_do/presentation/pages/base_cubit.dart';
import 'package:test_to_do/presentation/pages/create_screen/create_edit_state.dart';
import 'package:test_to_do/core/extension/extension.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/todo_model.dart';
import '../../../domain/usecases/delete_task_usecase.dart';

final TodoModel idleModel = TodoModel.idle();

class CreateEditCubit extends BaseCubit<CreateEditState> {
  final ToDoLogger logger;
  final AppNavigator navigator;

  int customid = 1;
  late DeleteTaskUseCase _deleteTasksUseCase;
  late SaveTasksUseCase _saveTasksUseCase;
  late TaskUpdateChecker _taskUpdateChecker;

  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController nameController = TextEditingController();

  final Uuid uuid = const Uuid();

  bool isNewTask = true;
  TodoModel? initialModel;

  CreateEditCubit(
      this.logger,
      this.navigator,
      DeleteTaskUseCase deleteTasksUseCase,
      SaveTasksUseCase saveTasksUseCase,
      TaskUpdateChecker taskUpdateChecker)
      : super(CreateEditState(
            loading: false, error: null, todoModel: idleModel)) {
    _deleteTasksUseCase = deleteTasksUseCase;
    _saveTasksUseCase = saveTasksUseCase;
    _taskUpdateChecker = taskUpdateChecker;
  }

  void init(TodoModel? model) {
    if (model != null) {
      nameController.text = model.name;
      descriptionController.text = model.description ?? '';
      emit(state.copyWith(todoModel: model));
      isNewTask = false;
      initialModel = model;
    }
  }

  void deleteTask() async {
    await _deleteTasksUseCase(state.todoModel.taskId);
    _taskUpdateChecker.sink.add(MapEntry(state.todoModel.taskId, 'DELETE'));
    navigator.pop();
  }

  void saveTask({bool editing = false}) async {
    final newTask = state.todoModel.copyWith(
      taskId: editing
          ? initialModel!.taskId
          : uuid.v1().characters.reduce((a, b) => '$a${int.tryParse(b) ?? ''}'),
      name: nameController.text,
      description: descriptionController.text.isEmpty ? null : descriptionController.text,
    );
    if (editing && initialModel == newTask) {
      navigator.pop();
    } else {
      if (_fieldValidation(newTask)) {
        await _saveTasksUseCase({newTask.taskId: newTask});
        _taskUpdateChecker.sink.add(MapEntry(newTask.taskId, 'SAVE'));
        navigator.pop();
      } else {
        ScaffoldMessenger.of(DependencyProvider.get<BuildContext>())
            .showSnackBar(SnackBar(
                content: Text(
          'Заповніть поля',
          textAlign: TextAlign.center,
          style: textRegular24.copyWith(color: Colors.red),
        )));
      }
    }
  }

  bool _fieldValidation(TodoModel newTask) {
    return newTask.name.isNotEmpty &&
        newTask.finishDate.isNotEmpty &&
        newTask.name != idleModel.name &&
        state.todoModel != newTask;
  }

  void selectStatus(int status) {
    emit(state.copyWith.todoModel(status: status));
  }

  void toggleUrgent() {
    emit(state.copyWith.todoModel(urgent: state.todoModel.urgent == 1 ? 0 : 1));
  }

  Future<void> setDate() async {
    String modelFinishedDate = state.todoModel.finishDate;
    DateTime today = DateTime.now();
    DateTime? newFinishedDate = await showDatePicker(
        context: DependencyProvider.get<BuildContext>(),
        initialDate: modelFinishedDate.isNotEmpty
            ? modelFinishedDate.toDate()
            : DateTime.now(),
        firstDate: DateTime(today.year, today.month, 1),
        lastDate: DateTime(today.year, today.month + 2, today.day));
    emit(
      state.copyWith.todoModel(
          finishDate: newFinishedDate != null
              ? newFinishedDate.toString().split(' ').first
              : ''),
    );
  }

  @override
  Future<void> close() {
    descriptionController.dispose();
    nameController.dispose();
    return super.close();
  }
}

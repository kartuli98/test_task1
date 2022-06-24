import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/colors.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/presentation/pages/base_page.dart';
import 'package:test_to_do/presentation/widgets/tasks_screen_widgets/tasks_screen_widgets.dart';
import 'package:test_to_do/presentation/widgets/common_widgets/screen_button.dart';

import '../../../core/constants/constants.dart';
import '../../../core/di/dependency_provider.dart';
import 'main_cubit.dart';
import 'main_state.dart';

class TasksScreen extends BasePage<TasksScreenState, TasksScreenCubit> {
  final Map<String,TodoModel> tasks;
  const TasksScreen(this.tasks, {Key? key}) : super(key: key);

  @override
  TasksScreenCubit createBloc() => DependencyProvider.get<TasksScreenCubit>();

  @override
  initBloc(TasksScreenCubit bloc) {
    bloc.init(tasks);
  }

  @override
  Widget buildPage(
      BuildContext context, TasksScreenCubit bloc, TasksScreenState state) {
    List<TodoModel> tasks = bloc.state.tasks;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: mainGradient,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 44,
              child: AppBarFilter(
                onChange: bloc.changeFilter,
                filter: bloc.state.filter,
              )),
          Positioned(
            top: 100,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 40),
                scrollDirection: Axis.vertical,
                itemCount: tasks.length,
                itemBuilder: (_, index) => TaskItemWidget(
                    checkboxTap: bloc.updateStatus,
                    data: tasks[index],
                    onTap: () => bloc.navigateToTask(tasks[index])),
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              right: 30,
              child: ScreenButton(
                onTap: () => bloc.navigateToCreateTask(),
                height: 70,
                width: 70,
                color: AppColorScheme.colorGold,
                radius: 25,
                icon: const Icon(Icons.add),
              ))
        ]),
      ),
    );
  }
}

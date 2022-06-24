import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/colors.dart';
import 'package:test_to_do/config/theme/styles.dart';
import 'package:test_to_do/core/di/dependency_provider.dart';
import 'package:test_to_do/presentation/pages/base_page.dart';
import 'package:test_to_do/presentation/pages/create_screen/create_edit_cubit.dart';
import 'package:test_to_do/presentation/pages/create_screen/create_edit_state.dart';
import 'package:test_to_do/presentation/widgets/common_widgets/screen_button.dart';
import 'package:test_to_do/presentation/widgets/create_screen_widgets/create_screen_widgets.dart';
import 'package:test_to_do/presentation/widgets/create_screen_widgets/nested_image.dart';

import '../../../core/constants/constants.dart';
import '../../../domain/entities/todo_model.dart';
import '../../widgets/common_widgets/custom_checkobox.dart';

class CreateScreen extends BasePage<CreateEditState, CreateEditCubit> {
  final TodoModel? data;
  const CreateScreen({Key? key, this.data}) : super(key: key);

  @override
  CreateEditCubit createBloc() => DependencyProvider.get<CreateEditCubit>();

  @override
  initBloc(CreateEditCubit bloc) => bloc.init(data);

  @override
  Widget buildPage(
      BuildContext context, CreateEditCubit bloc, CreateEditState state) {
    var model = bloc.state.todoModel;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //leadingWidth: 92,
        leading: IconButton(
          onPressed: () => bloc.navigator.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColorScheme.colorGold,
          ),
        ),
        actions: !bloc.isNewTask
            ? [
                IconButton(
                    onPressed: () => bloc.saveTask(editing: true),
                    icon: const Icon(
                      Icons.check,
                      color: AppColorScheme.colorGold,
                    )),
              ]
            : null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: bloc.nameController,
            style: textRegular24,
            maxLength: 15,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: textRegular24,
                hintText: "Назва завдання..."),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: mainGradient,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              SetTypeTodoWidget(
                todoType: model.type == 1 ? TodoType.work : TodoType.personal,
              ),
              const ColumnSeparator(),
              ColumnItemWidget(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 17),
                height: 100,
                child: TextField(
                  controller: bloc.descriptionController,
                  style: textRegular18,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: textRegular18,
                      hintText: "Додати опис..."),
                ),
              ),
              const ColumnSeparator(),
              ColumnItemWidget(
                height: model.filePath != null ? 300 : 50,
                padding: model.filePath != null
                    ? const EdgeInsets.symmetric(horizontal: 34, vertical: 15)
                    : const EdgeInsets.symmetric(
                        horizontal: 34,
                      ),
                child: InkWell(
                  // todo
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: model.filePath != null
                        ? NestedImage(filePath: model.filePath!)
                        : Text(
                            'Прикріпити файл',
                            style: textRegular18,
                          ),
                  ),
                ),
              ),
              const ColumnSeparator(),
              ColumnItemWidget(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: InkWell(
                  onTap: () async {
                    await bloc.setDate();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.finishDate.isNotEmpty
                          ? model.finishDate.toString().split(" ").first
                          : 'Дата завершення:',
                      style: textRegular18,
                    ),
                  ),
                ),
              ),
              const ColumnSeparator(),
              ColumnItemWidget(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 34,
                    ),
                    CustomCheckbox(
                        size: 30,
                        borderColor: AppColorScheme.colorAlto,
                        icon: Icons.circle,
                        iconSize: 16,
                        iconColor: AppColorScheme.colorGold,
                        activeColor: AppColorScheme.colorAlto,
                        backgroundColor: AppColorScheme.colorAlto,
                        isCircle: true,
                        onChange: () {
                          bloc.toggleUrgent();
                        },
                        isChecked: model.urgent == 1),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Термінове',
                      style: textRegular18,
                    ),
                    const SizedBox(
                      width: 54,
                    )
                  ],
                ),
              ),
              const ColumnSeparator(),
              bloc.isNewTask
                  ? ScreenButton(
                      onTap: () => bloc.saveTask(),
                      text: 'Створити',
                      color: AppColorScheme.colorGold,
                      radius: 15,
                      width: 170,
                      height: 50)
                  : ScreenButton(
                      onTap: () => bloc.deleteTask(),
                      text: 'Видалити',
                      color: AppColorScheme.colorVividTangerine,
                      radius: 15,
                      width: 170,
                      height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnSeparator extends StatelessWidget {
  const ColumnSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: 16,
      );
}

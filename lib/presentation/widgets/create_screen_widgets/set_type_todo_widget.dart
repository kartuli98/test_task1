import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/colors.dart';
import 'package:test_to_do/presentation/widgets/common_widgets/custom_checkobox.dart';

import '../../../config/theme/styles.dart';

enum TodoType { work, personal }

class SetTypeTodoWidget extends StatefulWidget {
  final TodoType? todoType;
  const SetTypeTodoWidget({Key? key, this.todoType}) : super(key: key);

  @override
  State<SetTypeTodoWidget> createState() => _SetTypeTodoWidgetState();
}

class _SetTypeTodoWidgetState extends State<SetTypeTodoWidget> {
  TodoType? _todoType;

  @override
  void initState() {
    _todoType = widget.todoType ?? TodoType.personal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorScheme.colorBananaMania,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Expanded(
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
                      setState(() {
                        _todoType = TodoType.work;
                      });
                    },
                    isChecked: _todoType == TodoType.work),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Робочі',
                  style: textRegular18,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                      setState(() {
                        _todoType = TodoType.personal;
                      });
                    },
                    isChecked: _todoType == TodoType.personal),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Особисті',
                  style: textRegular18,
                ),
                const SizedBox(
                  width: 54,
                )
              ],
            ),
          )
          // Expanded(
          //   child: RadioListTile<TodoType>(
          //       activeColor: AppColorScheme.colorGold,
          //       title: Text(
          //         'Робочі',
          //         style: textRegular18,
          //       ),
          //       value: TodoType.work,
          //       groupValue: _todoType,
          //       onChanged: (value) {
          //         setState(() {
          //           _todoType = value;
          //         });
          //       }),
          // ),
          // Expanded(
          //   child: RadioListTile<TodoType>(
          //       activeColor: AppColorScheme.colorGold,
          //       title: Text(
          //         'Особисті',
          //         style: textRegular18,
          //       ),
          //       value: TodoType.personal,
          //       groupValue: _todoType,
          //       onChanged: (value) {
          //         setState(() {
          //           _todoType = value;
          //         });
          //       }),
          // ),
        ],
      ),
    );
  }
}

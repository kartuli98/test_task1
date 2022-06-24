import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/colors.dart';
import 'package:test_to_do/config/theme/styles.dart';
import 'package:test_to_do/domain/entities/todo_model.dart';
import 'package:test_to_do/presentation/widgets/common_widgets/custom_checkobox.dart';

class TaskItemWidget extends StatefulWidget {
  final TodoModel data;
  final void Function() onTap;
  final void Function(String, bool) checkboxTap;
  const TaskItemWidget(
      {Key? key,
      required this.data,
      required this.onTap,
      required this.checkboxTap})
      : super(key: key);

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  bool selected = false;

  @override
  void initState() {
    selected = widget.data.status == 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var uiModel = widget.data;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
        width: 350,
        height: 65,
        decoration: BoxDecoration(
          color: uiModel.urgent == 0
              ? AppColorScheme.colorAlto
              : AppColorScheme.colorVividTangerine,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: uiModel.type == 2
                    ? const Icon(Icons.home_outlined)
                    : const Icon(Icons.work_outline)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 244,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      uiModel.name,
                      style: textRegular16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    uiModel.finishDate.toString().split(' ').first,
                    textAlign: TextAlign.left,
                    style: textRegular11,
                  ),
                ),
              ],
            ),
            CustomCheckbox(
                activeColor: AppColorScheme.colorBananaMania,
                size: 33,
                onChange: () {
                  setState(() {
                    selected = !selected;
                  });
                  widget.checkboxTap(uiModel.taskId, selected);
                },
                isChecked: selected)
            // Transform.scale(
            //   scale: 1.65,
            //   child: Checkbox(
            //       checkColor: AppColorScheme.colorBlack,
            //       activeColor: AppColorScheme.colorBananaMania,
            //       value: selected,
            //       side: const BorderSide(
            //           color: AppColorScheme.colorBlack, width: 1),
            //       splashRadius: null,
            //       shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(5),
            //         ),
            //       ),
            //       onChanged: (value) {
            //         setState(() {
            //           selected = value ?? !selected;
            //         });
            //         widget.checkboxTap(uiModel.taskId, selected);
            //       }),
            // )
          ],
        ),
      ),
    );
  }

  Color _getColor(Set<MaterialState> state) {
    // if (state.contains(MaterialState.pressed)) {
    //   return AppColorScheme.colorBananaMania;
    // } else {
    //   return AppColorScheme.colorBlack;
    // }
    return AppColorScheme.colorBananaMania;
  }
}

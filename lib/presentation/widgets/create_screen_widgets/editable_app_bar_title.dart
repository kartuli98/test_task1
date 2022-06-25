import 'package:flutter/material.dart';
import '../../../config/theme/styles.dart';

class EditableTitle extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const EditableTitle({Key? key, this.controller, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: controller,
          style: textRegular24,
          maxLength: 18,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: textRegular24,
              hintText: hintText ?? "Назва завдання..."),
        ),
      );
}

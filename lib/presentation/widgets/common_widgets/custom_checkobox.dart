import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  double? size;
  double borderRadius;
  double? iconSize;
  Function()? onChange;
  Color? backgroundColor;
  Color? activeColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;
  bool isCircle;

  CustomCheckbox({
    this.borderRadius = 10,
    Key? key,
    this.size,
    this.iconSize,
    this.onChange,
    this.backgroundColor,
    this.activeColor,
    this.iconColor,
    this.icon,
    this.isCircle = false,
    this.borderColor,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Container(
          height: size ?? 28,
          width: size ?? 28,
          decoration: isCircle
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  color: isChecked
                      ? activeColor ?? Colors.blue
                      : backgroundColor ?? Colors.transparent,
                  border: Border.all(color: borderColor ?? Colors.black))
              : BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: isChecked
                      ? activeColor ?? Colors.blue
                      : backgroundColor ?? Colors.transparent,
                  border: Border.all(color: borderColor ?? Colors.black)),
          child: isChecked
              ? Icon(
                  icon ?? Icons.check,
                  color: iconColor ?? Colors.black,
                  size: iconSize ?? 20,
                )
              : null),
    );
  }
}

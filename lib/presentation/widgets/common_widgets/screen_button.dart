import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/styles.dart';

class ScreenButton extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final double radius;
  final Icon? icon;
  final String? text;
  final double width;
  final double height;

  const ScreenButton(
      {Key? key,
      required this.color,
      required this.radius,
      this.icon,
      this.text,
      required this.width,
      required this.height,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Align(
            alignment: Alignment.center,
            child: icon ?? Text(text ?? "", style: textRegular24),
          ),
        ),
      );
}

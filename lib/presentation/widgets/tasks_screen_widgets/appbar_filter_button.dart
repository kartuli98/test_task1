import 'package:flutter/cupertino.dart';
import 'package:test_to_do/config/theme/colors.dart';

class AppBarFiltersButton extends StatelessWidget {
  final void Function() onTap;
  final double width;
  final bool selected;
  final double height;
  final Widget? child;
  final double radius;
  const AppBarFiltersButton(
      {Key? key,
      this.child,
      this.width = 106,
      this.height = 50,
      this.radius = 25,
      required this.onTap,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColorScheme.colorBlack.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
          color: selected
              ? AppColorScheme.colorBananaMania
              : AppColorScheme.colorAlto,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../config/theme/colors.dart';

class ColumnItemWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double height;
  final Widget? child;
  const ColumnItemWidget({Key? key, this.child, this.height = 50, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: AppColorScheme.colorBananaMania,
      height: height,
      width: MediaQuery.of(context).size.width,
      child: child
    );
  }
}

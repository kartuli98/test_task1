import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../config/theme/styles.dart';

class NestedImage extends StatelessWidget {
  final String filePath;
  const NestedImage({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Вкладене зображення',
          style: textRegular18,
        ),
        const SizedBox(
          height: 13,
        ),
        Image.file(
          File(filePath),
          alignment: Alignment.centerLeft,
          width: 236,
          height: 236,
        ),
      ],
    );
  }
}

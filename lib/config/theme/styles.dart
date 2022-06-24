import 'package:flutter/cupertino.dart';
import 'package:test_to_do/config/theme/colors.dart';

TextStyle _text = const TextStyle(
    fontStyle: FontStyle.normal,
    color: AppColorScheme.colorBlack,
    fontFamily: 'SfUiDisplay');

final textRegular = _text.copyWith(fontWeight: FontWeight.w500);

final textRegular24 = textRegular.copyWith(fontSize: 24.0);
final textRegular18 = textRegular.copyWith(fontSize: 18);
final textRegular16 =
    textRegular.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
final textRegular11 =
    textRegular.copyWith(fontSize: 11, fontWeight: FontWeight.w600);

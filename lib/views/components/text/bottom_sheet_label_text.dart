import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class BottomSheetLabelText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const BottomSheetLabelText({super.key, required this.text, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text.tr,
        textAlign: textAlign,
        style: interRegularDefault.copyWith(
            color: MyColor.colorBlack, fontWeight: FontWeight.w500));
  }
}

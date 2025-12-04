import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class LabelText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final bool required;
  final Color textColor;

  const LabelText(
      {super.key,
      required this.text,
      this.textAlign,
      this.textStyle,
      this.textColor = MyColor.labelTextColor,
      this.required = false});

  @override
  Widget build(BuildContext context) {
    return required
        ? Row(
            children: [
              Text(text.tr,
                  textAlign: textAlign,
                  style: textStyle ??
                      interRegularDefault.copyWith(
                          color: MyColor.getLabelTextColor())),
              const SizedBox(
                width: 2,
              ),
              Text(
                '*',
                style: interSemiBoldDefault.copyWith(color: MyColor.colorRed),
              )
            ],
          )
        : Text(
            text.tr,
            textAlign: textAlign,
            style: textStyle ??
                interSemiBoldDefault.copyWith(color: MyColor.colorBlack),
          );
  }
}

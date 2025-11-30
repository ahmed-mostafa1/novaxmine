import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle textStyle;
  final Color textColor;
  const SmallText({super.key, required this.text, this.textAlign, this.textStyle = interRegularSmall, this.textColor = MyColor.labelTextColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle.copyWith(color: textColor),
    );
  }
}

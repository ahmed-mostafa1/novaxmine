import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mine_lab/core/utils/my_color.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double width;
  final double horizontalPadding;
  final double verticalPadding;
  final double cornerRadius;
  final bool isOutlined;
  final bool isColorChange;
  final bool hasCornerRadius;
  final bool isLoading;

  const RoundedButton({super.key, this.isColorChange = false, this.hasCornerRadius = false, this.isLoading = false, this.width = 1, this.cornerRadius = 6, required this.text, required this.press, this.isOutlined = false, this.horizontalPadding = 35, this.verticalPadding = 18, this.color = MyColor.primaryColor, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isOutlined
        ? Material(
            child: InkWell(
              onTap: press,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                width: size.width * width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(cornerRadius), color: color),
                child: isLoading ? SpinKitCircle(color: MyColor.colorWhite, size: 20) : Center(child: Text(text, style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500))),
              ),
            ),
          )
        : SizedBox(width: size.width * width, child: ClipRRect(borderRadius: BorderRadius.circular(cornerRadius), child: newElevatedButton()));
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(backgroundColor: color, shadowColor: MyColor.transparentColor, padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding), textStyle: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cornerRadius))),
      child: isLoading ? SpinKitCircle(color: MyColor.colorWhite, size: 20) : Text(text, style: TextStyle(color: textColor)),
    );
  }
}

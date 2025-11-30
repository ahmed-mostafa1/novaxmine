import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/styles.dart';

import '../../../core/utils/my_color.dart';
import '../divider/custom_divider.dart';

class CustomRow extends StatelessWidget {
  final String firstText, lastText;
  final bool isStatus, isAbout, showDivider;
  final Color? statusTextColor;
  final bool hasChild;
  final Widget? child;
  final TextStyle? first, last;

  const CustomRow({
    super.key,
    this.child,
    this.hasChild = false,
    this.statusTextColor,
    required this.firstText,
    required this.lastText,
    this.isStatus = false,
    this.isAbout = false,
    this.showDivider = true,
    this.first,
    this.last,
  });

  @override
  Widget build(BuildContext context) {
    return hasChild
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    firstText.tr,
                    style: first ?? interRegularDefault.copyWith(color: MyColor.getTextColor()),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
                  child ?? const SizedBox(),
                ],
              ),
              const SizedBox(height: 5),
              showDivider ? const Divider(color: MyColor.colorGrey) : const SizedBox(),
              showDivider ? const SizedBox(height: 5) : const SizedBox(),
            ],
          )
        : isAbout
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstText.tr, style: first ?? interRegularDefault.copyWith(color: MyColor.colorBlack)),
                  const SizedBox(height: 4),
                  Text(
                    lastText.tr,
                    style: last ?? interRegularDefault.copyWith(fontFamily: "Inter", color: isStatus ? statusTextColor : MyColor.bodyTextColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(firstText.tr, style: first ?? interRegularDefault.copyWith(color: MyColor.colorBlack), overflow: TextOverflow.ellipsis, maxLines: 1)),
                      //  isStatus ? StatusWidget(status: lastText, color: MyColor.greenP,) :
                      Flexible(
                          child: Text(
                        lastText.tr,
                        maxLines: 2,
                        style: interRegularDefault.copyWith(color: isStatus ? MyColor.greenSuccessColor : MyColor.bodyTextColor),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ))
                    ],
                  ),
                  const SizedBox(height: 5),
                  showDivider ? const CustomDivider() : const SizedBox(),
                  showDivider ? const SizedBox(height: 5) : const SizedBox(),
                ],
              );
  }
}

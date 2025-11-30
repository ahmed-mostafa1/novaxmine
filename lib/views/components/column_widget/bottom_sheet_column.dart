import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/styles.dart';
import '../../../../../../../core/utils/my_color.dart';

class BottomSheetColumn extends StatelessWidget {
  final bool isCharge;
  final String header;
  final String body;
  final bool alignmentEnd;

  const BottomSheetColumn({super.key, this.isCharge = false, this.alignmentEnd = false, required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignmentEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          header.tr,
          style: interRegularDefault.copyWith(color: MyColor.colorGrey, fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          body.tr,
          style: isCharge ? interRegularDefault.copyWith(fontFamily: "Inter", color: MyColor.redCancelTextColor) : interRegularDefault.copyWith(fontFamily: "Inter", color: MyColor.colorBlack),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

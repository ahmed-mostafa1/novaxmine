import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class DepositeCancelButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DepositeCancelButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed ?? Get.back,
        child: Text(
          'Cancel',
          style: interMediumLarge.copyWith(
            color: MyColor.colorWhite,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

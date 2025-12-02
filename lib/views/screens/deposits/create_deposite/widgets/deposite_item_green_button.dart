import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_theme_extension.dart';

class DepositeItemGreenButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const DepositeItemGreenButton({
    super.key,
    this.label = 'Deposite with BSC',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: context.depositPrimaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: interMediumLarge.copyWith(
            color: context.depositPrimaryButtonTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

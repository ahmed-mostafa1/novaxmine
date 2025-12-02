import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_theme_extension.dart';

class DepositeConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String title;
  const DepositeConfirmButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    required this.title,
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
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.depositPrimaryButtonTextColor,
                  ),
                ),
              )
            : Text(
                title,
                style: interMediumLarge.copyWith(
                  color: context.depositPrimaryButtonTextColor,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}

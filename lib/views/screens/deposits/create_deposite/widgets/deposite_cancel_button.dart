import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_theme_extension.dart';

class DepositeCancelButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DepositeCancelButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: context.depositSecondaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed ?? Get.back,
        child: Text(
          strings?.cancel ?? 'Cancel',
          style: interMediumLarge.copyWith(
            color: context.depositSecondaryButtonTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

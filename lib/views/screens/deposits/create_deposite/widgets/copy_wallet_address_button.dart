import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_theme_extension.dart';

class CopyWalletAddressButton extends StatelessWidget {
  final String address;

  const CopyWalletAddressButton({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: 65,
        padding: const EdgeInsetsDirectional.only(start: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.depositBorderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  address,
                  style: interMediumDefault.copyWith(
                    fontSize: 14,
                    fontFamily: 'monospace',
                    color: context.depositPrimaryTextColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.depositCopyButtonBorderColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(8),
                    bottomEnd: Radius.circular(8),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: address,
                      ),
                    );
                    Get.snackbar(
                      strings?.copied ?? 'Copied',
                      strings?.copiedToClipBoard ??
                          'Wallet Address copied to clipboard',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                      margin: EdgeInsets.only(
                        bottom: 24,
                        left: 12,
                        right: 12,
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      strings?.copy ?? 'Copy',
                      style: interMediumDefault.copyWith(
                        fontSize: 14,
                        color: context.depositCopyButtonTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

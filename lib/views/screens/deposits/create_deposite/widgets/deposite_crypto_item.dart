import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/l10n/app_localizations.dart';

import 'deposite_item_blue_container_with_text.dart';
import 'deposite_item_green_button.dart';

class DepositeCryptoItem extends StatelessWidget {
  final String coinTitle;
  final String coinSubtitle;
  final String withdrawAddress;
  final VoidCallback? onDepositPressed;

  const DepositeCryptoItem({
    super.key,
    required this.coinTitle,
    required this.coinSubtitle,
    required this.withdrawAddress,
    this.onDepositPressed,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 250),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width * .7,
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        color: MyColor.colorWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coinTitle,
            style: interMediumOverLarge,
          ),
          const SizedBox(height: 8),
          DepositeItemBlueContainerWithText(text: coinSubtitle),
          const SizedBox(height: 16),
          Text(
            strings?.withdrawAddress ?? 'Withdraw Address:',
            style: interMediumLarge.copyWith(
              color: MyColor.bodyTextColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            withdrawAddress,
            style: interMediumLarge.copyWith(
              color: MyColor.bodyTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          DepositeItemGreenButton(
            label:
                '${strings?.depositWith ?? 'Deposit with'} ${coinTitle.toUpperCase()}',
            onPressed: onDepositPressed,
          ),
        ],
      ),
    );
  }
}

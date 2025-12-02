import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_theme_extension.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/copy_wallet_address_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_cancel_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_confirm_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/sliver_sticky_footer.dart';

class DepositeInstructionsScreen extends StatelessWidget {
  final String defaultCoinTitle;
  final String defaultCoinSubtitle;
  final String defaultWithdrawAddress;
  final int? defaultCoinWalletId;

  const DepositeInstructionsScreen({
    super.key,
    this.defaultCoinTitle = 'BSC',
    this.defaultCoinSubtitle = 'BEP20',
    this.defaultWithdrawAddress = '0xd4fd873d88b20155064ab799027baeb16e1a3f',
    this.defaultCoinWalletId,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final coinTitle = arguments?['coinTitle'] ?? defaultCoinTitle;
    final coinSubtitle = arguments?['coinSubtitle'] ?? defaultCoinSubtitle;
    final withdrawAddress =
        arguments?['withdrawAddress'] ?? defaultWithdrawAddress;
    final walletId = arguments?['walletId'] as int? ?? defaultCoinWalletId;
    final networkLabel = '$coinTitle ($coinSubtitle)';
    final strings = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: context.depositScaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  strings?.depositInstructions ?? 'Deposit Instructions',
                  style: interSemiBoldDefault.copyWith(
                    fontSize: 20,
                    color: context.depositPrimaryTextColor,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: RichText(
                  text: TextSpan(
                    text: '${strings?.youHaveSelected ?? 'You have selected'} ',
                    style: interMediumDefault.copyWith(
                      fontSize: 18,
                      color: context.depositSecondaryTextColor,
                    ),
                    children: [
                      TextSpan(
                        text: coinTitle,
                        style: interBoldDefault.copyWith(
                          fontSize: 18,
                          color: context.depositPrimaryTextColor,
                        ),
                      ),
                      TextSpan(
                        text: ' ($coinSubtitle).',
                        style: interMediumDefault.copyWith(
                          fontSize: 18,
                          color: context.depositSecondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 24),
              ),
              SliverToBoxAdapter(
                child: Text(
                  strings?.sendAmountMsg ??
                      'Please send the desired amount to the wallet address below, then click "I Have Transferred".',
                  style: interMediumDefault.copyWith(
                    fontSize: 16,
                    color: context.depositPrimaryTextColor,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 16),
              ),
              CopyWalletAddressButton(address: withdrawAddress),
              SliverToBoxAdapter(
                child: const SizedBox(height: 24),
              ),
              SliverToBoxAdapter(
                child: Text(
                  strings?.doubleCheckMsg ??
                      'Make sure to double-check the address and network before sending. Transactions cannot be reversed.',
                  style: interMediumDefault.copyWith(
                    fontSize: 15,
                    color: context.depositSecondaryTextColor,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 32),
              ),
              SliverStickyFooter(
                bottomPadding: 24,
                children: [
                  DepositeCancelButton(
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 12),
                  DepositeConfirmButton(
                    title: AppLocalizations.of(context)?.iHaveTransferred ??
                        'I Have Transferred',
                    onPressed: () {
                      Get.offNamed(
                        RouteHelper.confirmDepositScreen,
                        arguments: {
                          'network': networkLabel,
                          'walletAddress': withdrawAddress,
                          'walletId': walletId,
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

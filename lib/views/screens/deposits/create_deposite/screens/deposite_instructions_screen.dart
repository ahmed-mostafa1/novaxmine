import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/copy_wallet_address_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_cancel_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_confirm_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/sliver_sticky_footer.dart';

class DepositeInstructionsScreen extends StatelessWidget {
  const DepositeInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Deposit Instructions',
                  style: interSemiBoldDefault.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: RichText(
                  text: TextSpan(
                    text: 'You have selected ',
                    style: interMediumDefault.copyWith(
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: 'BSC',
                        style: interBoldDefault.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' (BEP20).',
                      ),
                    ],
                  ),
                ),
              ),

// 24dp spacing
              SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),

// Instruction text
              SliverToBoxAdapter(
                child: Text(
                  'Please send the desired amount to the wallet address below, then click "I Have Transferred".',
                  style: interMediumDefault.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),

// 24dp spacing
              SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),

// Wallet address container with copy button
              const CopyWalletAddressButton(),

// 24dp spacing
              SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),

// Warning text (faded)
              SliverToBoxAdapter(
                child: Text(
                  'Make sure to double-check the address and network before sending. Transactions cannot be reversed.',
                  style: interMediumDefault.copyWith(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              // 24dp spacing
              SliverToBoxAdapter(
                child: SizedBox(height: 32),
              ),

              SliverStickyFooter(
                bottomPadding: 24,
                children: [
                  DepositeCancelButton(
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: 12),
                  DepositeConfirmButton(
                    onPressed: () {
                      // Handle confirmation
                      Get.defaultDialog(
                        title: "Success",
                        middleText: "Transfer confirmed successfully!",
                        textConfirm: "OK",
                        onConfirm: () => Get.back(),
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

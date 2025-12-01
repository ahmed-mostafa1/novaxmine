import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
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
              SliverToBoxAdapter(
                child: Container(
                  height: 65,
                  padding: EdgeInsets.only(
                    left: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey[300]!,
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
                            '0xd4fd873d88b20155064ab799027baeb16e1a3f',
                            style: interMediumDefault.copyWith(
                              fontSize: 14,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(.5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                          child: InkWell(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(
                                    text:
                                        '0xd4fd873d88b20155064ab799027baeb16e1a3f'),
                              );
                              Get.snackbar(
                                'Copied',
                                'Wallet Address copied to clipboard',
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 3),
                                padding: EdgeInsets.only(bottom: 20),
                              );
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Copy',
                                style: interMediumDefault.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

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

// deposite_cancel_button.dart
class DepositeCancelButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DepositeCancelButton({
    super.key,
    this.onPressed,
  });

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
        onPressed: onPressed ?? () => Get.back(),
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

// deposite_confirm_button.dart
class DepositeConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DepositeConfirmButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: MyColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'I Have Transferred',
          style: interMediumLarge.copyWith(
            color: MyColor.colorWhite,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

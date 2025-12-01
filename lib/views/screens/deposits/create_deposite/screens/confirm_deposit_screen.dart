import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/confirm_deposit_field.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_cancel_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_confirm_button.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/sliver_sticky_footer.dart';

class ConfirmDepositScreen extends StatefulWidget {
  final String network;
  final String walletAddress;

  const ConfirmDepositScreen({
    super.key,
    this.network = 'BSC (BEP20)',
    this.walletAddress = '0xd4fd873d88b20155064ab799027baeb16e1a3f',
  });

  @override
  State<ConfirmDepositScreen> createState() => _ConfirmDepositScreenState();
}

class _ConfirmDepositScreenState extends State<ConfirmDepositScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _transactionIdController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _transactionIdController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitConfirmation() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    Get.defaultDialog(
      title: 'Confirmation Submitted',
      middleText:
          'Your deposit confirmation is being reviewed. We will notify you soon.',
      textConfirm: 'OK',
      confirmTextColor: MyColor.colorWhite,
      onConfirm: Get.back,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final selectedNetwork = args?['network'] as String? ?? widget.network;
    final walletAddress =
        args?['walletAddress'] as String? ?? widget.walletAddress;

    return Scaffold(
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
                  'Confirm Your Deposit',
                  style: interSemiBoldDefault.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConfirmDepositField(
                        label: 'Selected Network',
                        initialValue: selectedNetwork,
                        enabled: false,
                      ),
                      const SizedBox(height: 16),
                      ConfirmDepositField(
                        label: 'Wallet Address',
                        initialValue: walletAddress,
                        enabled: false,
                        maxLines: null,
                      ),
                      const SizedBox(height: 16),
                      ConfirmDepositField(
                        label: 'Transaction ID / Hash',
                        controller: _transactionIdController,
                        hintText: 'Enter your transaction hash',
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the transaction hash';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ConfirmDepositField(
                        label: 'Amount Transferred',
                        controller: _amountController,
                        hintText: 'Enter transferred amount',
                        isRequired: true,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the amount';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Amount must be numeric';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Enter the amount in the same coin / network you transferred.',
                        style: interMediumDefault.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverStickyFooter(
                bottomPadding: 24,
                children: [
                  DepositeCancelButton(
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(height: 12),
                  DepositeConfirmButton(
                    onPressed: _submitConfirmation,
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

import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/dimensions.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class CreateDepositeScreen extends StatelessWidget {
  const CreateDepositeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.screenBgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: MyColor.primaryColor,
        title: Text(
          'Deposit via Crypto Coins',
          style: interBoldMediumLarge.copyWith(
            color: MyColor.colorWhite,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: 15,
        itemBuilder: (context, index) {
          return DepositeCryptoItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
      )),
    );
  }
}

class DepositeCryptoItem extends StatelessWidget {
  const DepositeCryptoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 250),
      padding: EdgeInsets.all(16),
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
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BSC',
            style: interMediumOverLarge,
          ),
          SizedBox(
            height: 8,
          ),
          DepositeItemBlueContainerWithText(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Withdraw Address: ',
            style: interMediumLarge.copyWith(
              color: MyColor.bodyTextColor,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '0xd4fd873d88b20155064ab799027baeb16e1a3f12',
            style: interMediumLarge.copyWith(
              color: MyColor.bodyTextColor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          DepositeItemGreenButton(),
        ],
      ),
    );
  }
}

class DepositeItemGreenButton extends StatelessWidget {
  const DepositeItemGreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          backgroundColor: MyColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Deposite with BSC',
          style: interMediumLarge.copyWith(
            color: MyColor.colorWhite,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class DepositeItemBlueContainerWithText extends StatelessWidget {
  const DepositeItemBlueContainerWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 35,
      decoration: BoxDecoration(
        color: Color(0xff0D6EFD),
        borderRadius: BorderRadius.circular(
          Dimensions.defaultRadius,
        ),
      ),
      child: Center(
        child: Text(
          'BEP20',
          style: interBoldDefault.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

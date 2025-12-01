import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/widgets/deposite_crypto_item.dart';

class CreateDepositeScreen extends StatelessWidget {
  const CreateDepositeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final depositOptions = [
      {
        'title': 'BSC',
        'subtitle': 'BEP20',
        'address': '0xd4fd873d88b20155064ab799027baeb16e1a3f',
      },
      {
        'title': 'ETH',
        'subtitle': 'ERC20',
        'address': '0x8612ab0f8239c10fb2aa9d67dd7d34545671e4bd',
      },
      {
        'title': 'TRX',
        'subtitle': 'TRC20',
        'address': 'TPt81b1f3fd31234b1b8c29aa6e61e96e76',
      },
    ];

    return Scaffold(
      backgroundColor: MyColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Color(0xff212121),
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
        itemCount: depositOptions.length,
        itemBuilder: (context, index) {
          final option = depositOptions[index];
          return DepositeCryptoItem(
            coinTitle: option['title']!,
            coinSubtitle: option['subtitle']!,
            withdrawAddress: option['address']!,
            onDepositPressed: () {
              Get.toNamed(
                RouteHelper.depositeInstructionsScreen,
                arguments: {
                  'coinTitle': option['title'],
                  'coinSubtitle': option['subtitle'],
                  'withdrawAddress': option['address'],
                },
              );
            },
          );
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

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/dimensions.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/data/model/deposit/deposit_method_response_model.dart';
import 'package:mine_lab/views/components/image/my_image_widget.dart';

class PaymentMethodCard extends StatelessWidget {
  final VoidCallback press;
  AppPaymentGateway paymentMethod;
  final String assetPath;
  bool selected = false;
  PaymentMethodCard(
      {super.key,
      required this.press,
      required this.paymentMethod,
      required this.assetPath,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 10),
        child: Material(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.space10),
            side: BorderSide(
                color: selected ? MyColor.primaryColor : MyColor.borderColor),
          ),
          color: Colors.white,
          child: CheckboxListTile(
            value: selected,
            checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.space10)),
            onChanged: (val) {
              press();
            },
            contentPadding: const EdgeInsetsDirectional.only(
                start: Dimensions.space20,
                end: Dimensions.space20,
                top: 1,
                bottom: 1),
            activeColor: MyColor.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyImageWidget(
                  imageUrl: '$assetPath/${paymentMethod.method?.image}',
                  width: Dimensions.space40,
                  height: Dimensions.space40,
                  boxFit: BoxFit.fitWidth,
                  radius: 4,
                ),
                const SizedBox(width: Dimensions.space10),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(paymentMethod.name ?? '',
                      style: interSemiBoldDefault.copyWith(
                          color: MyColor.colorBlack),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/dimensions.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class MinerCardItem extends StatefulWidget {
  final String image;
  final String title;
  final String bottomTitle;
  final String data;
  final bool isNetWorkImage;
  final void Function()? onTap;

  const MinerCardItem({
    super.key,
    required this.image,
    required this.title,
    required this.data,
    required this.bottomTitle,
    this.isNetWorkImage = false,
    this.onTap,
  });

  @override
  State<MinerCardItem> createState() => _MinerCardItemState();
}

class _MinerCardItemState extends State<MinerCardItem> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(Dimensions.space10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColor.colorWhite,
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.image != "-1") ...[
                  Container(
                    padding: EdgeInsets.all(Dimensions.space15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.image), fit: BoxFit.fill)),
                  ),
                  const SizedBox(width: Dimensions.space10),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.title,
                          style: interRegularDefault.copyWith(
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: Dimensions.space5),
                      Text(widget.data,
                          style: interRegularLarge.copyWith(
                              fontWeight: FontWeight.w600),
                          maxLines: 2),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.space10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.bottomTitle,
                    style: interRegularDefault.copyWith(
                        fontWeight: FontWeight.w600)),
                SizedBox(width: Dimensions.space10),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(Dimensions.space5 - 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.primaryColor,
                  ),
                  child: Icon(Icons.arrow_forward_ios,
                      size: 14, color: MyColor.colorWhite),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
/**
 * Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.image != "-1") ...[
                Container(
                  padding: EdgeInsets.all(Dimensions.space15),
                  decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.fill)),
                ),
                const SizedBox(width: Dimensions.space5),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.title, style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                    const SizedBox(height: Dimensions.space5),
                    Text(widget.data, style: interRegularLarge.copyWith(fontWeight: FontWeight.w600), maxLines: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        InkWell(
                          onTap: widget.onTap,
                          customBorder: CircleBorder(),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.all(Dimensions.space5 - 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.primaryColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: MyColor.colorWhite,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mine_lab/core/utils/my_color.dart';

import 'indicator/indicator.dart';

class CustomLoader extends StatelessWidget {
  final bool isFullScreen;
  final bool isPagination, isCustom;
  final double strokeWidth, height, width;
  final Color loaderColor;

  const CustomLoader({
    super.key,
    this.isFullScreen = false,
    this.isPagination = false,
    this.isCustom = false,
    this.strokeWidth = 1,
    this.loaderColor = MyColor.primaryColor,
    this.height = 200,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return isCustom
        ? SizedBox(
            height: height,
            width: width,
            child: SpinKitCubeGrid(
              color: loaderColor,
            ),
          )
        : isFullScreen
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(child: LoadingIndicator()),
              )
            : isPagination
                ? Center(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: LoadingIndicator(strokeWidth: strokeWidth)))
                : const Center(child: LoadingIndicator());
  }
}

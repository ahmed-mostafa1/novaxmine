import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUtils {
  static void splashScreenUtil() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyColor.primaryColor, statusBarIconBrightness: Brightness.light, systemNavigationBarColor: MyColor.primaryColor, systemNavigationBarIconBrightness: Brightness.dark));
  }

  static dynamic getCardShadow() {
    return [
      BoxShadow(
        color: MyColor.getShadowColor().withValues(alpha: 0.05),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 3),
      ),
    ];
  }

  static void allScreenUtil() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyColor.primaryColor, statusBarIconBrightness: Brightness.light, systemNavigationBarColor: MyColor.screenBgColor, systemNavigationBarIconBrightness: Brightness.dark));
  }

  static dynamic getShadow2({double blurRadius = 8}) {
    return [
      BoxShadow(
        color: MyColor.getShadowColor().withValues(alpha: 0.3),
        blurRadius: blurRadius,
        spreadRadius: 3,
        offset: const Offset(0, 10),
      ),
      BoxShadow(
        color: MyColor.getShadowColor().withValues(alpha: 0.3),
        spreadRadius: 1,
        blurRadius: blurRadius,
        offset: const Offset(0, 1),
      ),
    ];
  }

  static dynamic getBottomSheetShadow() {
    return [
      BoxShadow(
        color: Colors.grey.shade400.withValues(alpha: 0.08),
        spreadRadius: 3,
        blurRadius: 4,
        offset: const Offset(0, 3),
      ),
    ];
  }

  static dynamic getShadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return [
      BoxShadow(
        blurRadius: blurRadius ?? 15.0,
        offset: offset ?? const Offset(0, 25),
        color: color ?? Colors.grey.shade500.withValues(alpha: 0.6),
        spreadRadius: spreadRadius ?? -35.0,
      ),
    ];
  }

  static void authScreenUtils() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyColor.primaryColor, statusBarIconBrightness: Brightness.dark, systemNavigationBarColor: MyColor.screenBgColor, systemNavigationBarIconBrightness: Brightness.dark));
  }

  static makePortraitOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static makePortraitAndLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static Future<void> launchUrlToBrowser(String downloadUrl) async {
    try {
      final Uri url = Uri.parse(downloadUrl);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      printX(e.toString());
    }
  }

  static String getMaskedMail(String email) {
    try {
      List<String> tempList = email.split('@');
      int maskLength = tempList[0].length;
      String maskValue = tempList[0][0].padRight(maskLength, '*');
      String value = '$maskValue@${tempList[1]}';
      return value;
    } catch (e) {
      return email;
    }
  }

  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 2) {
      // Not a valid phone number
      return phoneNumber;
    }

    int start = (phoneNumber.length ~/ 2) - 2; // Finding the starting index of the middle digits
    int end = start + 4; // Determining the ending index of the middle digits

    // Masking the middle digits with asterisks
    String maskedDigits = '*' * (end - start);

    // Constructing the masked phone number
    return phoneNumber.replaceRange(start, end, maskedDigits);
  }
}

void printX(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

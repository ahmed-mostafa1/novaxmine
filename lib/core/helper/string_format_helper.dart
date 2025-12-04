import 'package:get/get_utils/get_utils.dart';

class MyConverter {
  static String roundDoubleAndRemoveTrailingZero(String value) {
    try {
      double number = double.parse(value);
      String b = number.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');
      return b;
    } catch (e) {
      return value;
    }
  }

  static String twoDecimalPlaceFixedWithoutRounding(String value,
      {int precision = 4}) {
    try {
      double number = double.parse(value);
      String b = number.toStringAsFixed(precision);
      return b;
    } catch (e) {
      return value;
    }
  }

  static String formatNumber(String value, {int precision = 2}) {
    try {
      double number = double.parse(value);
      String b = number.toStringAsFixed(precision);
      return b;
    } catch (e) {
      return value;
    }
  }

  static String sum(String first, String last, {int precision = 2}) {
    double firstNum = double.tryParse(first) ?? 0;
    double secondNum = double.tryParse(last) ?? 0;
    double result = firstNum + secondNum;
    String total = formatNumber(result.toString(), precision: precision);
    return total;
  }

  static String removeQuotationAndSpecialCharacterFromString(String value) {
    try {
      String formatedString =
          value.replaceAll('"', '').replaceAll('[', '').replaceAll(']', '');
      return formatedString;
    } catch (e) {
      return value;
    }
  }

  static String replaceUnderscoreWithSpace(String value) {
    try {
      String formatedString = value.replaceAll('_', ' ');
      String v =
          formatedString.split(" ").map((str) => str.capitalize).join(" ");
      return v;
    } catch (e) {
      return value;
    }
  }

  static String getTrailingExtension(int number) {
    List<String> list = [
      'th',
      'st',
      'nd',
      'rd',
      'th',
      'th',
      'th',
      'th',
      'th',
      'th'
    ];
    if (((number % 100) >= 11) && ((number % 100) <= 13)) {
      return '${number}th';
    } else {
      int value = (number % 10).toInt();
      return '$number${list[value]}';
    }
  }

  static String getFormatedDateWithStatus(String inputValue) {
    String value = inputValue;
    try {
      var list = inputValue.split(' ');
      var dateSection = list[0].split('-');
      var timeSection = list[1].split(':');
      int year = int.parse(dateSection[0]);
      int month = int.parse(dateSection[1]);
      int day = int.parse(dateSection[2]);
      int hour = int.parse(timeSection[0]);
      int minute = int.parse(timeSection[1]);
      int second = int.parse(timeSection[2]);
      final startTime = DateTime(year, month, day, hour, minute, second);
      final currentTime = DateTime.now();

      int dayDef = currentTime.difference(startTime).inDays;
      int hourDef = currentTime.difference(startTime).inHours;
      final minDef = currentTime.difference(startTime).inMinutes;
      final secondDef = currentTime.difference(startTime).inSeconds;

      if (dayDef == 0) {
        if (hourDef <= 0) {
          if (minDef <= 0) {
            value = '$secondDef second ago';
          } else {
            value = '$hourDef minutes ago';
          }
        } else {
          value = '$hourDef hour ago';
        }
      } else {
        value = '$dayDef days ago';
      }
    } catch (e) {
      value = inputValue;
    }

    return value;
  }

  static String minMaxReturn({required String min, required String max}) {
    double firstNum = double.tryParse(min) ?? 0;
    double secondNum = double.tryParse(max) ?? 0;

    return firstNum != secondNum
        ? "${firstNum.toStringAsFixed(0)}-${secondNum.toStringAsFixed(0)}"
        : firstNum.toStringAsFixed(0);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension StringMinMaxFormatter on String? {
  static String formatRange({
    required String? min,
    required String? max,
    String? symbol,
  }) {
    num? toNum(String? value) {
      if (value == null || value.trim().isEmpty) return null;
      return num.tryParse(value);
    }

    num? minValue = toNum(min);
    num? maxValue = toNum(max);

    String formatValue(num? value) {
      if (value == null) return '';

      // 🧠 Smart precision logic
      if (value < 0.0001) {
        return value
            .toStringAsFixed(8)
            .replaceFirst(RegExp(r'0+$'), '')
            .replaceFirst(RegExp(r'\.$'), '');
      } else if (value < 1) {
        return value
            .toStringAsFixed(6)
            .replaceFirst(RegExp(r'0+$'), '')
            .replaceFirst(RegExp(r'\.$'), '');
      } else if (value < 1000) {
        return value
            .toStringAsFixed(2)
            .replaceFirst(RegExp(r'0+$'), '')
            .replaceFirst(RegExp(r'\.$'), '');
      } else {
        return value.toStringAsFixed(0);
      }
    }

    String symbolStr = symbol != null ? ' $symbol' : '';

    if (minValue != null && maxValue != null) {
      return '${formatValue(minValue)} - ${formatValue(maxValue)}$symbolStr';
    } else if (minValue != null) {
      return '${formatValue(minValue)}$symbolStr';
    } else if (maxValue != null) {
      return '${formatValue(maxValue)}$symbolStr';
    } else {
      return '';
    }
  }

  double? toNumber() {
    if (this == null || this!.trim().isEmpty) return null;
    return double.tryParse(this!.trim());
  }
}

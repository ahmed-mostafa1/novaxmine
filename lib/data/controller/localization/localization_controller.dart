import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/helper/share_preference_helper.dart';
import 'package:mine_lab/data/model/language/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController {
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  // القيمة الافتراضية للّغة (يمكنك تغييرها لـ ar / SA مثلاً)
  Locale _locale = const Locale('en', 'US');
  bool _isLtr = true;

  // لو عندك قائمة لغات ثابتة في مكان آخر، يمكنك تعبئتها هنا يدويًا
  final List<MyLanguageModel> _languages = [];

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<MyLanguageModel> get languages => _languages;

  void setLanguage(Locale locale, String? imageUrl) {
    Get.updateLocale(locale);
    _locale = locale;
    _isLtr = _locale.languageCode != 'ar';
    saveLanguage(_locale, imageUrl);
    update();
  }

  void loadCurrentLanguage() {
    // استرجاع اللغة من SharedPreferences أو استخدام الافتراضي ('en', 'US')
    final String languageCode =
        sharedPreferences.getString(SharedPreferenceHelper.languageCode) ?? 'en';
    final String countryCode =
        sharedPreferences.getString(SharedPreferenceHelper.countryCode) ?? 'US';

    _locale = Locale(languageCode, countryCode);
    _isLtr = _locale.languageCode != 'ar';
    update();
  }

  void saveLanguage(Locale locale, String? imageUrl) {
    sharedPreferences.setString(
      SharedPreferenceHelper.languageCode,
      locale.languageCode,
    );
    sharedPreferences.setString(
      SharedPreferenceHelper.countryCode,
      locale.countryCode ?? '',
    );
    sharedPreferences.setString(
      SharedPreferenceHelper.languageImagePath,
      imageUrl ?? '',
    );
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }
}

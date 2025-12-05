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

  Locale _locale = const Locale('en', 'US');
  bool _isLtr = true;

  // Define your supported languages locally
  final List<MyLanguageModel> _languages = [
    MyLanguageModel(
      languageName: 'English',
      languageCode: 'en',
      countryCode: 'US',
      imageUrl: 'assets/images/flags/us.png', // Add local flag images
    ),
    MyLanguageModel(
      languageName: 'العربية',
      languageCode: 'ar',
      countryCode: 'SA',
      imageUrl: 'assets/images/flags/sa.png', // Add local flag images
    ),
    // Add more languages as needed
  ];

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<MyLanguageModel> get languages => _languages;

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    _isLtr = _locale.languageCode != 'ar';
    saveLanguage(_locale);
    update();
  }

  void loadCurrentLanguage() {
    final String languageCode =
        sharedPreferences.getString(SharedPreferenceHelper.languageCode) ?? 'en';
    final String countryCode =
        sharedPreferences.getString(SharedPreferenceHelper.countryCode) ?? 'US';

    _locale = Locale(languageCode, countryCode);
    _isLtr = _locale.languageCode != 'ar';
    update();
  }

  void saveLanguage(Locale locale) {
    sharedPreferences.setString(
      SharedPreferenceHelper.languageCode,
      locale.languageCode,
    );
    sharedPreferences.setString(
      SharedPreferenceHelper.countryCode,
      locale.countryCode ?? '',
    );
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }
} 
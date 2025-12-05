import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/data/controller/localization/localization_controller.dart';
import 'package:mine_lab/data/model/language/language_model.dart';

class MyLanguageController extends GetxController {
  LocalizationController localizationController;
  
  MyLanguageController({required this.localizationController});

  bool isLoading = false;
  List<MyLanguageModel> langList = [];

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
  }

  void loadLanguage() {
    isLoading = true;
    update();

    // Get languages from LocalizationController (defined locally)
    langList = localizationController.languages;

    // Find current language index
    String currentCode = localizationController.locale.languageCode;
    int index = langList.indexWhere(
      (element) => element.languageCode.toLowerCase() == currentCode.toLowerCase()
    );

    if (index != -1) {
      changeSelectedIndex(index);
    } else {
      changeSelectedIndex(0); // Default to first language
    }

    isLoading = false;
    update();
  }

  int selectedIndex = 0;
  bool isChangeLangLoading = false;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  void changeLanguage(BuildContext context, int index) async {
    isChangeLangLoading = true;
    update();

    try {
      MyLanguageModel selectedLangModel = langList[index];
      Locale newLocale = Locale(
        selectedLangModel.languageCode,
        selectedLangModel.countryCode,
      );

      // Update locale - this will trigger flutter_localizations to load the .arb file
      localizationController.setLanguage(newLocale);

      // Navigate back
      Get.back();
    } catch (e) {
      debugPrint('Error changing language: $e');
    }

    isChangeLangLoading = false;
    update();
  }
}
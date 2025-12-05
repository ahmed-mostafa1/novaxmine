import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/helper/share_preference_helper.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/data/controller/localization/localization_controller.dart';
import 'package:mine_lab/data/model/general_setting/general_settings_response_model.dart';
import 'package:mine_lab/data/model/global/response_model/response_model.dart';
import 'package:mine_lab/data/repo/auth/general_setting_repo.dart';
import 'package:mine_lab/views/components/snackbar/show_custom_snackbar.dart';

class SplashController extends GetxController {
  final GeneralSettingRepo repo;
  final LocalizationController localizationController;

  SplashController({
    required this.repo,
    required this.localizationController,
  });

  Future<void> gotoNext(BuildContext context) async {
    // Load the saved language (no server call needed)
    localizationController.loadCurrentLanguage();
    
    // Apply the locale to GetX
    Get.updateLocale(localizationController.locale);

    bool isRemember = repo.apiClient.sharedPreferences
            .getBool(SharedPreferenceHelper.rememberMeKey) ??
        false;

    // Fetch general settings (not language related)
    ResponseModel response = await repo.getGeneralSetting();

    if (response.statusCode == 200) {
      final context = Get.context;
      final MyStrings = context != null ? AppLocalizations.of(context)! : null;
      try {
        GeneralSettingResponseModel model =
            GeneralSettingResponseModel.fromJson(
                jsonDecode(response.responseJson));
        if (model.status?.toLowerCase() == "success") {
          repo.apiClient.storeGeneralSetting(model);
          checkAndGo(isRemember);
        } else {
          CustomSnackBar.showCustomSnackBar(
            errorList: model.message?.error ?? [MyStrings!.somethingWentWrong],
            msg: [],
            isError: true,
          );
        }
      } catch (e) {
        CustomSnackBar.showCustomSnackBar(
          errorList: [MyStrings!.somethingWentWrong],
          msg: [],
          isError: true,
        );
      }
    } else {
      CustomSnackBar.showCustomSnackBar(
        errorList: [response.message],
        msg: [],
        isError: true,
      );
    }
  }

  void checkAndGo(bool isRemember) {
    if (repo.apiClient.getFirstTimeAppOpeningStatus() == false) {
      Get.toNamed(RouteHelper.onboardScreen);
    } else {
      if (isRemember) {
        Get.offAndToNamed(RouteHelper.bottomNav);
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAndToNamed(RouteHelper.loginScreen);
        });
      }
    }
  }
}
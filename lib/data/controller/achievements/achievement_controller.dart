import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/util.dart';
import 'package:mine_lab/data/model/achievement/achievement_response_model.dart';
import 'package:mine_lab/data/model/global/response_model/response_model.dart';
import 'package:mine_lab/data/repo/achievement/achievement_repo.dart';
import 'package:mine_lab/views/components/snackbar/show_custom_snackbar.dart';

class AchievementController extends GetxController {
  final AchievementRepo achievementRepo;

  AchievementController({required this.achievementRepo});

  List<LockBadge> lockBadges = [];
  List<UnLockBadge> unlockBadges = [];
  String? badgePath;
  bool isLoading = false;

  Future<void> getAchievement() async {
    isLoading = true;
    update();
    try {
      final ResponseModel responseModel =
          await achievementRepo.getAchievement();
      if (responseModel.statusCode == 200) {
        final AchievementResponseModel model =
            AchievementResponseModel.fromJson(
          jsonDecode(responseModel.responseJson),
        );

        if ((model.status ?? '').toLowerCase() == 'success') {
          lockBadges = model.data?.lockBadges ?? [];
          unlockBadges = model.data?.unlockBadges ?? [];
          badgePath = model.data?.badgePath;

          if (unlockBadges.isNotEmpty) {
            lockBadges.removeWhere(
              (lock) => unlockBadges.any(
                (unlock) => unlock.badgeId == lock.id,
              ),
            );
          }

          update();
        } else {
          // استبدال MyStrings.somethingWentWrong برسالة ثابتة عامة
          CustomSnackBar.error(
            errorList: model.message?.error ?? ['Something went wrong'],
          );
        }
      } else {
        CustomSnackBar.error(errorList: [responseModel.message]);
      }
    } catch (e) {
      if (kDebugMode) {
        printX(e);
      }
      CustomSnackBar.error(errorList: ['Unexpected error occurred']);
    } finally {
      isLoading = false;
      update();
    }
  }
}

import 'package:mine_lab/core/utils/method.dart';
import 'package:mine_lab/core/utils/url_container.dart';
import 'package:mine_lab/data/model/global/response_model/response_model.dart';
import 'package:mine_lab/data/services/api_service.dart';

class AchievementRepo {
  final ApiClient apiClient;

  AchievementRepo({required this.apiClient});

  Future<ResponseModel> getAchievement() async {
    return await apiClient.request(
        UrlContainer.achievementEndPoint, Method.getMethod, null,
        passHeader: true);
  }
}

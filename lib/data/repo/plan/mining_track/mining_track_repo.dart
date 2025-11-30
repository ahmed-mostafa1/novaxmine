import 'package:mine_lab/core/utils/method.dart';
import 'package:mine_lab/core/utils/url_container.dart';
import 'package:mine_lab/data/model/global/response_model/response_model.dart';
import 'package:mine_lab/data/services/api_service.dart';

class MiningTrackRepo {
  ApiClient apiClient;
  MiningTrackRepo({required this.apiClient});

  Future<ResponseModel> getMiningTracksData(int page, {bool isOrder = false}) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.order}?page=$page";
    String url1 = "${UrlContainer.baseUrl}${UrlContainer.miningTrackEndPoint}?page=$page";
    // String url = "${UrlContainer.baseUrl}api/mining-tracks";
    ResponseModel responseModel = await apiClient.request(isOrder ? url : url1, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}

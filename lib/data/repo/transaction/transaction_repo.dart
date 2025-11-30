import 'package:mine_lab/core/utils/method.dart';
import 'package:mine_lab/core/utils/url_container.dart';
import 'package:mine_lab/data/model/global/response_model/response_model.dart';
import 'package:mine_lab/data/services/api_service.dart';

class TransactionRepo {
  ApiClient apiClient;
  TransactionRepo({required this.apiClient});

  Future<ResponseModel> getTransactionList(
    int page, {
    String type = "",
    String remark = "",
    String searchText = "",
    String currency = "",
    String walletType = "",
  }) async {
    if (type.toLowerCase() == "all" || (type.toLowerCase() != 'plus' && type.toLowerCase() != 'minus')) {
      type = '';
    }

    if (remark.isEmpty || remark.toLowerCase() == "all") {
      remark = '';
    }

    if (currency.isEmpty || currency.toLowerCase() == "all") {
      currency = '';
    }

    if (walletType.isEmpty || walletType.toLowerCase() == "all") {
      walletType = '';
    } else {
      walletType = walletType.toLowerCase().contains("deposit")
          ? '1'
          : walletType.toLowerCase().contains("earning")
              ? '2'
              : walletType.toLowerCase().contains("coin")
                  ? '3'
                  : '';
    }

    String url = '${UrlContainer.baseUrl}${UrlContainer.transactionEndpoint}?page=$page&type=$type&remark=$remark&search=$searchText&currency=$currency&wallet_type=$walletType';
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}

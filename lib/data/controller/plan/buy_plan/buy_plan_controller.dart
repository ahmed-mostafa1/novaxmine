import 'dart:convert';

import 'package:get/get.dart';
import 'package:mine_lab/core/helper/string_format_helper.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/core/utils/util.dart';
import 'package:mine_lab/data/model/global/response_model/response_model.dart';
import 'package:mine_lab/data/model/plan/buy_plan/buy_plan_submit_response_model.dart';
import 'package:mine_lab/data/model/plan/buy_plan/buy_plan_response_model.dart';
import 'package:mine_lab/data/repo/plan/buy_plan/buy_plan_repo.dart';
import 'package:mine_lab/views/components/snackbar/show_custom_snackbar.dart';

class BuyPlanController extends GetxController {
  BuyPlanRepo buyPlanRepo;
  BuyPlanController({required this.buyPlanRepo});

  bool isLoading = true;
  int walletIndex = 0;

  List<Miners> walletList = [];
  List<ActivePlans> planList = [];

  List<String> paymentSystemList = [];
  String? selectPaymentSystem; // Made nullable for hint to work

  String currency = "";
  String currencySym = "";

  Future<void> initialValue() async {
    currency = buyPlanRepo.apiClient.getCurrencyOrUsername(isCurrency: true);
    currencySym = buyPlanRepo.apiClient.getCurrencyOrUsername(isSymbol: true);

    // Initialize payment system list with placeholder keys
    // These will be replaced with actual localized values in loadBuyPlanData
    final context = Get.context;
    if (context != null) {
      final MyStrings = AppLocalizations.of(context)!;
      paymentSystemList = [
        MyStrings.fromBalance ?? "From Balance",
        MyStrings.fromProfitWallet ?? "From Profit Wallet",
        MyStrings.directPayment ?? "Direct Payment",
      ];
    } else {
      paymentSystemList = [
        "From Balance",
        "From Profit Wallet",
        "Direct Payment",
      ];
    }

    update();
    loadBuyPlanData();
  }

  void setPaymentMethod(String value) {
    selectPaymentSystem = value;
    update();
  }

  /// load plan
  Future<void> loadBuyPlanData() async {
    final context = Get.context;
    final MyStrings = context != null ? AppLocalizations.of(context)! : null;
    currency = buyPlanRepo.apiClient.getCurrencyOrUsername();

    ResponseModel responseModel = await buyPlanRepo.getBuyPlanData();
    if (responseModel.statusCode == 200) {
      BuyPlanResponseModel model =
          BuyPlanResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if (model.status.toString().toLowerCase() == 'success') {
        // Update payment system list with localized strings and balance values
        paymentSystemList = [
          "${MyStrings?.fromBalance ?? "From Balance"} ($currencySym${MyConverter.twoDecimalPlaceFixedWithoutRounding(model.data?.balance ?? "0")})",
          "${MyStrings?.fromProfitWallet ?? "From Profit Wallet"} ($currencySym${MyConverter.twoDecimalPlaceFixedWithoutRounding(model.data?.profitBalance ?? "0")})",
          MyStrings?.directPayment ?? "Direct Payment",
        ];

        walletList = model.data?.miners ?? [];
        changeWallet(walletIndex);
      } else {
        CustomSnackBar.showCustomSnackBar(
            errorList: model.message?.error ??
                [MyStrings?.somethingWentWrong ?? 'Something went Wrong'],
            msg: [],
            isError: true);
      }
    } else {
      CustomSnackBar.showCustomSnackBar(
          errorList: [responseModel.message], msg: [], isError: true);
    }
    isLoading = false;
    update();
  }

  void changeWallet(int index) {
    walletIndex = index;
    Miners wallet = walletList[index];
    planList = wallet.activePlans ?? [];
    selectedIndex = planList.isNotEmpty
        ? selectedIndex > 0
            ? selectedIndex
            : 0
        : -1;
    update();
  }

  bool purchaseLoading = false;
  Future<void> planPurchase({required int planId}) async {
    purchaseLoading = true;
    update();

    printX(selectPaymentSystem);

    // Determine payment method based on selected index
    // Index 0 -> balance (method 1)
    // Index 1 -> profit wallet (method 3)
    // Index 2 -> direct payment (method 2)
    String method = paymentSystemList.indexOf(selectPaymentSystem!).toString();
    String paymentMethod = method == "0"
        ? "1" // From Balance
        : method == "1"
            ? "3" // From Profit Wallet
            : "2"; // Direct Payment

    printX(method);
    printX("request $paymentMethod");

    ResponseModel responseModel = await buyPlanRepo.planPurchase(
        planId: planId.toString(), paymentMethod: paymentMethod.toString());
    final context = Get.context;
    final MyStrings = context != null ? AppLocalizations.of(context)! : null;
    if (responseModel.statusCode == 200) {
      BuyPlanSubmitResponseModel model = BuyPlanSubmitResponseModel.fromJson(
          jsonDecode(responseModel.responseJson));
      if (model.status.toString().toLowerCase() == 'success') {
        Get.back();
        if (paymentMethod.toString() == '1' || paymentMethod == '3') {
          selectPaymentSystem = null; // Reset to null
          CustomSnackBar.success(
              successList: [MyStrings?.requestSuccess ?? "Success"]);
          loadBuyPlanData();
        } else {
          String title = model.data?.order?.planTitle ?? '';
          String amount = model.data?.order?.amount ?? '';
          String orderId = model.data?.order?.orderId ?? '';
          Get.toNamed(RouteHelper.planPaymentMethodScreen,
              arguments: [title, amount, orderId]);
        }
      } else {
        CustomSnackBar.showCustomSnackBar(
            errorList: [MyStrings?.requestFail ?? "Failed"],
            msg: [],
            isError: true);
      }
    } else {
      CustomSnackBar.showCustomSnackBar(
          errorList: [MyStrings?.requestFail ?? "Failed"], msg: [], isError: true);
    }

    purchaseLoading = false;
    update();
    return;
  }

  int selectedIndex = -1;
  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}

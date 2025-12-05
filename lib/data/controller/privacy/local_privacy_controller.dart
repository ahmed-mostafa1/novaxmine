import 'package:get/get.dart';
import 'package:mine_lab/data/model/policy/local_policy_model.dart';

class LocalPrivacyController extends GetxController {
  bool isLoading = false;
  int selectedIndex = 0;
  List<LocalPolicyModel> policyList = [];

  @override
  void onInit() {
    super.onInit();
    loadLocalPolicies();
  }

  void loadLocalPolicies() {
    isLoading = true;
    update();

    // Define your policies with localization keys
    policyList = [
      LocalPolicyModel(
        id: 100,
        titleKey: 'policyTermsOfService',
        descriptionKey: 'policyTermsOfServiceDesc',
        slug: 'terms-of-service',
      ),
      LocalPolicyModel(
        id: 101,
        titleKey: 'policyCookiePolicy',
        descriptionKey: 'policyCookiePolicyDesc',
        slug: 'cookie-policy',
      ),
      LocalPolicyModel(
        id: 102,
        titleKey: 'policyUsagePolicy',
        descriptionKey: 'policyUsagePolicyDesc',
        slug: 'usage-policy',
      ),
    ];

    isLoading = false;
    update();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  String getSelectedDescriptionKey() {
    if (policyList.isEmpty) return '';
    return policyList[selectedIndex].descriptionKey;
  }
}


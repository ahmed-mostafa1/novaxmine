import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/utils/dimensions.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/data/controller/privacy/local_privacy_controller.dart';
import 'package:mine_lab/data/controller/privacy/privacy_controller.dart';
import 'package:mine_lab/data/repo/privacy_repo/privacy_repo.dart';
import 'package:mine_lab/data/services/api_service.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/views/components/appbar/custom_appbar.dart';
import 'package:mine_lab/views/components/buttons/category_button.dart';
import 'package:mine_lab/views/components/custom_loader.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(LocalPrivacyController());
  }

  @override
  void dispose() {
    Get.delete<LocalPrivacyController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myStrings = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: MyColor.screenBgColor,
      appBar: CustomAppBar(
        title: myStrings.privacyPolicy,
        bgColor: MyColor.primaryColor,
        isShowActionBtn: true,
      ),
      body: GetBuilder<LocalPrivacyController>(
        builder: (controller) => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category tabs
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.space10,
                  top: Dimensions.space15,
                ),
                child: SizedBox(
                  height: 30,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        controller.policyList.length,
                        (index) => Row(
                          children: [
                            CategoryButton(
                              color: controller.selectedIndex == index
                                  ? MyColor.primaryColor
                                  : MyColor.colorWhite,
                              horizontalPadding: 8,
                              verticalPadding: 7,
                              textColor: controller.selectedIndex == index
                                  ? MyColor.colorWhite
                                  : MyColor.colorBlack,
                              text: _getLocalizedString(
                                myStrings,
                                controller.policyList[index].titleKey,
                              ),
                              press: () {
                                controller.changeIndex(index);
                              },
                            ),
                            const SizedBox(width: Dimensions.space10)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space15),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Text(
                      _getLocalizedString(
                        myStrings,
                        controller.getSelectedDescriptionKey(),
                      ),
                      style: interRegularDefault.copyWith(
                        color: Colors.black,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to get localized string by key
  String _getLocalizedString(AppLocalizations strings, String key) {
    switch (key) {
      // Titles
      case 'policyTermsOfService':
        return strings.policyTermsOfService;
      case 'policyCookiePolicy':
        return strings.policyCookiePolicy;
      case 'policyUsagePolicy':
        return strings.policyUsagePolicy;

      // Descriptions
      case 'policyTermsOfServiceDesc':
        return strings.policyTermsOfServiceDesc;
      case 'policyCookiePolicyDesc':
        return strings.policyCookiePolicyDesc;
      case 'policyUsagePolicyDesc':
        return strings.policyUsagePolicyDesc;

      default:
        return '';
    }
  }
}

/* 
4. Add to your app_en.arb file:
{
  "privacyPolicy": "Privacy Policy",
  
  "policyTermsOfService": "Terms of Service",
  "policyTermsOfServiceDesc": "We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating.\n\n• Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.\n\n• Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.\n\n• Emergency Support - We do not provide emergency support / Phone Support / LiveChat Support. Support may take some hours sometimes.\n\n• Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.\n\n• We Don't support any child porn or such material.\n\n• No spam-related sites or material.\n\n• No harassing material that may cause people to retaliate against you.\n\n• No phishing pages.\n\n• Malicious Botnets are strictly forbidden.\n\n• Resource and cronjob abuse is forbidden and will result in suspension or termination.",
  
  "policyCookiePolicy": "Cookie Policy",
  "policyCookiePolicyDesc": "Terms & Conditions for Users\n\nBefore getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines.\n\nSupport\n\nWhenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue.\n\nOwnership\n\nYou may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them.\n\nWarranty\n\nWe don't offer any guarantee or assurance of these Services in any way. When our Services have been modified we can't ensure they will work with all outsider plugins.\n\nUnauthorized/Illegal Usage\n\nYou may not utilize our things for any illicit or unapproved reason. You can't imitate, copy, duplicate, sell, exchange or adventure any of our segment without express composed consent.",
  
  "policyUsagePolicy": "Usage Policy",
  "policyUsagePolicyDesc": "We endeavor to make our clients happy with the item they've bought from us. In case you're experiencing difficulty with excellent items or trust it is blemished, please present a pass to our Helpdesk.\n\nRefund Is Not Possible When:\n\n• The framework turns out great on your side yet includes don't match or you may have thought something different.\n\n• Your necessities are currently modified and you needn't bother with the Script anymore.\n\n• You end up discovering some other Software which you believe is better.\n\n• You don't need a site or administration right now.\n\n• Our highlights don't address your issues and prerequisites.\n\n• You don't have such an environment for your worker to run our framework.\n\n• On the off chance that you as of now download our framework.\n\nNo returns/refunds will be offered for digital products except if the product you've purchased is:\n\n• Completely non-functional / not same as demo.\n\n• If you've opened a support ticket but you didn't get any response in 48 hours (2 Business days).\n\n• The product description was fully misleading."
}

5. Add to your app_ar.arb file:
{
  "privacyPolicy": "سياسة الخصوصية",
  
  "policyTermsOfService": "شروط الخدمة",
  "policyTermsOfServiceDesc": "نحن ندعي كل السلطة لرفض أو إنهاء أو تعطيل أي مساعدة مع أو بدون سبب حسب تقدير المسؤول. هذا استضافة مستقلة تماماً.\n\n• طلبات التكوين - إذا كان لديك خادم مخصص مُدار بالكامل معنا، فإننا نقدم تكوينات PHP/MySQL المخصصة وجدران الحماية لعناوين IP المخصصة وتكوينات DNS وhttpd.\n\n• طلبات البرامج - سيتم منح تثبيت إضافة Cpanel طالما أنها لا تتعارض مع الأمان والاستقرار والأداء للمستخدمين الآخرين على الخادم.\n\n• الدعم الطارئ - لا نقدم دعماً طارئاً / دعم هاتفي / دعم الدردشة المباشرة. قد يستغرق الدعم بعض الساعات أحياناً.\n\n• النسخ الاحتياطية - نحتفظ بنسخ احتياطية لكننا لسنا مسؤولين عن فقدان البيانات، أنت المسؤول الكامل عن جميع النسخ الاحتياطية.\n\n• نحن لا ندعم أي محتوى إباحي للأطفال أو ما شابه ذلك.\n\n• لا توجد مواقع أو مواد متعلقة بالبريد العشوائي.\n\n• لا توجد مواد مضايقة قد تتسبب في انتقام الناس منك.\n\n• لا صفحات تصيد.\n\n• شبكات الروبوتات الضارة محظورة بشكل صارم.\n\n• إساءة استخدام الموارد و cronjob محظورة وستؤدي إلى التعليق أو الإنهاء.",
  
  "policyCookiePolicy": "سياسة ملفات تعريف الارتباط",
  "policyCookiePolicyDesc": "الشروط والأحكام للمستخدمين\n\nقبل الوصول إلى هذا الموقع، فإنك توافق على الالتزام بشروط وأحكام استخدام هذا الموقع وكل القوانين والإرشادات المناسبة.\n\nالدعم\n\nعندما تقوم بتنزيل عنصرنا، يمكنك الاتصال بنا للحصول على المساعدة عبر البريد الإلكتروني وسنبذل قصارى جهدنا لحل مشكلتك.\n\nالملكية\n\nلا يجوز لك ضمان الملكية الفكرية أو الحصرية لأي من عناصرنا، المعدلة أو غير المعدلة. جميع العناصر هي ملكيتنا، قمنا بإنشائها.\n\nالضمان\n\nنحن لا نقدم أي ضمان أو تأكيد لهذه الخدمات بأي شكل من الأشكال. عندما يتم تعديل خدماتنا، لا يمكننا ضمان أنها ستعمل مع جميع المكونات الإضافية الخارجية.\n\nالاستخدام غير المصرح به / غير القانوني\n\nلا يجوز لك استخدام عناصرنا لأي غرض غير قانوني أو غير مصرح به. لا يمكنك تكرار أو نسخ أو بيع أو تداول أو استغلال أي من قسمنا بدون موافقة كتابية صريحة.",
  
  "policyUsagePolicy": "سياسة الاستخدام",
  "policyUsagePolicyDesc": "نسعى جاهدين لإسعاد عملائنا بالعنصر الذي اشتروه منا. في حالة واجهتك مشكلة مع العناصر الممتازة أو تعتقد أنها معيبة، يرجى تقديم تذكرة إلى مكتب المساعدة الخاص بنا.\n\nاسترداد الأموال غير ممكن عندما:\n\n• يعمل النظام بشكل رائع من جانبك ولكن لا تتطابق الميزات أو ربما فكرت في شيء مختلف.\n\n• احتياجاتك معدلة الآن ولا تحتاج إلى البرنامج النصي بعد الآن.\n\n• ينتهي بك الأمر باكتشاف بعض البرامج الأخرى التي تعتقد أنها أفضل.\n\n• أنت لا تحتاج إلى موقع ويب أو إدارة في الوقت الحالي.\n\n• ميزاتنا لا تعالج مشكلاتك ومتطلباتك.\n\n• ليس لديك مثل هذه البيئة لعاملك لتشغيل نظامنا.\n\n• في حالة قيامك بالفعل بتنزيل نظامنا.\n\nلن يتم تقديم عوائد / استرداد الأموال للمنتجات الرقمية إلا إذا كان المنتج الذي اشتريته:\n\n• غير عملي تماماً / ليس مثل العرض التوضيحي.\n\n• إذا كنت قد فتحت تذكرة دعم ولكنك لم تحصل على أي رد في 48 ساعة (يومي عمل).\n\n• كان وصف المنتج مضللاً تماماً."
}
*/

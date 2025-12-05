import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mine_lab/core/helper/share_preference_helper.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/core/theme/dark.dart';
import 'package:mine_lab/data/controller/localization/localization_controller.dart';
import 'package:mine_lab/data/services/push_notification_service.dart';
import 'package:mine_lab/firebase_options.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di_service/di_services.dart' as di_service;
import 'core/theme/light/light.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  sharedPreferences.setBool(SharedPreferenceHelper.hasNewNotificationKey, true);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di_service.init();
  
  // Initialize LocalizationController early
  final sharedPreferences = Get.find<SharedPreferences>();
  Get.put(LocalizationController(sharedPreferences: sharedPreferences));
  
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  await PushNotificationService(apiClient: Get.find()).setupInteractedMessage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        return GetMaterialApp(
          title: "Novaxmine",
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: RouteHelper.splashScreen,
          navigatorKey: Get.key,
          getPages: RouteHelper.routes,
          theme: lightThemeData,
          darkTheme: darkThemeData,
          
          // ✅ Use LocalizationController's saved locale instead of device locale
          locale: localizationController.locale,
          fallbackLocale: const Locale('en', 'US'), // Changed to English as fallback
          
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'SA'),
            // Add more supported locales here
          ],
          
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
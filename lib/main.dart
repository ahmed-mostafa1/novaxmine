import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mine_lab/core/helper/share_preference_helper.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/core/theme/dark.dart';
import 'package:mine_lab/data/controller/localization/localization_controller.dart';

import 'package:mine_lab/firebase_options.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di_service/di_services.dart' as di_service;
import 'core/theme/light/light.dart';
import 'package:flutter/widgets.dart';

// ✅ Added: token logger (permission + token print)
Future<void> _logFcmToken() async {
  try {
    // Android 13+ needs runtime notification permission for showing notifications
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint('FCM permission: ${settings.authorizationStatus}');

    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('FCM TOKEN: $token');

    // Optional: log token refresh (useful after reinstall / token changes)
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      debugPrint('FCM TOKEN REFRESHED: $newToken');
    });
  } catch (e) {
    debugPrint('FCM token log failed: $e');
  }
}

Future<void> _messageHandler(RemoteMessage message) async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint("Firebase init failed (likely duplicate): $e");
  }

  // ✅ Optional: log message basics (doesn’t affect your logic)
  debugPrint('BG messageId: ${message.messageId}');
  debugPrint('BG data: ${message.data}');
  debugPrint(
      'BG notification: ${message.notification?.title} / ${message.notification?.body}');

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  sharedPreferences.setBool(SharedPreferenceHelper.hasNewNotificationKey, true);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint("Firebase init failed (likely duplicate): $e");
  }

  // ✅ Added: log permission + token after Firebase init
  await _logFcmToken();

  await di_service.init();

  // Initialize LocalizationController early
  final sharedPreferences = Get.find<SharedPreferences>();
  Get.put(LocalizationController(sharedPreferences: sharedPreferences));

  FirebaseMessaging.onBackgroundMessage(_messageHandler);

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
          fallbackLocale:
              const Locale('en', 'US'), // Changed to English as fallback

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

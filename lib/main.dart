import 'dart:isolate';
import 'dart:math';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/bindings/bindings.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/Braceletdisconnected.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
import 'package:knowplesy/traduction/trans.dart';
import 'app/config/app_routing.dart';
import 'app/storage/secure_storage.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'traduction/localNotif.dart';

printHello() async {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");

  LocalNotificationService service = LocalNotificationService();
  service.intialize();
  await service.showNotification(
      id: 0,
      title: "Panodol reminder",
      body:
          "if you dont cancel the alert the following caregivers will be notified");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  String? lan = SecureStorage.readSecureData('lan');
  if (lan != null) {
    if (lan == "en") {
      var locale = Locale('en', 'US');

      Get.updateLocale(locale);
    } else {
      var locale = Locale('fr', 'Fr');
      Get.updateLocale(locale);
    }
  }
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  runApp(MyApp());
  final int helloAlarmID = 0;
}

class MyApp extends StatelessWidget {
  int _counter = 0;
  late final LocalNotificationService service;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      fallbackLocale: LocalizationService.fallbackLocale,
      debugShowCheckedModeBanner: false,
      initialBinding: AllBindings(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 75,
        splash: Image.asset("assets/images/logo_knowlepsy.png"),
        nextScreen: SecureStorage.readSecureData('token') != null
            ? Braceletdisconnected()
            : LoginPage(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: AppColors.primaryColor,
      ),
      getPages: AppRouting.pages,
    );
  }
}

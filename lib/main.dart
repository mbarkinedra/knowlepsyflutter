import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/bindings/bindings.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
import 'package:knowplesy/presentation/pages/login_page/reset_password/reset_password.dart';

import 'app/config/app_routing.dart';
import 'app/storage/account_info_storage.dart';
import 'app/storage/secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("*" * 10);
    print(SecureStorage.readSecureData('token') != null);
    print(SecureStorage.readSecureData('token'));
    print("*" * 10);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AllBindings(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 75,
        splash: Image.asset("assets/images/logo_knowlepsy.png"),
        nextScreen: SecureStorage.readSecureData('token') != null
            ? HomePage()
            : LoginPage(),
        //nextScreen: HomePage(),

        splashTransition: SplashTransition.slideTransition,
        backgroundColor: AppColors.primaryColor,
      ),
      getPages: AppRouting.pages,
    );
  }
}

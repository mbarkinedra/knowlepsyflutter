import 'dart:math';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/bindings/bindings.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
import 'package:knowplesy/presentation/pages/login_page/reset_password/reset_password.dart';
import 'package:knowplesy/world_language.dart';
import 'app/config/app_routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: WorldLanguage(), //Language class from world_languages.dart
      locale:
          Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en',
          'US'), // specify the fallback locale in case an invalid locale is selected.

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // supportedLocales: [
      //   const Locale('en', ''), // English, no country code
      //   const Locale('fr', ''), // Spanish, no country code
      // ],
      initialBinding: AllBindings(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 75,
        splash: Image.asset("assets/images/logo_knowlepsy.png"),
        nextScreen: LoginPage(),
        //nextScreen: HomePage(),

        splashTransition: SplashTransition.slideTransition,
        backgroundColor: AppColors.primaryColor,
      ),
      getPages: AppRouting.pages,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/util/app_colors.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(builder: (logic) {
        return Scaffold(
          body: logic.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            selectedItemColor: AppColors.IconColor,
            currentIndex: logic.navigatorValue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: logic.changeSelectedValue,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_home.png")),
                  label: "home".tr),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_seizure.png')),
                  label: "seizure".tr),
              BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage('assets/images/icon_medecine.png')),
                  label: "medecine".tr),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_settings.png')),
                label: "setting".tr,
              )
            ],
          ),
        );
      }),
    );
  }
}

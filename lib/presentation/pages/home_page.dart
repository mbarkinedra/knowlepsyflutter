import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/config/app_colors.dart';
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
            //backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
            selectedItemColor: AppColors.IconColor,
            currentIndex: logic.navigatorValue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: logic.changeSelectedValue,
            items: [
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage("assets/images/icon_home.png")), label: "Home"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_seizure.png')), label: "Seizure"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_medecine.png')), label: "Medecine"),
              BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage('assets/images/icon_settings.png')), label: "Setting"),
            ],
          ),
        );
      }),
    );
  }
}
